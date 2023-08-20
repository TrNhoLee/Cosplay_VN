import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
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
                  ? Center()
                  : createListPictureView()),
            ))
          ],
        ),
      ),
    );
  }

  createListPictureView() {
    return RefreshIndicator(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: ListPicture(posts: controller.lstPicture.value),
      ),
      onRefresh: controller.lstPictureRefresh,
    );
  }
}
