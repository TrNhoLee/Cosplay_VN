import 'package:cosplay_vn/Models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  late TextEditingController searchFilter;

  var lstPicture = <Post>[].obs;
  var enableIconClearSearch = false.obs;

  @override
  void onInit() {
    super.onInit();
    searchFilter = TextEditingController();
    _initData();
    _initEvent();
  }

  _initData() async {}

  _initEvent() {}

  void clearInputSearch() {
    lstPicture.clear();
  }

  void inputSearchValueChanged(String value) {
    return;
  }

  void inputSearchSubmitted(String value) async {
    var keyword = searchFilter.text.trim();

    if (keyword.isEmpty) {
      return;
    }

    lstPicture.replaceRange(
        0, lstPicture.value.length, await _searchPictures(keyword));
  }

  Future<void> lstPictureRefresh() async {
    var keyword = searchFilter.text.trim();

    if (keyword.isEmpty) {
      return;
    }

    lstPicture.replaceRange(
        0, lstPicture.value.length, await _searchPictures(keyword));
  }

  Future<List<Post>> _searchPictures(String keyword) async {
    return [];
  }
}
