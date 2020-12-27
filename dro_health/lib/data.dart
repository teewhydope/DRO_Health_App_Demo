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

List<String> StatesList = [
  'state'
      'Abia'
      'Abuja'
      'Adamawa'
      'Akwa Ibom'
      'Anambra'
      'Bauchi'
      'Bayelsa'
      'Benue'
      'Borno'
      'Cross River'
      'Delta'
      'Ebonyi'
      'Edo'
      'Ekiti'
      'Enugu'
      'Gombe'
      'Imo'
      'Jigawa'
      'Kaduna'
      'Kano'
      'Katsina'
      'Kebbi'
      'Kogi'
      'Kwara'
      'Lagos'
      'Nasarawa'
      'Niger'
      'Ogun'
      'Ondo'
      'Osun'
      'Oyo'
      'Plateau'
      'Rivers'
      'Sokoto'
      'Taraba'
      'Yobe'
      'Zamfara'
];
