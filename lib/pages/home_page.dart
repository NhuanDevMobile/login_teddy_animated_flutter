import 'package:flutter/material.dart';
import 'package:login_teddy_animated/utlis/colors.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: AppColors.brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/merry_chirstmas.json'),
              Text(
                "From Nhuan DEV With Love",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }
}
