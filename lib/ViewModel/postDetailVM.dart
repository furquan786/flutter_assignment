import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_review/Remote/api_service.dart';

import '../Model/postResponse.dart';

class PostDetailVM extends GetxController {
  Post? postDetail;

  getPostDetail(id) async {
    postDetail = null;
    await APIServices.getPostDetail(id)!.then((response) {
      if (response != null) {
        debugPrint("##### Post Detail res $response");
        postDetail = response;
        debugPrint("##### Post Detail res ${postDetail!.title}");
        update();
      }
    });
  }
}
