// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class HttpService {
  const HttpService();
  static const String _baseUrl =
      'https://finalqalamnoor-001-site1.dtempurl.com/';
  static const Map<String, String> _headers = <String, String>{
    'accept': 'text/plain',
    'Content-Type': 'application/json'
  };
  static Future<MapperReturnType> getParsed<MapperReturnType, JsonParseType>({
    required String url,
    required MapperReturnType Function(JsonParseType responseData) dataMapper,
  }) async {
    final http.Response response = await getUnparsed(url);
    return dataMapper(jsonDecode(response.body) as JsonParseType);
  }

  static Future<http.Response> getUnparsed(String url,
      {bool shouldLog = false}) async {
    final String combinedURL = _baseUrl + url;
    final http.Response response = await http.get(Uri.parse(combinedURL));
    if (shouldLog) {
      log('On URL: $combinedURL -> \nGot Data: ${response.body}\n');
    }
    return response;
  }

  static Future<int?> post({
    required String url,
    String? body,
  }) async {
    final Uri uriParsedFromURL = Uri.parse(_baseUrl + url);
    final http.Response response = await http.post(
      uriParsedFromURL,
      headers: _headers,
      body: body,
    );
    return int.tryParse(response.body.toString());
  }
}
