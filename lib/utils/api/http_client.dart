// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:delivery_app/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class THttpClient {

  static Future<Map<String, dynamic>> get(String endPoint) async {
    final response = await http.get(Uri.parse("${TApiConstants.baseUrl}/$endPoint"));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(String endPoint, dynamic data) async {
    try {
      final response = await http.post(
        Uri.parse("${TApiConstants.baseUrl}$endPoint"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: json.encode(data),
      );

      if (response.statusCode == 405) {
        throw Exception("Method Not Allowed: Please check the API endpoint or HTTP method.");
      }

      return _handleResponse(response);
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }


  static Future<Map<String, dynamic>> put(String endPoint, dynamic data) async {
    final response = await http.put(
      Uri.parse("${TApiConstants.baseUrl}/$endPoint"),
      headers: {"Content-Type" : "application/json"},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String endPoint, dynamic data) async {
    final response = await http.delete(Uri.parse("${TApiConstants.baseUrl}/$endPoint"));
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 422) {
      throw Exception("Validation Error: ${response.body}");
    } else {
      throw Exception("Failed to load data : ${response.statusCode}");
    }
  }
}