// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:qalam_noor_parents/models/enums.dart';

class StudentProfileView {
  final int studentId;
  final String studentFirstName;
  final DateTime studentDateOfBirth;
  final String studentPlaceOfBirth;
  final bool gender;
  final String incidentNumber;
  final String incidentDate;
  final int publicRecordId;
  final String phoneNumber;
  final String whatsappPhoneNumber;
  final String landLine;
  final DateTime joinDate;
  final DateTime? leaveDate;
  //enum
  final Religion studentReligion;
  //.............................................
  final String fatherFirstName;
  final String lastName;
  final String grandFatherName;
  final String grandMotherName;
  final String fatherCareer;
  final String fatherPlaceOfResidence;
  final String fatherTieNumber;
  final String fatherTiePlace;
  final String fatherPlaceOfBirth;
  //enum
  final Religion fatherReligion;
  final String fatherCivilRegisterSecretary;
  //enum
  final EducationalStatus educationalStatus;
  final String fatherPhoneNumber;
  final String fatherPermenantAddress;
  //.............................
  final String motherName;
  final String motherLastName;
  final String motherFatherName;
  final String motherMotherName;
  final bool motherDoesLiveWithHasband;
  final String motherCareer;
  final String motherTieNumber;
  final String motherTiePlace;
  final String motherPlaceOfBirth;
  final DateTime motherDateOfBirth;
  //enum
  final Religion motherReligion;
  //enum
  final EducationalStatus motherEducationalStatus;
  final String motherPhoneNumber;
  //....................
  final String userName;
  final String password;
  //......................
  final String addressName;
  final String addressDetails;
  final String areaName;
  final String cityName;

  StudentProfileView({
    required this.studentId,
    required this.studentFirstName,
    required this.studentDateOfBirth,
    required this.studentPlaceOfBirth,
    required this.gender,
    required this.incidentNumber,
    required this.incidentDate,
    required this.publicRecordId,
    required this.phoneNumber,
    required this.whatsappPhoneNumber,
    required this.landLine,
    required this.joinDate,
    required this.studentReligion, required this.fatherFirstName, required this.lastName, required this.grandFatherName, required this.grandMotherName, required this.fatherCareer, required this.fatherPlaceOfResidence, required this.fatherTieNumber, required this.fatherTiePlace, required this.fatherPlaceOfBirth, required this.fatherReligion, required this.fatherCivilRegisterSecretary, required this.educationalStatus, required this.fatherPhoneNumber, required this.fatherPermenantAddress, required this.motherName, required this.motherLastName, required this.motherFatherName, required this.motherMotherName, required this.motherDoesLiveWithHasband, required this.motherCareer, required this.motherTieNumber, required this.motherTiePlace, required this.motherPlaceOfBirth, required this.motherDateOfBirth, required this.motherReligion, required this.motherEducationalStatus, required this.motherPhoneNumber, required this.userName, required this.password, required this.addressName, required this.addressDetails, required this.areaName, required this.cityName, this.leaveDate,
  });

  StudentProfileView copyWith({
    int? studentId,
    String? studentFirstName,
    DateTime? studentDateOfBirth,
    String? studentPlaceOfBirth,
    bool? gender,
    String? incidentNumber,
    String? incidentDate,
    int? publicRecordId,
    String? phoneNumber,
    String? whatsappPhoneNumber,
    String? landLine,
    DateTime? joinDate,
    DateTime? leaveDate,
    Religion? studentReligion,
    String? fatherFirstName,
    String? lastName,
    String? grandFatherName,
    String? grandMotherName,
    String? fatherCareer,
    String? fatherPlaceOfResidence,
    String? fatherTieNumber,
    String? fatherTiePlace,
    String? fatherPlaceOfBirth,
    Religion? fatherReligion,
    String? fatherCivilRegisterSecretary,
    EducationalStatus? educationalStatus,
    String? fatherPhoneNumber,
    String? fatherPermenantAddress,
    String? motherName,
    String? motherLastName,
    String? motherFatherName,
    String? motherMotherName,
    bool? motherDoesLiveWithHasband,
    String? motherCareer,
    String? motherTieNumber,
    String? motherTiePlace,
    String? motherPlaceOfBirth,
    DateTime? motherDateOfBirth,
    Religion? motherReligion,
    EducationalStatus? motherEducationalStatus,
    String? motherPhoneNumber,
    String? userName,
    String? password,
    String? addressName,
    String? addressDetails,
    String? areaName,
    String? cityName,
  }) {
    return StudentProfileView(
      studentId: studentId ?? this.studentId,
      studentFirstName: studentFirstName ?? this.studentFirstName,
      studentDateOfBirth: studentDateOfBirth ?? this.studentDateOfBirth,
      studentPlaceOfBirth: studentPlaceOfBirth ?? this.studentPlaceOfBirth,
      gender: gender ?? this.gender,
      incidentNumber: incidentNumber ?? this.incidentNumber,
      incidentDate: incidentDate ?? this.incidentDate,
      publicRecordId: publicRecordId ?? this.publicRecordId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      whatsappPhoneNumber: whatsappPhoneNumber ?? this.whatsappPhoneNumber,
      landLine: landLine ?? this.landLine,
      joinDate: joinDate ?? this.joinDate,
      leaveDate: leaveDate ?? this.leaveDate,
      studentReligion: studentReligion ?? this.studentReligion,
      fatherFirstName: fatherFirstName ?? this.fatherFirstName,
      lastName: lastName ?? this.lastName,
      grandFatherName: grandFatherName ?? this.grandFatherName,
      grandMotherName: grandMotherName ?? this.grandMotherName,
      fatherCareer: fatherCareer ?? this.fatherCareer,
      fatherPlaceOfResidence:
          fatherPlaceOfResidence ?? this.fatherPlaceOfResidence,
      fatherTieNumber: fatherTieNumber ?? this.fatherTieNumber,
      fatherTiePlace: fatherTiePlace ?? this.fatherTiePlace,
      fatherPlaceOfBirth: fatherPlaceOfBirth ?? this.fatherPlaceOfBirth,
      fatherReligion: fatherReligion ?? this.fatherReligion,
      fatherCivilRegisterSecretary:
          fatherCivilRegisterSecretary ?? this.fatherCivilRegisterSecretary,
      educationalStatus: educationalStatus ?? this.educationalStatus,
      fatherPhoneNumber: fatherPhoneNumber ?? this.fatherPhoneNumber,
      fatherPermenantAddress:
          fatherPermenantAddress ?? this.fatherPermenantAddress,
      motherName: motherName ?? this.motherName,
      motherLastName: motherLastName ?? this.motherLastName,
      motherFatherName: motherFatherName ?? this.motherFatherName,
      motherMotherName: motherMotherName ?? this.motherMotherName,
      motherDoesLiveWithHasband:
          motherDoesLiveWithHasband ?? this.motherDoesLiveWithHasband,
      motherCareer: motherCareer ?? this.motherCareer,
      motherTieNumber: motherTieNumber ?? this.motherTieNumber,
      motherTiePlace: motherTiePlace ?? this.motherTiePlace,
      motherPlaceOfBirth: motherPlaceOfBirth ?? this.motherPlaceOfBirth,
      motherDateOfBirth: motherDateOfBirth ?? this.motherDateOfBirth,
      motherReligion: motherReligion ?? this.motherReligion,
      motherEducationalStatus:
          motherEducationalStatus ?? this.motherEducationalStatus,
      motherPhoneNumber: motherPhoneNumber ?? this.motherPhoneNumber,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      addressName: addressName ?? this.addressName,
      addressDetails: addressDetails ?? this.addressDetails,
      areaName: areaName ?? this.areaName,
      cityName: cityName ?? this.cityName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentId': studentId,
      'studentFirstName': studentFirstName,
      'studentDateOfBirth': studentDateOfBirth.millisecondsSinceEpoch,
      'studentPlaceOfBirth': studentPlaceOfBirth,
      'gender': gender,
      'incidentNumber': incidentNumber,
      'incidentDate': incidentDate,
      'publicRecordId': publicRecordId,
      'phoneNumber': phoneNumber,
      'whatsappPhoneNumber': whatsappPhoneNumber,
      'landLine': landLine,
      'joinDate': joinDate.millisecondsSinceEpoch,
      'leaveDate': leaveDate?.millisecondsSinceEpoch,
      'studentReligion': studentReligion.index,
      'fatherFirstName': fatherFirstName,
      'lastName': lastName,
      'grandFatherName': grandFatherName,
      'grandMotherName': grandMotherName,
      'fatherCareer': fatherCareer,
      'fatherPlaceOfResidence': fatherPlaceOfResidence,
      'fatherTieNumber': fatherTieNumber,
      'fatherTiePlace': fatherTiePlace,
      'fatherPlaceOfBirth': fatherPlaceOfBirth,
      'fatherReligion': fatherReligion.index,
      'fatherCivilRegisterSecretary': fatherCivilRegisterSecretary,
      'educationalStatus': educationalStatus.index,
      'fatherPhoneNumber': fatherPhoneNumber,
      'fatherPermenantAddress': fatherPermenantAddress,
      'motherName': motherName,
      'motherLastName': motherLastName,
      'motherFatherName': motherFatherName,
      'motherMotherName': motherMotherName,
      'motherDoesLiveWithHasband': motherDoesLiveWithHasband,
      'motherCareer': motherCareer,
      'motherTieNumber': motherTieNumber,
      'motherTiePlace': motherTiePlace,
      'motherPlaceOfBirth': motherPlaceOfBirth,
      'motherDateOfBirth': motherDateOfBirth.millisecondsSinceEpoch,
      'motherReligion': motherReligion.index,
      'motherEducationalStatus': motherEducationalStatus.index,
      'motherPhoneNumber': motherPhoneNumber,
      'userName': userName,
      'password': password,
      'addressName': addressName,
      'addressDetails': addressDetails,
      'areaName': areaName,
      'cityName': cityName,
    };
  }

  factory StudentProfileView.fromMap(Map<String, dynamic> map) {
    return StudentProfileView(
      studentId: map['studentId'] as int,
      studentFirstName: map['studentFirstName'] as String,
      studentDateOfBirth: DateTime.parse(map['studentDateOfBirth'].toString()),
      studentPlaceOfBirth: map['studentPlaceOfBirth'] as String,
      gender: map['gender'] as bool,
      incidentNumber: map['incidentNumber'] as String,
      incidentDate: map['incidentDate'] as String,
      publicRecordId: map['publicRecordId'] as int,
      phoneNumber: map['phoneNumber'] as String,
      whatsappPhoneNumber: map['whatsappPhoneNumber'] as String,
      landLine: map['landLine'] as String,
      joinDate: DateTime.parse(map['joinDate'].toString()),
      leaveDate: map['leaveDate'] != null
          ? DateTime.parse(map['leaveDate'].toString())
          : null,
      studentReligion: Religion.values[map['studentReligion'] as int],
      fatherFirstName: map['fatherFirstName'] as String,
      lastName: map['lastName'] as String,
      grandFatherName: map['grandFatherName'] as String,
      grandMotherName: map['grandMotherName'] as String,
      fatherCareer: map['fatherCareer'] as String,
      fatherPlaceOfResidence: map['fatherPlaceOfResidence'] as String,
      fatherTieNumber: map['fatherTieNumber'] as String,
      fatherTiePlace: map['fatherTiePlace'] as String,
      fatherPlaceOfBirth: map['fatherPlaceOfBirth'] as String,
      fatherReligion: Religion.values[map['fatherReligion'] as int],
      fatherCivilRegisterSecretary:
          map['fatherCivilRegisterSecretary'] as String,
      educationalStatus:
          EducationalStatus.values[map['educationalStatus'] as int],
      fatherPhoneNumber: map['fatherPhoneNumber'] as String,
      fatherPermenantAddress: map['fatherPermenantAddress'] as String,
      motherName: map['motherName'] as String,
      motherLastName: map['motherLastName'] as String,
      motherFatherName: map['motherFatherName'] as String,
      motherMotherName: map['motherMotherName'] as String,
      motherDoesLiveWithHasband: map['motherDoesLiveWithHasband'] as bool,
      motherCareer: map['motherCareer'] as String,
      motherTieNumber: map['motherTieNumber'] as String,
      motherTiePlace: map['motherTiePlace'] as String,
      motherPlaceOfBirth: map['motherPlaceOfBirth'] as String,
      motherDateOfBirth: DateTime.parse(map['motherDateOfBirth'].toString()),
      motherReligion: Religion.values[map['motherReligion'] as int],
      motherEducationalStatus:
          EducationalStatus.values[map['motherEducationalStatus'] as int],
      motherPhoneNumber: map['motherPhoneNumber'] as String,
      userName: map['userName'] as String,
      password: map['password'] as String,
      addressName: map['addressName'] as String,
      addressDetails: map['addressDetails'] as String,
      areaName: map['areaName'] as String,
      cityName: map['cityName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentProfileView.fromJson(String source) =>
      StudentProfileView.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentProfileView(studentId: $studentId, studentFirstName: $studentFirstName, studentDateOfBirth: $studentDateOfBirth, studentPlaceOfBirth: $studentPlaceOfBirth, gender: $gender, incidentNumber: $incidentNumber, incidentDate: $incidentDate, publicRecordId: $publicRecordId, phoneNumber: $phoneNumber, whatsappPhoneNumber: $whatsappPhoneNumber, landLine: $landLine, joinDate: $joinDate, leaveDate: $leaveDate, studentReligion: $studentReligion, fatherFirstName: $fatherFirstName, lastName: $lastName, grandFatherName: $grandFatherName, grandMotherName: $grandMotherName, fatherCareer: $fatherCareer, fatherPlaceOfResidence: $fatherPlaceOfResidence, fatherTieNumber: $fatherTieNumber, fatherTiePlace: $fatherTiePlace, fatherPlaceOfBirth: $fatherPlaceOfBirth, fatherReligion: $fatherReligion, fatherCivilRegisterSecretary: $fatherCivilRegisterSecretary, educationalStatus: $educationalStatus, fatherPhoneNumber: $fatherPhoneNumber, fatherPermenantAddress: $fatherPermenantAddress, motherName: $motherName, motherLastName: $motherLastName, motherFatherName: $motherFatherName, motherMotherName: $motherMotherName, motherDoesLiveWithHasband: $motherDoesLiveWithHasband, motherCareer: $motherCareer, motherTieNumber: $motherTieNumber, motherTiePlace: $motherTiePlace, motherPlaceOfBirth: $motherPlaceOfBirth, motherDateOfBirth: $motherDateOfBirth, motherReligion: $motherReligion, motherEducationalStatus: $motherEducationalStatus, motherPhoneNumber: $motherPhoneNumber, userName: $userName, password: $password, addressName: $addressName, addressDetails: $addressDetails, areaName: $areaName, cityName: $cityName)';
  }

  @override
  bool operator ==(covariant StudentProfileView other) {
    if (identical(this, other)) return true;

    return other.studentId == studentId &&
        other.studentFirstName == studentFirstName &&
        other.studentDateOfBirth == studentDateOfBirth &&
        other.studentPlaceOfBirth == studentPlaceOfBirth &&
        other.gender == gender &&
        other.incidentNumber == incidentNumber &&
        other.incidentDate == incidentDate &&
        other.publicRecordId == publicRecordId &&
        other.phoneNumber == phoneNumber &&
        other.whatsappPhoneNumber == whatsappPhoneNumber &&
        other.landLine == landLine &&
        other.joinDate == joinDate &&
        other.leaveDate == leaveDate &&
        other.studentReligion == studentReligion &&
        other.fatherFirstName == fatherFirstName &&
        other.lastName == lastName &&
        other.grandFatherName == grandFatherName &&
        other.grandMotherName == grandMotherName &&
        other.fatherCareer == fatherCareer &&
        other.fatherPlaceOfResidence == fatherPlaceOfResidence &&
        other.fatherTieNumber == fatherTieNumber &&
        other.fatherTiePlace == fatherTiePlace &&
        other.fatherPlaceOfBirth == fatherPlaceOfBirth &&
        other.fatherReligion == fatherReligion &&
        other.fatherCivilRegisterSecretary == fatherCivilRegisterSecretary &&
        other.educationalStatus == educationalStatus &&
        other.fatherPhoneNumber == fatherPhoneNumber &&
        other.fatherPermenantAddress == fatherPermenantAddress &&
        other.motherName == motherName &&
        other.motherLastName == motherLastName &&
        other.motherFatherName == motherFatherName &&
        other.motherMotherName == motherMotherName &&
        other.motherDoesLiveWithHasband == motherDoesLiveWithHasband &&
        other.motherCareer == motherCareer &&
        other.motherTieNumber == motherTieNumber &&
        other.motherTiePlace == motherTiePlace &&
        other.motherPlaceOfBirth == motherPlaceOfBirth &&
        other.motherDateOfBirth == motherDateOfBirth &&
        other.motherReligion == motherReligion &&
        other.motherEducationalStatus == motherEducationalStatus &&
        other.motherPhoneNumber == motherPhoneNumber &&
        other.userName == userName &&
        other.password == password &&
        other.addressName == addressName &&
        other.addressDetails == addressDetails &&
        other.areaName == areaName &&
        other.cityName == cityName;
  }

  @override
  int get hashCode {
    return studentId.hashCode ^
        studentFirstName.hashCode ^
        studentDateOfBirth.hashCode ^
        studentPlaceOfBirth.hashCode ^
        gender.hashCode ^
        incidentNumber.hashCode ^
        incidentDate.hashCode ^
        publicRecordId.hashCode ^
        phoneNumber.hashCode ^
        whatsappPhoneNumber.hashCode ^
        landLine.hashCode ^
        joinDate.hashCode ^
        leaveDate.hashCode ^
        studentReligion.hashCode ^
        fatherFirstName.hashCode ^
        lastName.hashCode ^
        grandFatherName.hashCode ^
        grandMotherName.hashCode ^
        fatherCareer.hashCode ^
        fatherPlaceOfResidence.hashCode ^
        fatherTieNumber.hashCode ^
        fatherTiePlace.hashCode ^
        fatherPlaceOfBirth.hashCode ^
        fatherReligion.hashCode ^
        fatherCivilRegisterSecretary.hashCode ^
        educationalStatus.hashCode ^
        fatherPhoneNumber.hashCode ^
        fatherPermenantAddress.hashCode ^
        motherName.hashCode ^
        motherLastName.hashCode ^
        motherFatherName.hashCode ^
        motherMotherName.hashCode ^
        motherDoesLiveWithHasband.hashCode ^
        motherCareer.hashCode ^
        motherTieNumber.hashCode ^
        motherTiePlace.hashCode ^
        motherPlaceOfBirth.hashCode ^
        motherDateOfBirth.hashCode ^
        motherReligion.hashCode ^
        motherEducationalStatus.hashCode ^
        motherPhoneNumber.hashCode ^
        userName.hashCode ^
        password.hashCode ^
        addressName.hashCode ^
        addressDetails.hashCode ^
        areaName.hashCode ^
        cityName.hashCode;
  }
}
