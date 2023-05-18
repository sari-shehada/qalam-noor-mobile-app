import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/agendas/families.dart';
import '../shared/item_or.dart';
import '../tools/logic_tools/network_service.dart';

class AuthController {
  static AuthController get instance => AuthController();
  String get _controllerName => "FamilyAuthenticationController/";
  Future<ItemOr<Family?, String>> loginUserByCredentials(
      {required String username, required String password}) async {
    String endPoint =
        "${_controllerName}Login?username=$username&password=$password";
    http.Response response = await HttpService.getUnparsed(endPoint);
    Map<String, dynamic> parsedResult = jsonDecode(response.body);
    if (parsedResult['success'] == false) {
      return ItemOr(
        item: null,
        other: parsedResult['message'],
        didSucceed: false,
      );
    }
    return ItemOr(
      item: Family.fromMap(parsedResult['family'] as Map<String, dynamic>),
      other: parsedResult['message'],
      didSucceed: true,
    );
  }
}
