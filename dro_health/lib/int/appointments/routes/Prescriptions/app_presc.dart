import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppPrescScreen extends StatelessWidget {
  static const routename = '/app_presc_screen';
  final isGreen = Color.fromRGBO(12, 184, 182, 1);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isGreen,
      statusBarBrightness: Brightness.dark, // as you need dark or light
    ));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: isGreen,
      ),
      body: Center(
        child: Text('Hi'),
      ),
    );
  }
}
