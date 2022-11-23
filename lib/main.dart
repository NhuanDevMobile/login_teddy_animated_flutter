import 'package:flutter/material.dart';
import 'package:login_teddy_animated/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Colors.red,
          contentTextStyle: TextStyle(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
