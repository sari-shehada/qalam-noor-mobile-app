import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qalam_noor_parents/controllers/conversation_controller.dart';
import 'package:qalam_noor_parents/models/conversations/conversation.dart';
import 'package:qalam_noor_parents/tools/ui_tools/buttons.dart';
import 'package:qalam_noor_parents/tools/ui_tools/text_fields.dart';

import '../../../tools/dialogs_services/open_dialog_service.dart';
import '../../../tools/dialogs_services/snack_bar_service.dart';

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

  RxBool isCreatingConversation = false.obs;
  Future<bool> createNewConversation(
      {required String conversationTitle}) async {
    isCreatingConversation.value = true;
    bool didCreateSuccessfully = false;
    final Either<String, bool> result = await ConversationController.instance
        .createNewConversation(conversationTitle: conversationTitle);
    result.fold((String errorMessage) {
      SnackbarService.showErrorSnackBar(
        title: 'حدث خطأ',
        message: errorMessage,
      );
      didCreateSuccessfully = false;
    }, (bool result) {
      didCreateSuccessfully = true;
    });
    isCreatingConversation.value = false;
    return didCreateSuccessfully;
  }

  Future<bool?> openAddConversationDialog() async {
    final TextEditingController titleTxtEditingCtrl = TextEditingController();
    bool? result = await DialogService.openConfirmationDialog<bool?>(
      title: 'انشاء محادثة جديدة',
      dialogAlias: 'New Conversation Dialog',
      size: Size(double.infinity, 250.h),
      actions: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(
            () {
              if (isCreatingConversation.value) {
                return SizedBox(
                  height: 50.h,
                  width: 50.h,
                  child: LoadingAnimationWidget.discreteCircle(
                      color: Get.theme.colorScheme.primary, size: 40.h),
                );
              }
              return SizedBox(
                height: 50.h,
                width: 150.w,
                child: CustomFilledButton<String>(
                  onTap: () async {
                    if (titleTxtEditingCtrl.text.trim().isEmpty) {
                      SnackbarService.showErrorSnackBar(
                        title: 'حدث خطأ',
                        message: 'حقل العنوان لا يمكن ان يكون فارغاً',
                      );
                      return;
                    }
                    final bool result = await createNewConversation(
                        conversationTitle: titleTxtEditingCtrl.text.trim());
                    Get.back<bool>(result: result);
                  },
                  child: 'إنشاء',
                ),
              );
            },
          ),
        ],
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LabeledTextField(
              controller: titleTxtEditingCtrl,
              label: 'عنوان المحادثة',
            ),
          ],
        ),
      ),
    );
    return result;
  }
}
