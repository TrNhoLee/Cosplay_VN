import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Views/SearchPage/Children/input_search.dart';
import 'package:cosplay_vn/Views/HomePage/Children/list_picture.dart';
import 'package:cosplay_vn/Views/SearchPage/search_controller.dart' as search;

class SearchPage extends StatelessWidget {
  //--------------------------------------------
  //Properties
  //--------------------------------------------
  late search.SearchController controller;

  //--------------------------------------------
  //Widget
  //--------------------------------------------
  @override
  Widget build(BuildContext context) {
    controller = Get.find<search.SearchController>();

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
            body: Container(
              child: Column(
                children: [
                  InputSearch(
                    onValueInput: controller.clearInputSearch,
                    onValueChanged: controller.inputSearchValueChanged,
                    onValueSubmitted: controller.inputSearchSubmitted,
                    searchController: controller.searchFilter,
                  ),
                  Flexible(
                      child: Center(
                    child: Obx(() => controller.lstPicture.isEmpty
                        ? Center(child: Text(noDataSearch))
                        : createListPictureView()),
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  createListPictureView() {
    return RefreshIndicator(
      child: SingleChildScrollView(
        controller: controller.scrollController,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            ListPicture(posts: controller.lstPicture.value),
            Obx(() =>
                controller.showLoading.value ? loading : SizedBox.shrink())
          ],
        ),
      ),
      onRefresh: controller.lstPictureRefresh,
    );
  }

  Widget get loading => SizedBox(
        width: double.infinity,
        height: AppBar().preferredSize.height * 2,
        child: Align(
          alignment: Alignment.topCenter,
          child: CircularProgressIndicator(),
        ),
      );
}
