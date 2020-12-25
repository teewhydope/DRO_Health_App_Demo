import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'appointments/appointments.dart';
import 'home/home.dart';
import 'practitioners/practitioners.dart';
import 'profile/profile.dart';

class Tabscreen extends StatefulWidget {
  static const routename = '/tabscreen';

  @override
  _TabscreenState createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  final List<Map<Object, Object>> tabs = [
    {'tab': Home(), 'title': 'Hi Ibrahim'},
    {'tab': AppointmentsScreen(), 'title': 'Appointments'},
    {'tab': PractitionersScreen(), 'title': 'Practitioners'},
    {'tab': ProfileScreen(), 'title': ''},
  ];

  int _selectedTabIndex = 0;

  void _selectTab(int index) {
    setState(
      () {
        _selectedTabIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      /* appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(tabs[_selectedTabIndex]['title'],
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              textStyle: TextStyle(color: Colors.black),
            )),
        backgroundColor: Colors.white,
        elevation: 2,
      ),*/
      body: tabs[_selectedTabIndex]['tab'],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        iconSize: 30,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.purple,
        currentIndex: _selectedTabIndex,
        onTap: _selectTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1_rounded),
            label: 'Practitioners',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
