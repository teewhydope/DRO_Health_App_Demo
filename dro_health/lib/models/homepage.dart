import 'package:dro_health/int/home/routes/order_med/order_medication.dart';
import 'package:dro_health/int/home/routes/see_practitioner/see_practitioner.dart';
import 'package:flutter/material.dart';

class HomePage {
  String id;
  String title;
  String description;
  String images;
  Color color;
  Widget pages;

  HomePage({
    this.id,
    this.title,
    this.description,
    this.images,
    this.color,
    this.pages,
  });
}

const essentialColor = Color.fromRGBO(255, 193, 157, 1);
const serviceColorBlue = Color.fromRGBO(94, 222, 244, 1);
const serviceColorPink = Color.fromRGBO(253, 161, 170, 1);

// ignore: non_constant_identifier_names
final DashboardServices = [
  //Model(title: 'Services'),
  HomePage(
    description: 'See a Practitioner now',
    color: serviceColorBlue,
    images: 'assets/images/dro_prac.svg',
    pages: SeePractitioner(),
  ),
  HomePage(
      description: 'Order Medication',
      color: serviceColorPink,
      images: 'assets/images/dro_order_med.svg',
      pages: OrderMedication()),
  HomePage(
      description: 'Book a Diagnostic Test',
      color: serviceColorBlue,
      images: 'assets/images/dro_book2.svg'),
  HomePage(
      description: 'COVID-19 Symptom Diary',
      color: Color.fromRGBO(108, 240, 165, 1),
      images: 'assets/images/coronavirus.svg'),
  HomePage(
      description: 'Book an appointment',
      color: serviceColorPink,
      images: 'assets/images/dro_book1.svg'),
];

// ignore: non_constant_identifier_names
final DashboardEssentials = [
  //Model(title: 'Essentials'),
  HomePage(
      description: 'Fund Wallet',
      color: essentialColor,
      images: 'assets/images/dro_wallet.svg'),
  HomePage(
      description: 'My Health',
      color: essentialColor,
      images: 'assets/images/dro_heart.svg'),
  HomePage(
      description: 'Post Appointment Messages',
      color: essentialColor,
      images: 'assets/images/dro_post_app.svg'),
];

// ignore: non_constant_identifier_names
final DashboardSpecializedServices = [
  //Model(title: 'Specialized Services'),
  HomePage(
      description: 'Mental Health', images: 'assets/images/mental-health.svg'),
  HomePage(
      description: 'Womens Health', images: 'assets/images/female-symbol.svg'),
  HomePage(description: 'Mens Health', images: 'assets/images/male-symbol.svg'),
];
