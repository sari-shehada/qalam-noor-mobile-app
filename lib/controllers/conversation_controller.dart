import 'package:fpdart/fpdart.dart';
import 'package:qalam_noor_parents/models/conversations/conversation.dart';
import 'package:qalam_noor_parents/models/conversations/message.dart';
import 'package:qalam_noor_parents/shared/global_params.dart';

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
}
