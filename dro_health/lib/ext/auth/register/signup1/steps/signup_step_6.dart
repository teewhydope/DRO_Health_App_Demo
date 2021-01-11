import 'package:dro_health/ext/auth/register/signup1/steps/success_screen.dart';
import 'package:dro_health/providers/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Step6 extends StatefulWidget {
  static const routename = '/step6';

  @override
  _Step6State createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  final _formKey6 = GlobalKey<FormState>();
  var _isLoading = false;

  String _email;
  String _password;
  String _firstname;
  String _lastname;
  String _dob;
  String _gender;
  String _city;
  String _state;
  String _phone;
  String _errorEmail;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    onSaved: (String value) {
                      _email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    controller: _emailController,
                    decoration: InputDecoration(
                      errorText: _errorEmail,
                      hintText: 'Email address',
                      suffixIcon: IconButton(
                        onPressed: () => this.setState(() {
                          _emailController.clear();
                        }),
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      _password = value;
                    },
                    validator: (value) {
                      Pattern pattern =
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      RegExp regex = new RegExp(pattern);
                      print(value);
                      if (value.isEmpty || value.length < 8) {
                        return 'Password must be 8 digits long';
                      } else {
                        if (!regex.hasMatch(value)) {
                          return 'Minimum 1 Upper case\nMinimum 1 Lower case\nMinimum 1 Numeric Number\nMinimum 1 Special Character\nCommon Allowed Characters ( ! @ # \$ & * ~ )\n';
                        }
                        return null;
                      }
                    },
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                    ),
                  ),
                ],
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
                _isLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 150, vertical: 18),
                        color: Color.fromRGBO(12, 184, 182, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          //side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () async {
                          final isValid = _formKey6.currentState.validate();
                          if (!isValid) {
                            return;
                          }
                          _formKey6.currentState.save();
                          final persData =
                              Provider.of<UserDataReg>(context, listen: false);
                          _firstname = persData.firstName.trim();
                          _lastname = persData.lastName.trim();
                          _dob = persData.dateOfBirth.toIso8601String();
                          _gender = persData.gender;
                          _city = persData.city.trim();
                          _state = persData.state.trim();
                          _phone = persData.phoneNumber.toString().trim();

                          FirebaseAuth _auth = FirebaseAuth.instance;
                          final CollectionReference userCollection =
                              FirebaseFirestore.instance.collection('users');

                          //creates user with email and password
                          try {
                            setState(() {
                              _isLoading = true;
                            });
                            UserCredential result =
                                await _auth.createUserWithEmailAndPassword(
                                    email: _email, password: _password);
                            // getting user.id to set additional information
                            User user = result.user;
                            await userCollection.doc(user.uid).set({
                              'First Name': _firstname,
                              'Last Name': _lastname,
                              'Date of Birth': _dob,
                              'Gender': _gender,
                              'City': _city,
                              'State': _state,
                              'Phone Number': _phone,
                              'email': _email,
                            });
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                Success.routename,
                                (Route<dynamic> route) => false);
                          } on FirebaseAuthException catch (error) {
                            var message =
                                'An Error occured, please check your credentials!';

                            if (error.message != null) {
                              message = error.message;
                            }
                            print(error.message);

                            setState(() {
                              _errorEmail = error.message;
                              return;
                            });
                            print('hi ${error.code}');
                            setState(() {
                              _isLoading = false;
                            });
                          } catch (err) {
                            print(err);
                            setState(() {
                              _isLoading = false;
                            });
                          }
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
    );
  }
}
