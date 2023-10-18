import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Commons/Helpers/dialog_helper.dart';
import 'package:cosplay_vn/Commons/Services/api_services.dart';
import 'package:cosplay_vn/Commons/Services/cosplay_api_services.dart';
import 'package:cosplay_vn/Models/post_model.dart';

class SearchController extends GetxController {
  late ScrollController scrollController;
  late TextEditingController searchFilter;

  var lstPicture = <Post>[].obs;
  var enableIconClearSearch = false.obs;
  var showLoading = false.obs;
  var showDialogError = false;

  int page = 0;
  int size = 20;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    searchFilter = TextEditingController();
    _initData();
    _initEvent();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void clearInputSearch() {
    lstPicture.clear();
  }

  void inputSearchValueChanged(String value) {}

  void inputSearchSubmitted(String value) async {
    searchPictures();
  }

  Future<void> lstPictureRefresh() async {
    page = 0;
    searchPictures();
  }

  Future searchPictures() async {
    var keyword = searchFilter.text.trim();

    if (keyword.isEmpty) {
      return;
    }

    await _searchPosts(page, size, keyword).then((value) {
      lstPicture.replaceRange(0, lstPicture.length, value);
      _countPage();
    }).catchError((error, stackTrace) {
      _catchException(error as CosplayException);
    });
  }

  Future getMorePictures() async {
    var keyword = searchFilter.text.trim();

    if (keyword.isEmpty) {
      return;
    }

    showLoading.value = true;
    await _searchPosts(page, size, keyword).then((value) {
      showLoading.value = false;
      if (value.isEmpty) {
        return;
      }

      lstPicture.addAll(value);
      _countPage();
    }).catchError((error, stackTrace) {
      showLoading.value = false;
      _catchException(error as CosplayException);
    });
  }

  _initData() async {}

  _initEvent() {
    scrollController.addListener(() {
      if (!scrollController.position.atEdge) {
        return;
      }

      if (scrollController.position.pixels == 0) {
        return;
      }

      if (showDialogError) {
        return;
      }

      getMorePictures();
    });
  }

  Future<List<Post>> _searchPosts(int page, int size, String keyword) async {
    try {
      return await ApiServices().searchPosts(page, size, keyword);
    } on SocketException {
      throw CosplayException(code: defaultCode, errorMsg: errConnectServer);
    } on CosplayException {
      rethrow;
    } catch (exception) {
      throw CosplayException(code: defaultCode, errorMsg: errOther);
    }
  }

  void _countPage() {
    page = (lstPicture.length / size).round();
  }

  void _catchException(CosplayException error) async {
    if (showDialogError) {
      return;
    }

    showDialogError = true;
    await DialogHelper.showDialog(content: error.errorMsg, actions: [
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () => Get.back(),
        child: Text(lblCloseDialogButton,
            style: Get.textTheme.titleMedium?.copyWith()),
      )
    ]);
    showDialogError = false;
  }
}
