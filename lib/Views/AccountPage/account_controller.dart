import 'dart:io';
import 'package:cosplay_vn/Models/user_info_model.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Commons/Helpers/dialog_helper.dart';
import 'package:cosplay_vn/Commons/Services/api_services.dart';
import 'package:cosplay_vn/Commons/Services/cosplay_api_services.dart';
import 'package:cosplay_vn/Models/post_model.dart';

class AccountController extends GetxController {
  var userInfo = UserInfo().obs;
  var listYourPicture = <Post>[].obs;
  var listPictureSaved = <Post>[].obs;

  int page = 0;
  int size = 20;

  @override
  void onInit() {
    super.onInit();
    _initData();
    _initEvent();
  }

  _initData() async {
    getAccountInfo();
  }

  _initEvent() {}

  Future getAccountInfo() async {
    await _getAccountInfo().then((value) {
      userInfo.value.user = value;
      listYourPicture.addAll(userInfo.value.posts);
      // getListOfSavedImages();
    }).catchError((error, stackTrace) {
      _catchException(error as CosplayException);
    });
  }

  Future getUserInfo() async {
    await _getUserInfo().then((value) {
      userInfo.value = value;
      listYourPicture.addAll(userInfo.value.posts);
      getListOfSavedImages();
    }).catchError((error, stackTrace) {
      _catchException(error as CosplayException);
    });
  }

  Future getListOfSavedImages() async {
    await _getListOfSavedImages(listYourPicture.first.id, page, size).then((value) {
      if (value.isEmpty) {
        return;
      }

      listPictureSaved.replaceRange(0, listPictureSaved.length, value);
      _countPage();
    }).catchError((error, stackTrace) {
      _catchException(error as CosplayException);
    });
  }

  Future<void> accountRefresh() async {}

  void _countPage() {
    page = (listPictureSaved.length / size).round();
  }

  Future<User> _getAccountInfo() async {
    try {
      return await ApiServices().getAccountInfo();
    } on SocketException {
      throw CosplayException(code: defaultCode, errorMsg: errConnectServer);
    } on CosplayException {
      rethrow;
    } catch (exception) {
      throw CosplayException(code: defaultCode, errorMsg: errOther);
    }
  }

  Future<UserInfo> _getUserInfo() async {
    try {
      return await ApiServices().getUserInfo();
    } on SocketException {
      throw CosplayException(code: defaultCode, errorMsg: errConnectServer);
    } on CosplayException {
      rethrow;
    } catch (exception) {
      throw CosplayException(code: defaultCode, errorMsg: errOther);
    }
  }

  Future<List<Post>> _getListOfSavedImages(int post, int page, int size) async {
    try {
      return await ApiServices().getListOfSavedImages(post, page, size);
    } on SocketException {
      throw CosplayException(code: defaultCode, errorMsg: errConnectServer);
    } on CosplayException {
      rethrow;
    } catch (exception) {
      throw CosplayException(code: defaultCode, errorMsg: errOther);
    }
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
