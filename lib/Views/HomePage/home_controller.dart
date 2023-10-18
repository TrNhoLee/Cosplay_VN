import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Commons/Helpers/dialog_helper.dart';
import 'package:cosplay_vn/Commons/Services/api_services.dart';
import 'package:cosplay_vn/Commons/Services/cosplay_api_services.dart';
import 'package:cosplay_vn/Models/post_model.dart';

class HomeController extends GetxController {
  //--------------------------------------------
  //Properties
  //--------------------------------------------
  final ScrollController scrollController = ScrollController();
  var posts = <Post>[].obs;
  var showLoading = false.obs;

  int page = 0;
  int size = 20;

  @override
  void onInit() {
    super.onInit();
    _initData();
    _initEvent();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void appBarBtnAllPress() {
    lstPictureRefresh();
  }

  Future<void> lstPictureRefresh() async {
    page = 0;
    getPictures();
  }

  Future getPictures() async {
    await _getListPicture(page, size).then((value) {
      if (value.isEmpty) {
        return;
      }

      posts.replaceRange(0, posts.length, value);
      _countPage();
    }).catchError((error, stackTrace) {
      _catchException(error as CosplayException);
    });
  }

  Future getMorePictures() async {
    showLoading.value = true;
    await _getListPicture(page, size).then((value) {
      showLoading.value = false;

      if (value.isEmpty) {
        return;
      }

      posts.addAll(value);
      _countPage();
    }).catchError((error, stackTrace) {
      showLoading.value = false;
      _catchException(error as CosplayException);
    });
  }

  _initData() async {
    getPictures();
  }

  _initEvent() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        getMorePictures();
      }
    });
  }

  Future<List<Post>> _getListPicture(int page, int size) async {
    try {
      return await ApiServices().getDataPosts(page, size);
    } on SocketException {
      throw CosplayException(code: defaultCode, errorMsg: errConnectServer);
    } on CosplayException {
      rethrow;
    } catch (exception) {
      throw CosplayException(code: defaultCode, errorMsg: errOther);
    }
  }

  void _countPage() {
    page = (posts.length / size).round();
  }

  void _catchException(CosplayException error) {
    DialogHelper.showDialog(content: error.errorMsg, actions: [
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () => Get.back(),
        child: Text(lblCloseDialogButton,
            style: Get.textTheme.titleMedium?.copyWith()),
      )
    ]);
  }
}
