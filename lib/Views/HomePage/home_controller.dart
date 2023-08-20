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
  late ScrollController scrollController;
  var posts = <Post>[].obs;
  int page = 0;
  int size = 20;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    _initData();
    _initEvent();
  }

  @override
  void onClose() {
    super.onClose();
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

  Future getPictures() async {
    await _getListPicture(page, size).then((value) {
      if(value.isEmpty) {
        return;
      }

      page++;
      posts.replaceRange(0, posts.value.length, value);
    }).catchError((error, stackTrace) {
      for (var item in (error as CosplayException).errors) {
        _catchException(item);
      }
    });
  }

  Future getMorePictures() async {
    await _getListPicture(page, size).then((value) {
      if(value.isEmpty) {
        return;
      }

      page++;
      posts.addAll(value);
    }).catchError((error, stackTrace) {
      for (var item in (error as CosplayException).errors) {
        _catchException(item);
      }
    });
  }

  Future<List<Post>> _getListPicture(int page, int size) async {
    try {
      return await ApiServices().getDataPosts(page, size);
    } on SocketException {
      throw CosplayException(errors: [
        CosplayError(errorMsg: errConnectServer, showType: showErrorPopupType)
      ]);
    } on CosplayException {
      rethrow;
    } catch (exception) {
      throw CosplayException(errors: [
        CosplayError(errorMsg: errOther, showType: showErrorPopupType)
      ]);
    }
  }

  void appBarBtnAllPress() {}

  void _catchException(CosplayError error) {
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
