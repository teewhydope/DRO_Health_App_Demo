import 'package:dro_health/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../data.dart';
import 'signup_step_5.dart';

class Step4 extends StatefulWidget {
  static const routename = '/step4';

  @override
  _Step4State createState() => _Step4State();
}

class _Step4State extends State<Step4> with SingleTickerProviderStateMixin {
  final _formKey4 = GlobalKey<FormState>();
  final statesList = StatesList;
  List<DropdownMenuItem<DropDownStateList>> _dropdownMenuItems;
  DropDownStateList _selectedItem;
  TextEditingController _citycontroller = TextEditingController();

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(statesList);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<DropDownStateList>> buildDropDownMenuItems(
      List statesLists) {
    List<DropdownMenuItem<DropDownStateList>> items = [];
    for (DropDownStateList statelist in statesLists) {
      items.add(
        DropdownMenuItem(
          child: Text(statelist.state),
          value: statelist,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final personalData = Provider.of<UserDataReg>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text('Step 4 of 6  '),
                      Container(
                        width: 180,
                        child: StepProgressIndicator(
                          totalSteps: 6,
                          currentStep: 4,
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
                    'Where do you live?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            if (personalData.gender != null) Text(personalData.gender),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Form(
                    key: _formKey4,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty || value.length < 2) {
                              return 'Please enter a city';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          controller: _citycontroller,
                          decoration: InputDecoration(
                            hintText: 'City',
                            suffixIcon: IconButton(
                              onPressed: () => this.setState(() {
                                _citycontroller.clear();
                              }),
                              icon: Icon(Icons.clear),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<DropDownStateList>(
                              decoration: InputDecoration(
                                labelText: 'State',
                                hintStyle: TextStyle(fontSize: 20),
                              ),
                              hint: Text('State'),
                              validator: (val) {
                                if (val.value == 1) {
                                  return 'pick a state';
                                }
                              },
                              isExpanded: true,
                              value: _selectedItem,
                              items: _dropdownMenuItems,
                              onChanged: (value) {
                                setState(() {
                                  _selectedItem = value;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
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
                final isValid = _formKey4.currentState.validate();
                if (!isValid) {
                  return;
                }
                _formKey4.currentState.save();
                personalData.city = _citycontroller.text;
                personalData.state = _selectedItem.state;
                print(_citycontroller.text);
                print(_selectedItem.state);
                Navigator.pushNamed(context, Step5.routename);
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
    //

    //
  }
}
