import 'package:flutter/material.dart';

class EditInfo extends StatefulWidget {
  static const routename = '/editInfo';

  @override
  _EditInfoState createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  var _isCheckedMale = false;
  var _isCheckedFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          elevation: 3,
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    maxRadius: 60,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(hintText: 'First Name'),
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Last Name'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(hintText: 'DOB'),
                  )),
                  Checkbox(
                    value: _isCheckedMale,
                    onChanged: (value) {
                      setState(() {
                        _isCheckedMale = value;
                      });
                    },
                  ),
                  Checkbox(
                    value: _isCheckedFemale,
                    onChanged: (value) {
                      setState(() {
                        _isCheckedFemale = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Height (meters)'),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Weight (kg)'),
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Phone Number'),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Email Address'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
