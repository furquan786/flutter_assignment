import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:post_review/Model/postResponse.dart';

class APIServices {
  static String baseUrl = "https://jsonplaceholder.typicode.com/posts";

  static Future<dynamic>? getAllPost() async {
    var client = http.Client();
    var jsonData;

    try {
      http.Response response = await client.get(Uri.parse(baseUrl));

      var responsej = jsonDecode(response.body);

      jsonData = Post.fromJsonList(responsej);
    } catch (e) {
      debugPrint("error $e");
    }

    return jsonData;
  }

  static Future<dynamic>? getPostDetail(id) async {
    var jsonData;
    var client = http.Client();
    try {
      http.Response response = await client.get(Uri.parse("$baseUrl/$id"));
      var responseJson = jsonDecode(response.body);

      jsonData = Post.fromJson(responseJson);
      debugPrint("########post data =  $jsonData");
    } catch (e) {
      debugPrint("Error $e");
    }
    return jsonData;
  }
}
