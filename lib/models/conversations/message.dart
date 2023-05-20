// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../enums.dart';

class Message {
  int id;
  int conversationId;
  String body;

  //enum
  final ConversationParty sender;
  String date;
  Message({
    required this.id,
    required this.conversationId,
    required this.body,
    required this.sender,
    required this.date,
  });

  Message copyWith({
    int? id,
    int? conversationId,
    String? body,
    ConversationParty? sender,
    String? date,
  }) {
    return Message(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      body: body ?? this.body,
      sender: sender ?? this.sender,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'conversationId': conversationId,
      'body': body,
      'sender': sender.index,
      'date': date,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as int,
      conversationId: map['conversationId'] as int,
      body: map['body'] as String,
      sender: ConversationParty.values[map['sender'] as int],
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(id: $id, conversationId: $conversationId, body: $body, sender: $sender, date: $date)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.conversationId == conversationId &&
        other.body == body &&
        other.sender == sender &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        conversationId.hashCode ^
        body.hashCode ^
        sender.hashCode ^
        date.hashCode;
  }
}
