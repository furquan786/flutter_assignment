import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:post_review/Model/postResponse.dart';
import 'package:post_review/Remote/api_service.dart';
import 'package:post_review/ViewModel/postDetailVM.dart';

class PostVM extends GetxController {
  List<Post>? postList = List.empty(growable: true);
  var detailCntrl = Get.put(PostDetailVM());

  getPost() async {
    await APIServices.getAllPost()!.then((response) {
      if (response != null) {
        postList!.assignAll(response);
        update();
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getPost();
    super.onInit();
  }
}
