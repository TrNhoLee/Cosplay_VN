import 'package:cosplay_vn/Views/HomePage/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Views/HomePage/Children/list_picture.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  //--------------------------------------------
  //Properties
  //--------------------------------------------
  late HomeController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: controller.appBarBtnAllPress,
          icon: Image.asset(iAll, width: 25, height: 25, color: Colors.white),
        ),
      ),
      body: Center(
        child: RefreshIndicator(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Obx(() =>
                ListPicture(posts: controller.posts.value)),
          ),
          onRefresh: controller.getPictures,
        ),
      ),
    );
  }
}
