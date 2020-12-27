import 'package:dro_health/int/appointments/routes/Appointments/app_app.dart';
import 'package:dro_health/int/appointments/routes/Cases/app_cases.dart';
import 'package:dro_health/int/appointments/routes/Diagnostics/app_diagnostics.dart';
import 'package:dro_health/int/appointments/routes/Messages/app_messages.dart';
import 'package:dro_health/int/appointments/routes/Notes/app_notes.dart';
import 'package:dro_health/int/appointments/routes/Orders/app_orders.dart';
import 'package:dro_health/int/appointments/routes/Prescriptions/app_presc.dart';
import 'package:dro_health/providers/drug_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './ext/welcome.dart';
import 'ext/auth/register/signup1/steps/signup_step_1.dart';
import 'ext/auth/register/signup1/steps/signup_step_2.dart';
import 'ext/auth/register/signup1/steps/signup_step_3.dart';
import 'ext/auth/register/signup1/steps/signup_step_4.dart';
import 'ext/auth/register/signup1/steps/signup_step_5.dart';
import 'ext/auth/register/signup1/steps/signup_step_6.dart';
import 'ext/splash_screen.dart';
import 'int/home/home.dart';
import 'int/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DrugProducts(),
      child: MaterialApp(
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
          AppNotesScreen.routename: (context) => AppNotesScreen(),
          AppAppScreen.routename: (context) => AppAppScreen(),
          AppPrescScreen.routename: (context) => AppPrescScreen(),
          AppCasesScreen.routename: (context) => AppCasesScreen(),
          AppMessagesScreen.routename: (context) => AppMessagesScreen(),
          AppDiagnosticsScreen.routename: (context) => AppDiagnosticsScreen(),
          AppOrdersScreen.routename: (context) => AppOrdersScreen(),
          Home.routename: (context) => Home(),
        },
      ),
    );
  }
}
