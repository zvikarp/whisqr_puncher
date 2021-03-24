import 'package:flutter/cupertino.dart';

class User {
  User({
    @required this.email,
    @required this.pk,
    @required this.sk,
    this.businessCode,
    this.locationId,
  });

  final String email;
  final String pk;
  final String sk;
  final String businessCode;
  final String locationId;

  bool isValid() => email != null && pk != null && sk != null;

  Map<String, dynamic> toMap() => {
        'email': email,
        'pk': pk,
        'sk': sk,
        'businessCode': businessCode,
        'locationId': locationId,
      };

  factory User.fromMap(Map<String, dynamic> map) => User(
        email: map['email'],
        pk: map['pk'],
        sk: map['sk'],
        businessCode: map['businessCode'],
        locationId: map['locationId'],
      );
}
