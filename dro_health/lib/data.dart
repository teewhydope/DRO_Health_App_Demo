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

const DashboardServices = const [
  //Model(title: 'Services'),
  Model(
      description: 'See a Practitioner now',
      color: serviceColorBlue,
      images: 'assets/images/dro_prac.svg'),
  Model(
      description: 'Order Medication',
      color: serviceColorPink,
      images: 'assets/images/dro_order_med.svg'),
  Model(
      description: 'Book a Diagnostic Test',
      color: serviceColorBlue,
      images: 'assets/images/dro_book2.svg'),
  Model(
      description: 'COVID-19 Symptom Diary',
      color: Color.fromRGBO(108, 240, 165, 1),
      images: 'assets/images/coronavirus.svg'),
  Model(
      description: 'Book an appointment',
      color: serviceColorPink,
      images: 'assets/images/dro_book1.svg'),
];
const DashboardEssentials = const [
  //Model(title: 'Essentials'),
  Model(
      description: 'Fund Wallet',
      color: essentialColor,
      images: 'assets/images/dro_wallet.svg'),
  Model(
      description: 'My Health',
      color: essentialColor,
      images: 'assets/images/dro_heart.svg'),
  Model(
      description: 'Post Appointment Messages',
      color: essentialColor,
      images: 'assets/images/dro_post_app.svg'),
];
const DashboardSpecializedServices = const [
  //Model(title: 'Specialized Services'),
  Model(
      description: 'Mental Health', images: 'assets/images/mental-health.svg'),
  Model(
      description: 'Womens Health', images: 'assets/images/female-symbol.svg'),
  Model(description: 'Mens Health', images: 'assets/images/male-symbol.svg'),
];

const AppointmentsData = const [
  Model(title: 'Notes', images: 'assets/images/dro_notes.svg'),
  Model(
      title: 'Appointments',
      images: 'assets/images/mental-health.svg',
      description: 'Upcoming and previous appointments'),
  Model(title: 'Messages', images: 'assets/images/dro_post_app.svg'),
  Model(
      title: 'Cases',
      images: 'assets/images/dro_folder.svg',
      description: 'Open and closed cases'),
  Model(title: 'Prescriptions', images: 'assets/images/dro_presc.svg'),
  Model(title: 'Diagnostics', images: 'assets/images/dro_book3.svg'),
  Model(title: 'Orders', images: 'assets/images/dro_orderbox.svg'),
];

const Specialties = const [
  Model(description: 'General Practitioner'),
  Model(description: 'Diet Specialist'),
  Model(description: 'Eye Specialist'),
  Model(description: 'Brain & Spine Specialist'),
  Model(description: 'Family Medicine'),
  Model(description: 'Diabetes Specialist'),
  Model(description: 'Pain Management'),
  Model(description: 'Obstetrics & Gynaecology'),
  Model(description: 'Sports Medicine'),
  Model(description: 'Pediatrics'),
  Model(description: 'Psychology'),
];
