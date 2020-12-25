import 'package:flutter/material.dart';

import './ext/welcome.dart';
import 'ext/auth/register/signup1/steps/signup_step_1.dart';
import 'ext/auth/register/signup1/steps/signup_step_2.dart';
import 'ext/auth/register/signup1/steps/signup_step_3.dart';
import 'ext/auth/register/signup1/steps/signup_step_4.dart';
import 'ext/auth/register/signup1/steps/signup_step_5.dart';
import 'ext/auth/register/signup1/steps/signup_step_6.dart';
import 'ext/splash_screen.dart';
import 'int/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        //'/': (context) => SplashScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/step1': (context) => Step1(),
        '/step2': (context) => Step2(),
        '/step3': (context) => Step3(),
        Step4.routename: (context) => Step4(),
        Step5.routename: (context) => Step5(),
        Step6.routename: (context) => Step6(),
        Welcome.routename: (context) => Welcome(),
        Tabscreen.routename: (context) => Tabscreen(),
      },
    );
  }
}
