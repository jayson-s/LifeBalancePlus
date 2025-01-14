import 'package:flutter/material.dart';


class Account {
  int? id;
  String email;
  String firstName;
  String lastName;
  double height;         // Height in cm
  double weight;         // Weight in kg
  DateTime dateOfBirth;

  Account({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.height,
    required this.weight,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'height': height,
      'weight': weight,
      'dateOfBirth': dateOfBirth.toString(),
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      height: map['height'],
      weight: map['weight'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }

  @override
  String toString() {
    return
      "User(email: $email, firstName: $firstName, lastName: $lastName, height: $height, "
      "weight: $weight, dateOfBirth: ${DateUtils.dateOnly(dateOfBirth).toString()})";
  }
}
