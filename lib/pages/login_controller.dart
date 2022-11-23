import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_teddy_animated/pages/home_page.dart';
import 'package:login_teddy_animated/teddy_controller.dart';

class LoginController extends GetxController {
  late TeddyController teddyController;
  RxBool isLoading = false.obs;
  String email = '';
  String password = '';
  @override
  void onInit() {
    super.onInit();
    teddyController = TeddyController();
  }

  bool isEmailValid(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  void _showSnackBar(String title, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title, textAlign: TextAlign.center),
      ),
    );
  }

  void onLogin(BuildContext context) async {
    if (email.isEmpty && password.isEmpty) {
      _showSnackBar('Vui lòng nhập đầy đủ thông tin', context);
      teddyController.coverEyes(false);
      teddyController.play('fail');
    } else {
      if (isEmailValid(email)) {
        isLoading.value = true;
        Future.delayed(Duration(seconds: 2), () {
          if (password == "Nhuan@123" && email == "nhuandev@gmail.com") {
            teddyController.coverEyes(false);
            teddyController.play("success");
            isLoading.value = false;
            Future.delayed(const Duration(seconds: 1)).then(
              (_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            );
          } else {
            teddyController.coverEyes(false);
            teddyController.play("fail");
            _showSnackBar('Mật khẩu và tài khoản không chính xác', context);
            isLoading.value = false;
          }
        });
      } else {
        teddyController.coverEyes(false);
        teddyController.play('fail');
        _showSnackBar('Bạn chưa nhập đúng định dạng email', context);
      }
    }
  }
}
