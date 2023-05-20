import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/models/enums.dart';

import '../../../controllers/conversation_controller.dart';
import '../../../models/conversations/conversation.dart';
import '../../../models/conversations/message.dart';

class ChatPageController extends GetxController {
  ChatPageController({required this.conversation}) {
    isLoading.value = true;
    _getMessagesByConversationId();
    // int ctr = 0;
    _timer = Timer.periodic(
      const Duration(milliseconds: 200),
      (Timer timer) async {
        if (conversation.status == ConversationStatus.closed) {
          timer.cancel();
        }
        await refreshChat();
      },
    );
  }
  late Timer _timer;
  Rx<Either<String, List<Message>>?> messages =
      Rx<Either<String, List<Message>>?>(null);
  final RxBool isLoading = true.obs;
  RxBool isInitiallyLoading = true.obs;
  final Conversation conversation;

  FutureEither<List<Message>> _getMessagesByConversationId() async {
    isLoading.value = true;
    final Either<String, List<Message>> listOfMessages =
        await ConversationController.instance
            .getMessagesByConversationId(conversationId: conversation.id);

    if (messages.value == null) {
      messages = listOfMessages.obs;
    } else {
      messages
        ..value = listOfMessages
        ..refresh();
    }

    if (isInitiallyLoading.value) {
      isInitiallyLoading.value = false;
    }
    isLoading.value = false;
    return listOfMessages;
  }

  Future<void> refreshChat() async {
    if (isLoading.value) {
      return;
    }
    // print('Calling BE');
    await _getMessagesByConversationId();
  }

  @override
  void onClose() {
    cancelTimer();
    super.onClose();
  }

  //TODO: Call on get.back from conversation screen;
  void cancelTimer() {
    _timer.cancel();
  }
}
