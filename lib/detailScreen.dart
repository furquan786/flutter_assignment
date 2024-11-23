import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_review/Item_Time.dart';
import 'package:post_review/Model/postResponse.dart';
import 'package:post_review/ViewModel/postDetailVM.dart';
import 'package:post_review/ViewModel/postVM.dart';

class DetailScreen extends StatelessWidget {
  final int Id;

  const DetailScreen({required this.Id});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailVM>(
      builder: (postController) {
        return postController.postDetail == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar:
                    AppBar(title: Text(postController.postDetail!.title ?? "")),
                body: Center(
                  child: Container(
                    height: 500,
                    padding: EdgeInsets.symmetric(horizontal: 42, vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.yellow.shade200,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                          )
                        ]),
                    child: Center(
                      child: Text(
                        postController.postDetail!.body ?? "",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
