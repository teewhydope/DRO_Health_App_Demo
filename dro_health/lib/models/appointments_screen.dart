import 'package:dro_health/int/appointments/routes/Appointments/app_app.dart';
import 'package:dro_health/int/appointments/routes/Cases/app_cases.dart';
import 'package:dro_health/int/appointments/routes/Diagnostics/app_diagnostics.dart';
import 'package:dro_health/int/appointments/routes/Messages/app_messages.dart';
import 'package:dro_health/int/appointments/routes/Notes/app_notes.dart';
import 'package:dro_health/int/appointments/routes/Orders/app_orders.dart';
import 'package:dro_health/int/appointments/routes/Prescriptions/app_presc.dart';
import 'package:flutter/material.dart';

class Appoint {
  String id;
  String images;
  String title;
  String description;
  Widget pages;

  Appoint({this.id, this.images, this.title, this.description, this.pages});
}

// ignore: non_constant_identifier_names
final AppointmentsData = [
  Appoint(
    title: 'Notes',
    images: 'assets/images/dro_notes.svg',
    pages: AppNotesScreen(),
  ),
  Appoint(
    title: 'Appointments',
    images: 'assets/images/mental-health.svg',
    description: 'Upcoming and previous appointments',
    pages: AppAppScreen(),
  ),
  Appoint(
    title: 'Messages',
    images: 'assets/images/dro_post_app.svg',
    pages: AppMessagesScreen(),
  ),
  Appoint(
    title: 'Cases',
    images: 'assets/images/dro_folder.svg',
    description: 'Open and closed cases',
    pages: AppCasesScreen(),
  ),
  Appoint(
    title: 'Prescriptions',
    images: 'assets/images/dro_presc.svg',
    pages: AppPrescScreen(),
  ),
  Appoint(
    title: 'Diagnostics',
    images: 'assets/images/dro_book3.svg',
    pages: AppDiagnosticsScreen(),
  ),
  Appoint(
    title: 'Orders',
    images: 'assets/images/dro_orderbox.svg',
    pages: AppOrdersScreen(),
  ),
];
