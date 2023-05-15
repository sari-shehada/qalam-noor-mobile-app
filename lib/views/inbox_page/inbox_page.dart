// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/models/conversations/conversation.dart';
import 'package:qalam_noor_parents/models/enums.dart';

import '../../tools/ui_tools/custom_appbar.dart';
import '../../tools/ui_tools/custom_scaffold.dart';
import '../chat_page/chat_page.dart';
import '../chat_page/controllers/chat_page_controller.dart';

class InboxPage1 extends StatelessWidget {
  static const String routeName = '/inboxPage';

  const InboxPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: 'صندوق الوارد',
        backButtonEnabled: false,
        actions: [
          IconButton(
            tooltip: 'انشاء محادثة جديدة',
            onPressed: () async {
              //TODO: Add New Chat
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
      body: ListView(
        padding: EdgeInsets.only(top: 10.h),
        children: List.generate(20, (index) {
          return _ConversationCard(
            conversation: Conversation(
              id: 12,
              studentId: 12,
              title: 'هذه شكوى على ابنك المهمل في دراسته وامور ثانية',
              status: index % 3 == 0
                  ? ConversationStatus.closed
                  : ConversationStatus.open,
              originalIssuer: index % 2 == 0
                  ? ConversationParty.parents
                  : ConversationParty.secretKeeper,
            ),
          );
        }),
      ),
    );
  }
}

class _ConversationCard extends StatelessWidget {
  final Conversation conversation;
  const _ConversationCard({
    required this.conversation,
  });

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
        onTap: () {
          Get.toNamed(
            ChatPage.routeName,
            arguments: ChatPageController(conversation: conversation),
          );
        },
        leading: buildAppropriateIssuerIcon(conversation.originalIssuer),
        title: Text(
          conversation.title,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(getAppropriateIssuerTitle(conversation.originalIssuer)),
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
