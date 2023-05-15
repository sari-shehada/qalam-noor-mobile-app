import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSent;
  const ChatBubble({
    Key? key,
    required this.message,
    required this.isSent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.h,
        right: isSent ? 40.w : 0,
        left: isSent ? 0 : 40.w,
      ),
      child: Align(
        alignment: isSent ? Alignment.centerLeft : Alignment.centerRight,
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
            color: isSent
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
              bottomLeft: isSent ? Radius.zero : Radius.circular(12.r),
              bottomRight: isSent ? Radius.circular(12.r) : Radius.zero,
            ),
          ),
          padding: EdgeInsets.all(11.h),
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isSent
                    ? Theme.of(context).colorScheme.onSurface
                    : Colors.white),
          ),
        ),
      ),
    );
  }
}
