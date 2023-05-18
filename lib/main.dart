import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:qalam_noor_parents/views/wrapper/wrapper_page.dart';

import 'helpers/shared_prefs_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  runApp(const Wrapper());
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
