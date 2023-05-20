import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qalam_noor_parents/models/conversations/message.dart';
import 'package:qalam_noor_parents/models/enums.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.message,
    Key? key,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.h,
        right: message.sender == ConversationParty.parents ? 40.w : 0,
        left: message.sender == ConversationParty.parents ? 0 : 40.w,
      ),
      child: Align(
        alignment: message.sender == ConversationParty.parents
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                spreadRadius: 1,
                offset: const Offset(-1, 2),
                blurRadius: 2,
              ),
            ],
            color: message.sender == ConversationParty.parents
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
              bottomLeft: message.sender == ConversationParty.parents
                  ? Radius.zero
                  : Radius.circular(12.r),
              bottomRight: message.sender == ConversationParty.parents
                  ? Radius.circular(12.r)
                  : Radius.zero,
            ),
          ),
          padding: EdgeInsets.all(11.h),
          child: Text(
            message.body,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: message.sender == ConversationParty.parents
                    ? Theme.of(context).colorScheme.onSurface
                    : Colors.white),
          ),
        ),
      ),
    );
  }
}
