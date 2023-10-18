import 'package:cosplay_vn/Views/DetailViewPage/detail_view_controller.dart';
import 'package:cosplay_vn/Views/HomePage/Children/list_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherView extends StatelessWidget {
  final DetailViewController controller = Get.find<DetailViewController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text("Other"),
        ),
        ListPicture(posts: controller.otherPictures),
      ],
    );
  }
}
