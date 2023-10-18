import 'dart:ui';
import 'package:cosplay_vn/Views/HomePage/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Views/HomePage/Children/list_picture.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  //--------------------------------------------
  //Properties
  //--------------------------------------------
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.decal,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 75, 45, 75),
                  ],
                ),
              ),
            ),
          ),
          Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                elevation: 1,
                leading: IconButton(
                  onPressed: controller.appBarBtnAllPress,
                  icon: Image.asset(iAll,
                      width: 25, height: 25, color: Colors.white),
                ),
                flexibleSpace: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                )),
            body: Center(
              child: RefreshIndicator(
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      spaceHeader,
                      Obx(() => ListPicture(posts: controller.posts.value)),
                      Obx(() => controller.showLoading.value
                          ? loading
                          : SizedBox.shrink())
                    ],
                  ),
                ),
                onRefresh: controller.lstPictureRefresh,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get spaceHeader =>
      SizedBox(width: double.infinity, height: AppBar().preferredSize.height);

  Widget get loading => SizedBox(
        width: double.infinity,
        height: AppBar().preferredSize.height * 2,
        child: Align(
          alignment: Alignment.topCenter,
          child: CircularProgressIndicator(),
        ),
      );
}
