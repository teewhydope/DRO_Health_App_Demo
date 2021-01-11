import 'dart:ui';
import 'package:dro_health/ext/welcome.dart';
import 'package:dro_health/models/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  static const routename = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final services = DashboardServices;
  final essentials = DashboardEssentials;
  final specialized = DashboardSpecializedServices;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      // statusBarBrightness: Brightness.light, // as you need dark or light
    ));
    return WillPopScope(
      onWillPop: () async {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to logout?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text("YES"),
                    onPressed: () async {
                      FirebaseAuth _auth = FirebaseAuth.instance;
                      await _auth.signOut();
                      // SystemNavigator.pop();
                      // Navigator.of(context)
                      //    .pushReplacementNamed(Welcome.routename);
                      Navigator.pushNamedAndRemoveUntil(context,
                          Welcome.routename, (Route<dynamic> route) => false);
                    },
                  ),
                ],
              );
            });
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          leading: Icon(
            Icons.settings,
            size: 30,
            color: Colors.black,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                size: 30,
                color: Colors.black,
              ),
              onPressed: null,
            )
          ],
          title: Text(
            'Hi Ibrahim',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 18),
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.white70,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Upcoming'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(15),
                          height: 20,
                          width: double.infinity,
                          child: Text(
                            'No upcoming appointment, order or diagnostic test',
                            style: TextStyle(fontFamily: 'Proxima Nova'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Services')),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 180,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: services.length,
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => services[index].pages),
                            ),
                            child: Card(
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: services[index].color,
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 40),
                                // height: 150,
                                width: 130,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 50,
                                      child: SvgPicture.asset(
                                          services[index].images),
                                    ),
                                    Text(
                                      services[index].description,
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Essentials')),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 180,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: essentials.length,
                          itemBuilder: (BuildContext context, int index) =>
                              index == 1
                                  ? Card(
                                      color: essentials[index].color,
                                      margin: EdgeInsets.all(10),
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ClipRRect(
                                        child: Banner(
                                          message: "New",
                                          textStyle:
                                              TextStyle(color: Colors.black),
                                          location: BannerLocation.topEnd,
                                          color:
                                              Color.fromRGBO(12, 184, 182, 1),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 40),
                                            // height: 150,
                                            width: 130,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 50,
                                                  child: SvgPicture.asset(
                                                      essentials[index].images),
                                                ),
                                                Text(
                                                  essentials[index].description,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Card(
                                      color: essentials[index].color,
                                      margin: EdgeInsets.all(10),
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 40),
                                        // height: 150,
                                        width: 130,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 50,
                                              child: SvgPicture.asset(
                                                  essentials[index].images),
                                            ),
                                            Text(
                                              essentials[index].description,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Specialised Services')),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 180,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: specialized.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 40),
                              // height: 150,
                              width: 130,
                              child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 50,
                                    child: SvgPicture.asset(
                                        specialized[index].images),
                                  ),
                                  Text(
                                    specialized[index].description,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
