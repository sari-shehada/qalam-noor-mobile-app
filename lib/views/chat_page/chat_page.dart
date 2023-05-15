import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/models/enums.dart';
import 'package:qalam_noor_parents/tools/ui_tools/text_fields.dart';
import 'package:qalam_noor_parents/tools/ui_tools/ui_tools.dart';
import 'package:qalam_noor_parents/views/chat_page/controllers/chat_page_controller.dart';
import 'package:qalam_noor_parents/views/chat_page/widgets/chat_bubble.dart';
import '../../tools/ui_tools/custom_appbar.dart';
import '../../tools/ui_tools/custom_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatefulWidget {
  static const routeName = '/chatPage';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FocusNode messageFocusNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  late final ChatPageController controller;
  bool shouldShowBackToBottom = false;
  double initialBackToBottomOffset = 400.h;

  @override
  void initState() {
    super.initState();
    //Initialize Controller
    controller = Get.put<ChatPageController>(Get.arguments);

    WidgetsFlutterBinding.ensureInitialized();
    //TODO: Call On Future Get Messages

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollListToEnd();
    });
    messageFocusNode.addListener(() async {
      await Future.delayed(const Duration(milliseconds: 500));

      if (messageFocusNode.hasFocus) {
        scrollListToEnd(shouldAnimate: true);
      }
    });
    scrollController.addListener(() {
      if (Get.mediaQuery.viewInsets.bottom != 0) {
        initialBackToBottomOffset = Get.mediaQuery.viewInsets.bottom;
      }
      shouldShowBackToBottom = scrollController.offset <=
          scrollController.position.maxScrollExtent - initialBackToBottomOffset;
      setState(() {});
    });
  }

  Future<void> scrollListToEnd({bool shouldAnimate = false}) async {
    if (shouldAnimate) {
      scrollController.animateTo(
        40.h + scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
      return;
    }
    scrollController.jumpTo(
      scrollController.position.maxScrollExtent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: controller.conversation.title,
        backButtonEnabled: true,
      ),
      bodyPadding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  children: List.generate(
                    100,
                    (index) => ChatBubble(
                      message: index % 2 == 0 ? 'هلا❤️' : 'مرحبا👋🏻',
                      isSent: index % 2 == 0,
                    ),
                  ),
                ),
              ),
              AddVerticalSpacing(value: 10.h),
              controller.conversation.status == ConversationStatus.closed
                  ? Row(
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
                  : Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Get.theme.colorScheme.primary),
                          ),
                          padding: EdgeInsets.all(12.sp),
                          iconSize: 22.sp,
                          color: Colors.white,
                          icon: Transform.rotate(
                            angle: 3.14, //PIE
                            child: const Icon(
                              Icons.send,
                            ),
                          ),
                        ),
                        AddHorizontalSpacing(value: 10.w),
                        Expanded(
                          child: Focus(
                            focusNode: messageFocusNode,
                            child: HintedTextField(
                              hintText: 'Message',
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12.sp),
                              fontSize: 18.sp,
                              controller: TextEditingController(),
                            ),
                          ),
                        ),
                      ],
                    ),
              AddVerticalSpacing(value: 10.h),
            ],
          ),
          !shouldShowBackToBottom
              ? const SizedBox.shrink()
              : Positioned(
                  bottom: 100,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      scrollListToEnd(shouldAnimate: true);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      shadowColor: MaterialStatePropertyAll(Colors.grey),
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
