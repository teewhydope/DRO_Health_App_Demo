import 'package:dro_health/ext/auth/register/signup1/widgets/custom_gender_radio.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../../model.dart';
import 'signup_step_4.dart';

class Step3 extends StatefulWidget {
  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  List<Gender> genders = [];
  @override
  void initState() {
    super.initState();
    genders.add(new Gender("Male", MdiIcons.genderMale, false));
    genders.add(new Gender("Female", MdiIcons.genderFemale, false));
    genders.add(new Gender("Others", MdiIcons.genderTransgender, false));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                        Text('Step 3 of 6  '),
                        Container(
                          width: 180,
                          child: StepProgressIndicator(
                            totalSteps: 6,
                            currentStep: 3,
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
                      'What is your Gender?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: genders.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      //splashColor: Colors.pinkAccent,
                      onTap: () {
                        setState(
                          () {
                            genders
                                .forEach((gender) => gender.isSelected = false);
                            genders[index].isSelected = true;
                          },
                        );
                      },
                      child: CustomRadio(genders[index]),
                    );
                  },
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
                  Navigator.pushNamed(context, Step4.routename);
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
      ),
    );
  }
}
