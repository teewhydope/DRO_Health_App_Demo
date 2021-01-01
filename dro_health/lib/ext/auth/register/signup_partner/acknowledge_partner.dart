import 'package:flutter/material.dart';

import '../../../../data.dart';

class AcknowledgePartner extends StatelessWidget {
  final acknowledgement = Acknowledgement;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.asset('assets/images/logo.png'),
          ),
          Text(
            acknowledgement.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            acknowledgement.description,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 150, vertical: 18),
            color: Color.fromRGBO(12, 184, 182, 1),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25.0),
              //side: BorderSide(color: Colors.black),
            ),
            onPressed: () {},
            child: FittedBox(
              child: Text(
                'ACCEPT',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
