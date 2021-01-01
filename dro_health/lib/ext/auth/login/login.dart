import 'package:dro_health/int/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  bool _isChecked = false;
  static var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          maxLines: 1,
                          controller: _controller,
                          decoration: InputDecoration(
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
                          onPressed: () {
                            Navigator.pushNamed(context, Tabscreen.routename);
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
                            style: TextStyle(color: Colors.black, fontSize: 15),
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
