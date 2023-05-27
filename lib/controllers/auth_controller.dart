import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/agendas/families.dart';
import '../shared/item_or.dart';
import '../tools/logic_tools/network_service.dart';

class AuthController {
  const AuthController();
  static const AuthController instance = AuthController();
  String get _controllerName => 'FamilyAuthenticationController/';
  Future<ItemOr<Family?, String>> loginUserByCredentials(
      {required String username, required String password}) async {
    final String endPoint =
        '${_controllerName}Login?username=$username&password=$password';
    final http.Response response = await HttpService.getUnparsed(endPoint);
    final Map<String, dynamic> parsedResult = jsonDecode(response.body);
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
    );
  }
}
