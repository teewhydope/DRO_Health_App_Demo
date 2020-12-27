import 'package:dro_health/ext/auth/register/signup1/steps/signup_step_2.dart';
import 'package:dro_health/models/registration_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

List<GlobalKey<FormState>> _formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
];

class FormFieldStep1 extends StatefulWidget {
  static var _firstnamecontroller = TextEditingController();
  static var _lastnamecontroller = TextEditingController();

  @override
  _FormFieldStep1State createState() => _FormFieldStep1State();
}

class _FormFieldStep1State extends State<FormFieldStep1> {
  final regData = RegData();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKeys[0],
          child: Column(
            children: [
              TextFormField(
                onSaved: (String value) {
                  regData.firstName = value;
                },
                validator: (value) {
                  if (value.isEmpty || value.length < 2) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                controller: FormFieldStep1._firstnamecontroller,
                decoration: InputDecoration(
                  hintText: 'First name',
                  suffixIcon: IconButton(
                    onPressed: () => this.setState(() {
                      FormFieldStep1._firstnamecontroller.clear();
                    }),
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onSaved: (String value) {
                  regData.lastName = value;
                },
                validator: (value) {
                  if (value.isEmpty || value.length < 2) {
                    return 'Please enter name';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                controller: FormFieldStep1._lastnamecontroller,
                decoration: InputDecoration(
                  hintText: 'Last name',
                  suffixIcon: IconButton(
                    onPressed: () => this.setState(() {
                      FormFieldStep1._lastnamecontroller.clear();
                    }),
                    icon: Icon(Icons.clear),
                  ),
                ),
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
                      onSubmitStep1Data();
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
                  SizedBox(height: 10),
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

  void showSnackBarMessage(String message, [MaterialColor color = Colors.red]) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void onSubmitStep1Data() {
    final FormState formState0 = _formKeys[0].currentState;

    if (!formState0.validate()) {
      showSnackBarMessage('Please enter correct data');
      return;
    } else {
      formState0.save();
      //FormFieldStep1._firstnamecontroller.text;
      //FormFieldStep1._lastnamecontroller.text;
    }
  }
}
