import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qalam_noor_parents/models/conversations/conversation.dart';
import 'package:qalam_noor_parents/models/enums.dart';
import 'package:qalam_noor_parents/tools/ui_tools/buttons.dart';
import 'package:qalam_noor_parents/tools/ui_tools/ui_tools.dart';
import 'package:qalam_noor_parents/views/inbox_page/controllers/inbox_page_contoroller.dart';

import '../../shared/global_params.dart';
import '../../tools/dialogs_services/snack_bar_service.dart';
import '../../tools/ui_tools/custom_appbar.dart';
import '../../tools/ui_tools/custom_scaffold.dart';
import '../chat_page/chat_page.dart';
import '../chat_page/controllers/chat_page_controller.dart';

class InboxPage extends StatelessWidget {

  const InboxPage({super.key});
  static const String routeName = '/inboxPage';

  @override
  Widget build(BuildContext context) {
    final InboxPageController controller = Get.put(InboxPageController());
    return CustomScaffold(
      appBar: CustomAppBar(
        title: 'صندوق الوارد',
        backButtonEnabled: false,
        actions: [
          IconButton(
            tooltip: 'انشاء محادثة جديدة',
            onPressed: () async {
              final bool? val = await controller.openAddConversationDialog();
              if (val != null && val) {
                SnackbarService.showSuccessSnackBar(
                  title: 'تمت العملية بنجاح',
                  message: 'تم انشاء المحادثة بنجاح',
                );
                await controller.refreshList();
              }
            },
            icon: Icon(
              Icons.add,
              color: Theme.of(context).textTheme.titleMedium!.color,
              size: 20.sp,
            ),
          ),
        ],
      ),
      bodyPadding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: LoadingAnimationWidget.fallingDot(
                color: Theme.of(context).colorScheme.primary,
                size: 40.w,
              ),
            );
          }
          return controller.conversations.value!.fold(
            (String errorMessage) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 30.sp,
                      ),
                      AddHorizontalSpacing(value: 10.w),
                      Center(
                          child: Text(
                        errorMessage,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                    ],
                  ),
                  AddVerticalSpacing(value: 30.h),
                  CustomFilledButton<String>(
                    height: 40.h,
                    width: 150.w,
                    onTap: () async {
                      await controller.refreshList();
                    },
                    child: 'تحديث',
                  ),
                ],
              );
            },
            (List<Conversation> conversations) {
              if (conversations.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat_sharp,
                          color: Theme.of(context).colorScheme.primary,
                          size: 25.sp,
                        ),
                        AddHorizontalSpacing(value: 10.w),
                        Center(
                            child: Text(
                          'لا يوجد محادثات تخص "${GlobalParams.selectedStudent.firstName}" حاليا',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                      ],
                    ),
                    AddVerticalSpacing(value: 30.h),
                    CustomFilledButton<String>(
                      height: 40.h,
                      width: 150.w,
                      onTap: () async {
                        await controller.refreshList();
                      },
                      child: 'تحديث',
                    ),
                  ],
                );
              }
              conversations = conversations.reversed.toList();
              return RefreshIndicator(
                onRefresh: () async {
                  return controller.refreshList();
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  padding: EdgeInsets.only(top: 10.h),
                  itemCount: conversations.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _ConversationCard(
                      conversation: conversations[index],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _ConversationCard extends StatelessWidget {
  const _ConversationCard({
    required this.conversation,
  });
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: ListTile(
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(.2),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        onTap: () async {
          await Get.toNamed<void>(
            ChatPage.routeName,
            arguments: ChatPageController(conversation: conversation),
          );
        },
        leading: buildAppropriateIssuerIcon(conversation.orginalIssuer),
        title: Text(
          conversation.title,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(getAppropriateIssuerTitle(conversation.orginalIssuer)),
        dense: false,
        trailing: Icon(
          Icons.circle,
          //TODO: Should be changed to contains read or unread messages
          //If unread, the circle shouldn't be visible, otherwise visible
          color: conversation.status == ConversationStatus.open
              ? Colors.transparent
              : Colors.red[700],
        ),
      ),
    );
  }

  Icon buildAppropriateIssuerIcon(ConversationParty party) {
    switch (party) {
      case ConversationParty.other:
        return Icon(
          Icons.outlet_sharp,
          color: Get.theme.colorScheme.primary,
        );
      case ConversationParty.secretKeeper:
        return Icon(
          Icons.store,
          color: Get.theme.colorScheme.primary,
        );
      case ConversationParty.teacher:
        return Icon(
          Icons.man_outlined,
          color: Get.theme.colorScheme.primary,
        );
      case ConversationParty.parents:
        return Icon(
          Icons.man,
          color: Get.theme.colorScheme.primary,
        );
    }
  }

  String getAppropriateIssuerTitle(ConversationParty originalIssuer) {
    switch (originalIssuer) {
      case ConversationParty.other:
        return 'غير ذلك';
      case ConversationParty.secretKeeper:
        return 'امانة السر';
      case ConversationParty.teacher:
        return 'المدرس';
      case ConversationParty.parents:
        return 'الاهل (انت)';
    }
  }
}
