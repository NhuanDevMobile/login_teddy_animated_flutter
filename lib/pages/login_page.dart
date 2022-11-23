import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:login_teddy_animated/component/tracking_text_input.dart';
import 'package:login_teddy_animated/pages/login_controller.dart';
import 'package:login_teddy_animated/utlis/colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          print("Nhuan");
          FocusScope.of(context).requestFocus(new FocusNode());
          loginController.teddyController.coverEyes(false);
          loginController.teddyController.lookAt(null);
        },
        child: Stack(
          children: [
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColors.upperGradientColor,
                    AppColors.lowerGradientColor
                  ],
                ),
              ),
            )),
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Container(
                        height: 200,
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: FlareActor(
                          "assets/Teddy.flr",
                          shouldClip: false,
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.contain,
                          controller: loginController.teddyController,
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Form(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Nhuan DEV",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: AppColors.upperGradientColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TrackingTextInput(
                                  label: "Email",
                                  hint: "Nhập vào email",
                                  onTextChanged: (String value) {
                                    loginController.email = value;
                                  },
                                  onCaretMoved: (Offset? caret) {
                                    loginController.teddyController
                                        .coverEyes(false);
                                    loginController.teddyController
                                        .lookAt(caret);
                                  }),
                              TrackingTextInput(
                                label: "Mật khẩu",
                                hint: "Nhập vào mật khẩu",
                                isObscured: true,
                                onCaretMoved: (Offset? caret) {
                                  loginController.teddyController
                                      .coverEyes(caret != null);
                                  loginController.teddyController.lookAt(null);
                                },
                                onTextChanged: (String value) {
                                  loginController.teddyController
                                      .setPassword(value);
                                  loginController.password = value;
                                },
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    loginController.onLogin(context);
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                    ),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 40)),
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.upperGradientColor),
                                  ),
                                  child: Obx(
                                    () => loginController.isLoading.value
                                        ? Container(
                                            width: 50,
                                            child: const SpinKitThreeBounce(
                                              color: Colors.white,
                                              size: 25.0,
                                            ),
                                          )
                                        : const Text(
                                            'Đăng nhập',
                                            style: TextStyle(
                                              fontFamily: 'Nunito',
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  )),
                            ],
                          )),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
