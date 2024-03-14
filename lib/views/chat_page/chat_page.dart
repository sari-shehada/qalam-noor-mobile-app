import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qalam_noor_parents/models/conversations/message.dart';
import 'package:qalam_noor_parents/tools/dialogs_services/snack_bar_service.dart';

import '../../models/enums.dart';
import '../../tools/ui_tools/buttons.dart';
import '../../tools/ui_tools/custom_appbar.dart';
import '../../tools/ui_tools/custom_scaffold.dart';
import '../../tools/ui_tools/text_fields.dart';
import '../../tools/ui_tools/ui_tools.dart';
import 'controllers/chat_page_controller.dart';
import 'widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  static const String routeName = '/chatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FocusNode messageFocusNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  late final ChatPageController controller;
  bool shouldShowBackToBottom = false;
  double initialBackToBottomOffset = Get.mediaQuery.size.height / 2;

  late StreamSubscription<bool> subscription;
  @override
  void initState() {
    super.initState();
    //Initialize Controller
    controller = Get.put<ChatPageController>(Get.arguments);

    WidgetsFlutterBinding.ensureInitialized();
    //TODO: Call On Future Get Messages

    subscription = controller.isInitiallyLoading.stream.listen(
      (bool event) {
        if (!event) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              scrollListToEnd();
            },
          );
        }
      },
    );

    messageFocusNode.addListener(() async {
      await Future<void>.delayed(const Duration(milliseconds: 500));

      if (messageFocusNode.hasFocus) {
        await scrollListToEnd(shouldAnimate: true);
      }
    });

    scrollController.addListener(() {
      shouldShowBackToBottom = scrollController.offset <=
          scrollController.position.maxScrollExtent - initialBackToBottomOffset;
      setState(() {});
    });
  }

  Future<void> scrollListToEnd({bool shouldAnimate = false}) async {
    if (shouldAnimate) {
      await scrollController.animateTo(
        40.h +
            scrollController.position.maxScrollExtent +
            (initialBackToBottomOffset / 2),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
      return;
    }
    scrollController.jumpTo(
      scrollController.position.maxScrollExtent +
          (initialBackToBottomOffset / 2),
    );
    await subscription.cancel();
  }

  final TextEditingController _messageTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: controller.conversation.title),
      bodyPadding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Obx(
                  () {
                    if (controller.isInitiallyLoading.value) {
                      return Center(
                        child: LoadingAnimationWidget.fallingDot(
                          color: Theme.of(context).colorScheme.primary,
                          size: 40.w,
                        ),
                      );
                    }
                    return controller.messages.value!.fold(
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
                                await controller.refreshChat();
                              },
                              child: 'تحديث',
                            ),
                          ],
                        );
                      },
                      (List<Message> chat) {
                        return ListView.builder(
                          controller: scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: chat.length,
                          padding: EdgeInsets.only(top: 15.h),
                          itemBuilder: (BuildContext context, int index) {
                            return ChatBubble(
                              message: chat[index],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              AddVerticalSpacing(value: 10.h),
              if (controller.conversation.status == ConversationStatus.closed)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 15.r,
                      child: const Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ),
                    AddHorizontalSpacing(value: 10.w),
                    Text(
                      'هذه المحادثة منتهية',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )
              else
                Row(
                  children: <Widget>[
                    Obx(() {
                      if (controller.isSendingMessage.value) {
                        return SizedBox(
                          width: 50.w,
                          height: 50.h,
                          child: LoadingAnimationWidget.bouncingBall(
                            color: Theme.of(context).colorScheme.primary,
                            size: 40.h,
                          ),
                        );
                      }
                      return SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: IconButton(
                          onPressed: () async {
                            if (_messageTextEditingController.text
                                .trim()
                                .isEmpty) {
                              SnackbarService.showErrorSnackBar(
                                  title: 'حدث خطأ',
                                  message:
                                      'لا يمكن لحقل الرسالة ان يكون فارغاً');
                              return;
                            }
                            final bool sendResult =
                                await controller.sendMessage(
                              message:
                                  _messageTextEditingController.text.trim(),
                            );
                            if (sendResult) {
                              _messageTextEditingController.clear();
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Get.theme.colorScheme.primary),
                          ),
                          padding: EdgeInsets.all(12.sp),
                          iconSize: 22.sp,
                          color: Colors.white,
                          icon: Transform.rotate(
                            angle: 3.14,
                            child: const Icon(
                              Icons.send,
                            ),
                          ),
                        ),
                      );
                    }),
                    AddHorizontalSpacing(value: 10.w),
                    Expanded(
                      child: Focus(
                        focusNode: messageFocusNode,
                        child: HintedTextField(
                          hintText: 'رسالتك',
                          contentPadding: EdgeInsets.symmetric(vertical: 12.sp),
                          fontSize: 18.sp,
                          controller: _messageTextEditingController,
                        ),
                      ),
                    ),
                  ],
                ),
              AddVerticalSpacing(value: 10.h),
            ],
          ),
          if (shouldShowBackToBottom)
            Positioned(
              bottom: 100,
              right: 10,
              child: IconButton(
                onPressed: () {
                  scrollListToEnd(shouldAnimate: true);
                },
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                  shadowColor: MaterialStatePropertyAll<Color>(Colors.grey),
                ),
                padding: EdgeInsets.all(12.sp),
                iconSize: 22.sp,
                color: Theme.of(context).colorScheme.primary,
                icon: const Icon(
                  Icons.arrow_downward_rounded,
                  size: 25,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
