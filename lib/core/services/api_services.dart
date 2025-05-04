
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServices {
  final String _baseUrl = 'https://project2.amit-learning.com/api';
  final Dio dio;

  ApiServices({required this.dio});

  Future<Map<String, dynamic>> get(
      {required String endPoint, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    var response =
        await dio.get("$_baseUrl$endPoint", options: Options(headers: headers));
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    String? token,
    @required dynamic body,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    var response = await dio.post("$_baseUrl$endPoint",
        options: Options(
          headers: headers,
        ),
        data: body);
    return response.data;
  }

  // Future<dynamic> post(
  //     {required String url,
  //     @required dynamic body,
  //     @required String? token}) async {
  //   Map<String, String> headers = {};
  //   if (token != null) {
  //     headers.addAll({
  //       "Authorization": "Bearer $token",
  //     });
  //   }

  //   http.Response response = await http.post(
  //     Uri.parse(url),
  //     body: body,
  //     headers: headers,
  //   );

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     return data;
  //   } else {
  //     throw Exception(
  //         "there is a problem with status code :${response.statusCode} the problem is : ${jsonDecode(response.body)}");
  //   }
  // }

  Future<dynamic> put({
    required String endPoint,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    var response = await dio.put("$_baseUrl$endPoint",
        options: Options(headers: headers), data: body);

    return response.data;
  }
}
