import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/appointments_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentsScreen extends StatelessWidget {
  final isGreen = Color.fromRGBO(12, 184, 182, 1);
  final appointmentsData = AppointmentsData;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isGreen,
      statusBarBrightness: Brightness.dark, // as you need dark or light
    ));
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Appointments')),
        backgroundColor: isGreen,
      ),
      backgroundColor: Colors.white70,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 700,
            margin: EdgeInsets.all(8),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 5,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => appointmentsData[index].pages),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      index == 1 || index == 3
                          ? Flexible(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 40,
                                ),
                                height: double.infinity,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      child: SvgPicture.asset(
                                        appointmentsData[index].images,
                                      ),
                                    ),
                                    Text(
                                      appointmentsData[index].title,
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      appointmentsData[index].description,
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Flexible(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                height: double.infinity,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 50,
                                      child: SvgPicture.asset(
                                        appointmentsData[index].images,
                                      ),
                                    ),
                                    Text(
                                      appointmentsData[index].title,
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                  elevation: 5,
                ),
              ),
              staggeredTileBuilder: (int index) => StaggeredTile.count(
                  index == 1 || index == 3
                      ? 3
                      : index == 6
                          ? 5
                          : 2,
                  index == 1 || index == 3 ? 3 : 1.5),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ),
    );
  }
}
