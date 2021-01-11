import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

class UserDataReg with ChangeNotifier {
  String firstName;
  String lastName;
  DateTime dateOfBirth;
  String gender;
  String city;
  String state;
  int phoneNumber;

  UserDataReg({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.city,
    this.state,
    this.phoneNumber,
  });
}

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  //
}
