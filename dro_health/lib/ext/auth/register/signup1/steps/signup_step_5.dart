import 'package:dro_health/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:intl/intl.dart';

import 'signup_step_6.dart';

class Step5 extends StatefulWidget {
  static const routename = '/step5';

  @override
  _Step5State createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  final _phoneNumbercontroller = TextEditingController();

  final _formKey5 = GlobalKey<FormState>();
  var _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final personalData = Provider.of<UserDataReg>(context);
    Future<void> dialog1() async {
      await showDialog(
        context: context,
        builder: (BuildContext ctx) => Center(
            child: AlertDialog(
          title: Text('Review your information'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'First Name:  ${personalData.firstName.toUpperCase()}',
                ),
                Text(
                  'Last Name:  ${personalData.lastName.toUpperCase()}',
                ),
                Text(
                  'DOB:  ${DateFormat.yMMMMd().format(personalData.dateOfBirth).toUpperCase()}',
                ),
                Text(
                  'Gender:  ${personalData.gender.toUpperCase()}',
                ),
                Text(
                  'City:  ${personalData.city.toUpperCase()}',
                ),
                Text(
                  'State:  ${personalData.state.toUpperCase()}',
                ),
                Text(
                  'Phone:  ${personalData.phoneNumber.toString().padLeft(11, '0')}',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          // return Navigator.pushNamed(context, Step5.routename);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'NO',
                          textAlign: TextAlign.left,
                        )),
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) =>
                            Row(
                              children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  },
                                ),
                                _isChecked == false
                                    ? RaisedButton(
                                        onPressed: null,
                                        child: Text('Proceed'),
                                      )
                                    : RaisedButton(
                                        color: Color.fromRGBO(12, 184, 182, 1),
                                        onPressed: () {
                                          return Navigator.pushNamed(
                                            context,
                                            Step6.routename,
                                          ).then(
                                            (value) => Navigator.of(
                                              context,
                                            ).pop(),
                                          );
                                        },
                                        child: Text('Proceed'),
                                      ),
                              ],
                            )),
                  ],
                ),
              ],
            ),
          ),
        )),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
                      Text('Step 5 of 6  '),
                      Container(
                        width: 180,
                        child: StepProgressIndicator(
                          totalSteps: 6,
                          currentStep: 5,
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
                    'What\'s your phone number?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/images/flag_nigeria.png'),
                      ),
                      Text('NG  +234'),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.arrow_drop_down,
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey5,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        controller: _phoneNumbercontroller,
                        decoration: InputDecoration(
                          hintText: 'phone number',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid number';
                          }
                          {
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            if (int.parse(value) <= 0) {
                              return 'Please enter a number greater than zero';
                            }
                            if (value.length != 11) {
                              return 'enter a valid number';
                            }
                            if (!value.startsWith('0')) {
                              return 'Please enter a valid number';
                            }
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 18),
              color: Color.fromRGBO(12, 184, 182, 1),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
                //side: BorderSide(color: Colors.black),
              ),
              onPressed: () async {
                final isValid = _formKey5.currentState.validate();
                if (!isValid) {
                  return;
                }
                _formKey5.currentState.save();

                personalData.phoneNumber =
                    int.parse(_phoneNumbercontroller.text);
                await dialog1();

                //Navigator.pushNamed(context, Step6.routename);
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
      ),
    );
  }
}
