import 'package:dro_health/ext/auth/register/signup1/widgets/step_1_widgets/form_field_step1.dart';
import 'package:dro_health/ext/auth/register/signup1/widgets/step_1_widgets/step_question.dart';
import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';

import 'signup_step_2.dart';

class Step1 extends StatefulWidget {
  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            //color: Colors.grey,
            margin: EdgeInsets.all(25),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: StepQuestion1()),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: FormFieldStep1()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
