import 'package:delayed_display/delayed_display.dart';
import 'package:dro_health/int/home/home.dart';
import 'package:dro_health/int/tab_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  static const routename = '/success';

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  final String animation = "Untitled";
  Color _isGreen = Color.fromRGBO(12, 184, 182, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isGreen,
      body: Stack(
        children: [
          FlareActor(
            'assets/animations/suc_chk.flr',
            animation: animation,
            snapToEnd: false,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: DelayedDisplay(
                delay: Duration(seconds: 3),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: _isGreen)),
                  color: Colors.greenAccent[700],
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Tabscreen.routename);
                  },
                  child: Text(
                    'Proceed',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
