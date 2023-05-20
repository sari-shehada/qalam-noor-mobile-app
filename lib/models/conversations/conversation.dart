// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../enums.dart';

class Conversation {
  final int id;
  final int studentId;
  final String title;

  //enum
  final ConversationStatus status;
  //enum
  final ConversationParty orginalIssuer;

  final bool isReadOther;
  final bool isReadParent;
  Conversation({
    required this.id,
    required this.studentId,
    required this.title,
    required this.status,
    required this.orginalIssuer,
    required this.isReadOther,
    required this.isReadParent,
  });

  Conversation copyWith({
    int? id,
    int? studentId,
    String? title,
    ConversationStatus? status,
    ConversationParty? orginalIssuer,
    bool? isReadOther,
    bool? isReadParent,
  }) {
    return Conversation(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      title: title ?? this.title,
      status: status ?? this.status,
      orginalIssuer: orginalIssuer ?? this.orginalIssuer,
      isReadOther: isReadOther ?? this.isReadOther,
      isReadParent: isReadParent ?? this.isReadParent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'studentId': studentId,
      'title': title,
      'status': status.index,
      'orginalIssuer': orginalIssuer.index,
      'isReadOther': isReadOther,
      'isReadParent': isReadParent,
    };
  }

  factory Conversation.fromMap(Map<String, dynamic> map) {
    return Conversation(
      id: map['id'] as int,
      studentId: map['studentId'] as int,
      title: map['title'] as String,
      status: ConversationStatus.values[map['status'] as int],
      orginalIssuer: ConversationParty.values[map['orginalIssuer'] as int],
      isReadOther: map['isReadOther'] as bool,
      isReadParent: map['isReadParent'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Conversation.fromJson(String source) =>
      Conversation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Conversation(id: $id, studentId: $studentId, title: $title, status: $status, orginalIssuer: $orginalIssuer, isReadOther: $isReadOther, isReadParent: $isReadParent)';
  }

  @override
  bool operator ==(covariant Conversation other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.studentId == studentId &&
        other.title == title &&
        other.status == status &&
        other.orginalIssuer == orginalIssuer &&
        other.isReadOther == isReadOther &&
        other.isReadParent == isReadParent;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        studentId.hashCode ^
        title.hashCode ^
        status.hashCode ^
        orginalIssuer.hashCode ^
        isReadOther.hashCode ^
        isReadParent.hashCode;
  }
}
