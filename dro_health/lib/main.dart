import 'package:dro_health/int/appointments/routes/Appointments/app_app.dart';
import 'package:dro_health/int/appointments/routes/Cases/app_cases.dart';
import 'package:dro_health/int/appointments/routes/Diagnostics/app_diagnostics.dart';
import 'package:dro_health/int/appointments/routes/Messages/app_messages.dart';
import 'package:dro_health/int/appointments/routes/Notes/app_notes.dart';
import 'package:dro_health/int/appointments/routes/Orders/app_orders.dart';
import 'package:dro_health/int/appointments/routes/Orders/routes/add_edit_product.dart';
import 'package:dro_health/int/appointments/routes/Prescriptions/app_presc.dart';
import 'package:dro_health/int/home/routes/order_med/product_details.dart';
import 'package:dro_health/providers/auth.dart';
import 'package:dro_health/providers/cart.dart';
import 'package:dro_health/providers/drug_products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './ext/welcome.dart';
import 'ext/auth/login/login.dart';
import 'ext/auth/register/signup1/steps/signup_step_1.dart';
import 'ext/auth/register/signup1/steps/signup_step_2.dart';
import 'ext/auth/register/signup1/steps/signup_step_3.dart';
import 'ext/auth/register/signup1/steps/signup_step_4.dart';
import 'ext/auth/register/signup1/steps/signup_step_5.dart';
import 'ext/auth/register/signup1/steps/signup_step_6.dart';
import 'ext/auth/register/signup1/steps/success_screen.dart';
import 'ext/splash_screen.dart';
import 'int/home/home.dart';
import 'int/profile/routes/edit_info.dart';
import 'int/tab_screen.dart';
import 'models/drug_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => UserDataReg()),
        ChangeNotifierProvider(create: (context) => DrugProducts()),
        ChangeNotifierProvider(create: (context) => Cart()),
        // ignore: missing_required_param
        ChangeNotifierProvider(create: (context) => (DrugProduct()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            /*if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            }*/
            if (snapshot.hasData) {
              return Tabscreen();
            }
            return Welcome();
          },
        ),
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
          ProductDetails.routename: (context) => ProductDetails(),
          AddEditProduct.routename: (context) => AddEditProduct(),
          Success.routename: (context) => Success(),
          Login.routename: (context) => Login(),
          EditInfo.routename: (context) => EditInfo(),
        },
      ),
    );
  }
}
