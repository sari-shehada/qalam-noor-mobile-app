import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Area {
  const Area({
    required this.id,
    required this.name,
    required this.cityId,
  });

  factory Area.fromMap(Map<String, dynamic> map) {
    return Area(
      id: map['id'] as int,
      name: map['name'] as String,
      cityId: map['cityId'] as int,
    );
  }
  factory Area.fromJson(String source) =>
      Area.fromMap(json.decode(source) as Map<String, dynamic>);

  final int id;
  final String name;
  final int cityId;

  Area copyWith({
    int? id,
    String? name,
    int? cityId,
  }) {
    return Area(
      id: id ?? this.id,
      name: name ?? this.name,
      cityId: cityId ?? this.cityId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'cityId': cityId,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Area(id: $id, name: $name, cityId: $cityId)';

  @override
  bool operator ==(covariant Area other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id && other.name == name && other.cityId == cityId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ cityId.hashCode;
}
