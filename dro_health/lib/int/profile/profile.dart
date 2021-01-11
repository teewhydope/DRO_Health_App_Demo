import 'package:dro_health/int/profile/routes/edit_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark, // as you need dark or light
    ));
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: 750,
            //color: Colors.grey,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.red, Colors.purple]),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.settings,
                              size: 40,
                              color: Colors.white,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, EditInfo.routename);
                              },
                              child: Icon(
                                Icons.edit_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        child: StaggeredGridView.countBuilder(
                          physics: NeverScrollableScrollPhysics(),
                          //shrinkWrap: true,
                          primary: false,
                          crossAxisCount: 5,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) =>
                              index == 0
                                  ? Container(
                                      // height: 300,
                                      // color: Colors.grey,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              height: 250,
                                              width: double.infinity,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Text(''),
                                                elevation: 2,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 140.0,
                                            right: 130,
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                'assets/images/profile.png',
                                              ),
                                              backgroundColor: Colors.grey[300],
                                              maxRadius: 70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Text('$index'),
                                      elevation: 2,
                                    ),
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.count(5, index == 0 ? 4 : 1),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
