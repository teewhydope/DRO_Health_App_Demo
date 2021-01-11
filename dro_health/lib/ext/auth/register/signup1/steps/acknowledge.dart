import 'package:dro_health/ext/auth/register/signup1/steps/signup_step_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../data.dart';

class Acknowledge extends StatelessWidget {
  final acknowledgement = Acknowledgement;
  final isGreen = Color.fromRGBO(12, 184, 182, 1);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isGreen,
      statusBarBrightness: Brightness.dark, // as you need dark or light
    ));
    //final userData = UserDataReg(null, null, null, null, null, null, null);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 10,
              width: double.infinity,
              child: GestureDetector(
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ),
            ),
            Container(
              height: 250,
              width: double.infinity,
              child: Image.asset('assets/images/logo.png'),
            ),
            Text(
              acknowledgement.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              acknowledgement.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 18),
              color: Color.fromRGBO(12, 184, 182, 1),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
                //side: BorderSide(color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Step1(),
                  ),
                );
              },
              child: FittedBox(
                child: Text(
                  'ACCEPT',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
