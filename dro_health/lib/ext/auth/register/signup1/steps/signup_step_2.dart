import 'package:dro_health/ext/auth/register/signup1/widgets/datewidget.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'signup_step_3.dart';

class Step2 extends StatefulWidget {
  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
                        Text('Step 2 of 6  '),
                        Container(
                          width: 180,
                          child: StepProgressIndicator(
                            totalSteps: 6,
                            currentStep: 2,
                            size: 10,
                            padding: 0,
                            selectedColor: Color.fromRGBO(12, 184, 182, 1),
                            unselectedColor: Colors.grey[350],
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
                      'When were you born?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: DatePickerDemo(),
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
                      builder: (context) => Step3(),
                    ),
                  );
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
        ),
      ),
    );
  }
}
