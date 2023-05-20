import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/controllers/conversation_controller.dart';
import 'package:qalam_noor_parents/models/conversations/conversation.dart';

class InboxPageController extends GetxController {
  InboxPageController() {
    isLoading.value = true;
    _getStudentConversations();
  }
  Rx<Either<String, List<Conversation>>?> conversations =
      Rx<Either<String, List<Conversation>>?>(null);
  RxBool isLoading = false.obs;

  FutureEither<List<Conversation>> _getStudentConversations() async {
    isLoading.value = true;
    final Either<String, List<Conversation>> futureConversations =
        await ConversationController.instance
            .getConversationsByCurrentStudentId();
    conversations = futureConversations.obs;
    isLoading.value = false;
    return futureConversations;
  }

  Future<void> refreshList() async {
    await _getStudentConversations();
  }
}
