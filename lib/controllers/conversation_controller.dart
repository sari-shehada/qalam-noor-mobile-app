import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:qalam_noor_parents/models/conversations/conversation.dart';
import 'package:qalam_noor_parents/models/conversations/message.dart';
import 'package:qalam_noor_parents/shared/global_params.dart';

import '../models/enums.dart';
import '../tools/logic_tools/network_service.dart';

typedef FutureEither<T> = Future<Either<String, T>>;

class ConversationController {
  const ConversationController();
  static const ConversationController instance = ConversationController();

  String get _conversationsControllerName => 'ConversationController/';
  String get _messagesControllerName => 'MassegeController/';

  FutureEither<List<Message>> getMessagesByConversationId(
      {required int conversationId}) async {
    try {
      final String endPoint =
          '${_messagesControllerName}GetMessagesByConversationID?conversationId=$conversationId';

      final List<Message> messages =
          await HttpService.getParsed<List<Message>, List<dynamic>>(
        url: endPoint,
        dataMapper: (List<dynamic> responseData) {
          return responseData
              .map<Message>((e) => Message.fromMap(e as Map<String, dynamic>))
              .toList();
        },
      );
      return right(messages);
    } catch (e) {
      print(e);
      return left('حدث خطأ اثناء جلب المحادثة، حاول مرة أخرى');
    }
  }

  FutureEither<List<Conversation>> getConversationsByCurrentStudentId(
      {int? studentId}) async {
    try {
      final int selectedStudentId =
          studentId ?? GlobalParams.selectedStudent.id;
      final String endPoint =
          '${_conversationsControllerName}GetConversationsByStudentId?studentId=$selectedStudentId';
      final List<Conversation> conversations =
          await HttpService.getParsed<List<Conversation>, List<dynamic>>(
        url: endPoint,
        dataMapper: (List<dynamic> responseData) {
          return responseData
              .map<Conversation>(
                  (e) => Conversation.fromMap(e as Map<String, dynamic>))
              .toList();
        },
      );
      return right(conversations);
    } catch (e) {
      print(e);
      return left('حدث خطأ اثناء جلب المحادثات، حاول مرة أخرى');
    }
  }

  FutureEither<bool> sendMessage(
      {required String body, required int conversationId}) async {
    try {
      final Message message = Message(
        id: -1,
        conversationId: conversationId,
        body: body,
        sender: ConversationParty.parents,
        date: '_DISPOSABLE_STRING',
      );
      final String endPoint = '${_messagesControllerName}InsertMassege';
      log(endPoint);
      final int? sendStatus = await HttpService.post(
        url: endPoint,
        body: message.toJson(),
      );
      if (sendStatus == null) {
        throw Exception('Null Returned');
      }
      if (sendStatus == 0) {
        throw Exception('Expected to get Message ID but got $sendStatus');
      }
      return right(true);
    } catch (e) {
      print(e);
      return left('حدث خطأ اثناء ارسال رسالتك، حاول مرة أخرى');
    }
  }

  FutureEither<bool> createNewConversation(
      {required String conversationTitle}) async {
    try {
      final Conversation conversation = Conversation(
        id: -1,
        studentId: GlobalParams.selectedStudent.id,
        title: conversationTitle,
        status: ConversationStatus.open,
        orginalIssuer: ConversationParty.parents,
        isReadOther: false,
        isReadParent: true,
      );
      final String endPoint =
          '${_conversationsControllerName}InsertConversation';
      log(endPoint);
      final int? sendStatus = await HttpService.post(
        url: endPoint,
        body: conversation.toJson(),
      );
      if (sendStatus == null) {
        throw Exception('Null Returned');
      }
      if (sendStatus == 0) {
        throw Exception('Expected to get Message ID but got $sendStatus');
      }
      return right(true);
    } catch (e) {
      print(e);
      return left('حدث خطأ اثناء انشاء المحادثة، حاول مرة أخرى');
    }
  }
}
