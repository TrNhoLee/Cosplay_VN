import 'package:cosplay_vn/Views/DetailViewPage/Children/comment_view.dart';
import 'package:cosplay_vn/Views/DetailViewPage/Children/detail_view.dart';
import 'package:cosplay_vn/Views/DetailViewPage/Children/other_view.dart';
import 'package:cosplay_vn/Views/DetailViewPage/detail_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailViewPage extends StatelessWidget {
  late DetailViewController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(DetailViewController());

    return Scaffold(
      body: ListView(
        children: [
          DetailView(),
          Divider(height: 1, color: Colors.grey),
          CommentView(),
          Divider(height: 1, color: Colors.grey),
          OtherView()
        ],
      ),
    );
  }
}
