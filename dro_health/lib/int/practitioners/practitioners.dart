import 'package:dro_health/models/practitioner_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class PractitionersScreen extends StatefulWidget {
  @override
  _PractitionersScreenState createState() => _PractitionersScreenState();
}

class _PractitionersScreenState extends State<PractitionersScreen> {
  final isBlue = Color.fromRGBO(92, 134, 206, 1);
  final isPink = Color.fromRGBO(255, 115, 129, 1);
  final specialtiesData = Specialties;
  final isGreen = Color.fromRGBO(12, 184, 182, 1);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isGreen,
      statusBarBrightness: Brightness.dark, // as you need dark or light
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: isGreen, // status bar color
            brightness: Brightness.dark,

            title: Center(child: Text('Practitioners')),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: 650,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: double.infinity,
                      child: Text(
                        'Specialties',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      //margin: EdgeInsets.all(5),
                      height: 160,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 180,
                            width: 130,
                            child: Card(
                              margin: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: Center(
                                child: Column(children: [
                                  Icon(
                                    Icons.person_add_alt_1_rounded,
                                    size: 50,
                                    color: isBlue,
                                  ),
                                  Text(
                                    'view all practitioners',
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 0.8,
                            width: 5,
                          ),
                          Flexible(
                            child: Container(
                              height: 160,
                              width: double.infinity,
                              child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 11,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        Container(
                                  // height: 180,
                                  width: 130,
                                  child: Card(
                                    color: index == 0 || index.isEven
                                        ? isBlue
                                        : isPink,
                                    elevation: 5,
                                    margin: EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Center(
                                        child: Text(
                                          specialtiesData[index].description,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 0.5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            margin: EdgeInsets.all(10),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              height: 90,
                              child: Text('hi'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
