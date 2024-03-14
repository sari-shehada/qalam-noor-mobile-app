// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import '../enums.dart';

@immutable
class Mother {
  const Mother({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.motherName,
    required this.doesLiveWithHusband,
    required this.career,
    required this.tieNumber,
    required this.tiePlace,
    required this.placeOfBirth,
    required this.dateOfBirth,
    required this.religion,
    required this.educationalStatus,
    required this.phoneNumber,
  });

  factory Mother.fromMap(Map<String, dynamic> map) {
    return Mother(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      fatherName: map['fatherName'] as String,
      motherName: map['motherName'] as String,
      doesLiveWithHusband: map['doesLiveWithHusband'] as bool,
      career: map['career'] as String,
      tieNumber: map['tieNumber'] as int,
      tiePlace: map['tiePlace'] as String,
      placeOfBirth: map['placeOfBirth'] as String,
      dateOfBirth:
          DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'] as int),
      religion: Religion.values[map['religion'] as int],
      educationalStatus:
          EducationalStatus.values[map['educationalStatus'] as int],
      phoneNumber: map['phoneNumber'] as String,
    );
  }
  factory Mother.fromJson(String source) =>
      Mother.fromMap(json.decode(source) as Map<String, dynamic>);

  final int id;
  final String firstName;
  final String lastName;
  final String fatherName;
  final String motherName;
  final bool doesLiveWithHusband;
  final String career;

  final int tieNumber;
  final String tiePlace;
  final String placeOfBirth;
  final DateTime dateOfBirth;
  //enum
  final Religion religion;
  //enum
  final EducationalStatus educationalStatus;
  final String phoneNumber;

  Mother copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? fatherName,
    String? motherName,
    bool? doesLiveWithHusband,
    String? career,
    int? tieNumber,
    String? tiePlace,
    String? placeOfBirth,
    DateTime? dateOfBirth,
    Religion? religion,
    EducationalStatus? educationalStatus,
    String? phoneNumber,
  }) {
    return Mother(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      doesLiveWithHusband: doesLiveWithHusband ?? this.doesLiveWithHusband,
      career: career ?? this.career,
      tieNumber: tieNumber ?? this.tieNumber,
      tiePlace: tiePlace ?? this.tiePlace,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      religion: religion ?? this.religion,
      educationalStatus: educationalStatus ?? this.educationalStatus,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fatherName': fatherName,
      'motherName': motherName,
      'doesLiveWithHusband': doesLiveWithHusband,
      'career': career,
      'tieNumber': tieNumber,
      'tiePlace': tiePlace,
      'placeOfBirth': placeOfBirth,
      'dateOfBirth': dateOfBirth.millisecondsSinceEpoch,
      'religion': religion.index,
      'educationalStatus': educationalStatus.index,
      'phoneNumber': phoneNumber,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Mother(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, motherName: $motherName, doesLiveWithHusband: $doesLiveWithHusband, career: $career, tieNumber: $tieNumber, tiePlace: $tiePlace, placeOfBirth: $placeOfBirth, dateOfBirth: $dateOfBirth, religion: $religion, educationalStatus: $educationalStatus, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant Mother other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.fatherName == fatherName &&
        other.motherName == motherName &&
        other.doesLiveWithHusband == doesLiveWithHusband &&
        other.career == career &&
        other.tieNumber == tieNumber &&
        other.tiePlace == tiePlace &&
        other.placeOfBirth == placeOfBirth &&
        other.dateOfBirth == dateOfBirth &&
        other.religion == religion &&
        other.educationalStatus == educationalStatus &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        fatherName.hashCode ^
        motherName.hashCode ^
        doesLiveWithHusband.hashCode ^
        career.hashCode ^
        tieNumber.hashCode ^
        tiePlace.hashCode ^
        placeOfBirth.hashCode ^
        dateOfBirth.hashCode ^
        religion.hashCode ^
        educationalStatus.hashCode ^
        phoneNumber.hashCode;
  }
}
