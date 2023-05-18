// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';

abstract class DialogService {
  static Future<T?> openConfirmationDialog<T>({
    required String title,
    Widget? content,
    Row? actions,
    bool showCloseButton = true,
    Color? dialogColor,
    Size size = const Size(double.infinity, 200),
    EdgeInsets? dialogPadding,
    bool barrierDismissible = true,
    bool useSafeArea = true,
  }) async {
    // double titleSectionSize =
    return Get.dialog<T>(
      Center(
        child: Padding(
          padding: dialogPadding ?? EdgeInsets.symmetric(horizontal: 20.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: dialogColor ?? Colors.white,
              child: SizedBox.fromSize(
                size: size,
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 160.h,
                        minHeight: 50.h,
                      ),
                      child: Container(
                        color: Colors.red,
                        child: SizedBox(
                          height: size.height * .1,
                          child: Stack(
                            children: [
                              !showCloseButton
                                  ? const SizedBox.shrink()
                                  : Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(
                                          Icons.cancel_outlined,
                                          color: Get.theme.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                              Center(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Wrap(
                                    children: [
                                      Text(
                                        title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: Get.theme.textTheme.titleMedium!
                                            .copyWith(
                                          color: Get.theme.colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: content ?? const SizedBox.shrink(),
                    ),
                    actions == null
                        ? const SizedBox.shrink()
                        : ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 200.h,
                              minHeight: 50.h,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 7.h),
                              child: actions,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
    );
  }
}

abstract class SomethingToTestOn {
  static Either<String, int> testFunction() {
    return right<String, int>(12);
  }

  somOtherFunction() {
    testFunction().fold((l) => {}, (r) => {});
  }
}

class ErrorHandlerModel {
  final String errorMessage;
  final dynamic extras;
  ErrorHandlerModel({
    required this.errorMessage,
    required this.extras,
  });
}

class PersonModel {
  final String name;
  final int age;
  PersonModel({
    required this.name,
    required this.age,
  });
}

typedef FutureEither<T> = Future<Either<ErrorHandlerModel, PersonModel>>;

class PersonController {
  static PersonController get instance => PersonController();

  FutureEither<PersonModel> getDummyPerson() async {
    await Future.delayed(const Duration(seconds: 2));
    var someVar = Random().nextBool();
    if (someVar) {
      return left(ErrorHandlerModel(errorMessage: 'Test', extras: null));
    }
    return right(PersonModel(name: 'name', age: 12));
  }
}

class ConsumerClass {
  testMethod() async {
    final result = await PersonController.instance.getDummyPerson();
    result.fold((l) {
      print('Got an error here: ${l.errorMessage}');
    }, (r) {
      print('Got a success here: ${r.name}');
    });
  }
}
