import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class JobTitle {
  const JobTitle({
    required this.id,
    required this.name,
  });

  factory JobTitle.fromMap(Map<String, dynamic> map) {
    return JobTitle(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  factory JobTitle.fromJson(String source) =>
      JobTitle.fromMap(json.decode(source) as Map<String, dynamic>);

  final int id;
  final String name;

  JobTitle copyWith({
    int? id,
    String? name,
  }) {
    return JobTitle(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'JobTitle(id: $id, name: $name)';

  @override
  bool operator ==(covariant JobTitle other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
