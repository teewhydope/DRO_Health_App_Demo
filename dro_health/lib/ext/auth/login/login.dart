import 'package:dro_health/int/tab_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Login extends StatefulWidget {
  static const routename = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _obscureText = true;

  var _isChecked = false;
  var _isLoading = false;
  String _errorEmail;
  static var _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    height: 400,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/logo_small.png',
                      //fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 350,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextFormField(
                                onSaved: (value) => _email = value,
                                maxLines: 1,
                                controller: _controller,
                                validator: (value) {
                                  if (value.isEmpty || !value.contains('@')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  errorText: _errorEmail,
                                  hintText: 'Email Address',
                                  suffixIcon: IconButton(
                                    onPressed: () => this.setState(() {
                                      _controller.clear();
                                    }),
                                    icon: Icon(Icons.clear),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                onSaved: (value) => _password = value,
                                validator: (value) {
                                  if (value.isEmpty || value.length < 8) {
                                    return 'Please enter a valid password';
                                  }
                                  return null;
                                },
                                obscureText: _obscureText,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    suffixIcon: IconButton(
                                      icon: Icon(_obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    )),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              RaisedButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 140, vertical: 18),
                                color: Color.fromRGBO(12, 184, 182, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  //side: BorderSide(color: Colors.black),
                                ),
                                onPressed: () async {
                                  final isValid =
                                      _formKey.currentState.validate();
                                  if (!isValid) {
                                    return;
                                  }
                                  _formKey.currentState.save();
                                  FirebaseAuth _auth = FirebaseAuth.instance;
                                  try {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    await _auth.signInWithEmailAndPassword(
                                        email: _email, password: _password);
                                    Navigator.pushReplacementNamed(
                                        context, Tabscreen.routename);
                                  } on FirebaseAuthException catch (error) {
                                    print(error.message);
                                    print(error.code);
                                    setState(() {
                                      _errorEmail = error.code;
                                      return;
                                    });
                                  }
                                  setState(() {
                                    _isLoading = false;
                                  });
                                },
                                child: FittedBox(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  text: 'Don\'t have an account?',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Sign up',
                                        style: TextStyle(
                                            color: Colors.purple, fontSize: 15),
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
                  ),
                ],
              ),
            ),
    );
  }
}
