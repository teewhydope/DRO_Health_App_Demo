import 'package:flutter/material.dart';

import 'model.dart';

const essentialColor = Color.fromRGBO(255, 193, 157, 1);
const serviceColorBlue = Color.fromRGBO(94, 222, 244, 1);
const serviceColorPink = Color.fromRGBO(253, 161, 170, 1);

const SplashSlider = const [
  Model(
    title: 'Consultations',
    description: 'See a doctor now or later',
    images: 'assets/images/splash_consultation.png',
  ),
  Model(
    title: 'Prescriptions',
    description: 'All your medications delivered to you',
    images: 'assets/images/splash_prescription.png',
  ),
  Model(
    title: 'Diagnostics',
    description: 'Booking and results in one place',
    images: 'assets/images/splash_diagnostics.png',
  ),
  Model(
    title: 'Family',
    description: 'Keep your family close, keep their health closer',
    images: 'assets/images/splash_family.png',
  ),
];

const Acknowledgement = const Model(
  title: 'Terms of Use, Privacy Policy & Contact Permissions',
  description:
      'We use client\'s data to improve the experience of our service and help our practitioners make more informed decisions',
  images: '',
);

class DropDownStateList {
  int value;
  String state;
  DropDownStateList({this.state, this.value});
}

// ignore: non_constant_identifier_names
List<DropDownStateList> StatesList = [
  DropDownStateList(value: 1, state: 'State'),
  DropDownStateList(value: 2, state: 'Abia'),
  DropDownStateList(value: 3, state: 'Abuja'),
  DropDownStateList(value: 4, state: 'Adamawa'),
  DropDownStateList(value: 5, state: 'Akwa Ibom'),
  DropDownStateList(value: 6, state: 'Anambra'),
  DropDownStateList(value: 7, state: 'Bauchi'),
  DropDownStateList(value: 8, state: 'Bayelsa'),
  DropDownStateList(value: 9, state: 'Benue'),
  DropDownStateList(value: 10, state: 'Borno'),
  DropDownStateList(value: 11, state: 'Cross River'),
  DropDownStateList(value: 12, state: 'Delta'),
  DropDownStateList(value: 13, state: 'Ebonyi'),
  DropDownStateList(value: 14, state: 'Edo'),
  DropDownStateList(value: 15, state: 'Ekiti'),
  DropDownStateList(value: 16, state: 'Enugu'),
  DropDownStateList(value: 17, state: 'Gombe'),
  DropDownStateList(value: 18, state: 'Imo'),
  DropDownStateList(value: 19, state: 'Jigawa'),
  DropDownStateList(value: 20, state: 'Kaduna'),
  DropDownStateList(value: 21, state: 'Kano'),
  DropDownStateList(value: 22, state: 'Katsina'),
  DropDownStateList(value: 23, state: 'Kebbi'),
  DropDownStateList(value: 24, state: 'Kogi'),
  DropDownStateList(value: 25, state: 'Kwara'),
  DropDownStateList(value: 26, state: 'Lagos'),
  DropDownStateList(value: 27, state: 'Nasarawa'),
  DropDownStateList(value: 28, state: 'Niger'),
  DropDownStateList(value: 29, state: 'Ogun'),
  DropDownStateList(value: 30, state: 'Ondo'),
  DropDownStateList(value: 31, state: 'Osun'),
  DropDownStateList(value: 32, state: 'Oyo'),
  DropDownStateList(value: 33, state: 'Plateau'),
  DropDownStateList(value: 34, state: 'Rivers'),
  DropDownStateList(value: 35, state: 'Sokoto'),
  DropDownStateList(value: 36, state: 'Taraba'),
  DropDownStateList(value: 37, state: 'Yobe'),
  DropDownStateList(value: 38, state: 'Zamfara'),
];
