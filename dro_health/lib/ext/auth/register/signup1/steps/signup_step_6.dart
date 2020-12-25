import 'package:dro_health/int/tab_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Step6 extends StatelessWidget {
  static const routename = '/step6';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text('Step 6 of 6  '),
                        Container(
                          width: 180,
                          child: StepProgressIndicator(
                            totalSteps: 6,
                            currentStep: 6,
                            size: 10,
                            padding: 0,
                            selectedColor: Color.fromRGBO(12, 184, 182, 1),
                            unselectedColor: Colors.grey,
                            roundedEdges: Radius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      'You are almost done',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                height: 200,
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Email address'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: 'Password confirmation'),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'By signing up, you agree to our',
                      style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Terms',
                          style: TextStyle(color: Colors.purple, fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                            },
                        ),
                        TextSpan(
                          text: ' and',
                          style: TextStyle(fontSize: 12),
                        ),
                        TextSpan(
                          text: ' Privacy Policy',
                          style: TextStyle(color: Colors.purple, fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                            },
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 18),
                    color: Color.fromRGBO(12, 184, 182, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      //side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Tabscreen.routename);
                    },
                    child: FittedBox(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
