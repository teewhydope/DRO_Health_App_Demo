import 'package:dro_health/providers/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'signup_step_3.dart';

class Step2 extends StatefulWidget {
  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  DateTime selectedDate = DateTime.utc(2003);

  _selectDate(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final personalData = Provider.of<UserDataReg>(context);
    return Scaffold(
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
                      Text('Step 2 of 6  '),
                      Container(
                        width: 180,
                        child: StepProgressIndicator(
                          totalSteps: 6,
                          currentStep: 2,
                          size: 10,
                          padding: 0,
                          selectedColor: Color.fromRGBO(12, 184, 182, 1),
                          unselectedColor: Colors.grey[350],
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
                    'When were you born?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            // Text(personalData.firstName),
            // Text(personalData.lastName),
            Container(
              height: 200,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () => _selectDate(context),
                      child: Text(
                        'Select date',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Color.fromRGBO(12, 184, 182, 1),
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 18),
              color: Color.fromRGBO(12, 184, 182, 1),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
                //side: BorderSide(color: Colors.black),
              ),
              onPressed: () {
                personalData.dateOfBirth = selectedDate.toLocal();
                print(personalData.dateOfBirth = personalData.dateOfBirth);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Step3(),
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
          ],
        ),
      ),
    );
  }

  ///
  /////
  ///
  ///
  ///
  ///
  ///

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 1930,
              maximumYear: 2003,
            ),
          );
        });
  }

  buildMaterialDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1930),
      lastDate: DateTime(2003),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      // selectableDayPredicate: _decideWhichDayToEnable,
      helpText: 'Select date of birth',
      cancelText: 'Not now',
      confirmText: 'Set',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'Date of birth',
      fieldHintText: 'Month/Date/Year',
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
