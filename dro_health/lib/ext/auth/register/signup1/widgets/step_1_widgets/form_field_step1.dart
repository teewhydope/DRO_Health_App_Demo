import 'package:dro_health/ext/auth/register/signup1/steps/signup_step_2.dart';
import 'package:dro_health/providers/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormFieldStep1 extends StatefulWidget {
  //final fullNames = UserDataReg;

  @override
  _FormFieldStep1State createState() => _FormFieldStep1State();
}

class _FormFieldStep1State extends State<FormFieldStep1> {
  TextEditingController _firstnamecontroller = TextEditingController();
  TextEditingController _lastnamecontroller = TextEditingController();

  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final personalData = Provider.of<UserDataReg>(context);

    return Column(
      children: [
        Form(
          key: _formKey1,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value.isEmpty || value.length < 2) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                controller: _firstnamecontroller,
                decoration: InputDecoration(
                  hintText: 'First name',
                  suffixIcon: IconButton(
                    onPressed: () => this.setState(() {
                      _firstnamecontroller.clear();
                    }),
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextFormField(
                onSaved: (String value) {
                  personalData.lastName = value;
                },
                validator: (value) {
                  if (value.isEmpty || value.length < 2) {
                    return 'Please enter name';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                controller: _lastnamecontroller,
                decoration: InputDecoration(
                  hintText: 'Last name',
                  suffixIcon: IconButton(
                    onPressed: () => this.setState(() {
                      _lastnamecontroller.clear();
                    }),
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Column(
                children: [
                  RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 18),
                    color: Color.fromRGBO(12, 184, 182, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      //side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () {
                      final isValid = _formKey1.currentState.validate();
                      if (!isValid) {
                        return;
                      }
                      _formKey1.currentState.save();
                      personalData.firstName = _firstnamecontroller.text;
                      personalData.lastName = _lastnamecontroller.text;
                      print(_firstnamecontroller.text);
                      print(_lastnamecontroller.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Step2(),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Sign In',
                            style:
                                TextStyle(color: Colors.purple, fontSize: 15),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
