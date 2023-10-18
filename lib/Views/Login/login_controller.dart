import 'dart:io';

import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Commons/Helpers/app_routes.dart';
import 'package:cosplay_vn/Commons/Helpers/dialog_helper.dart';
import 'package:cosplay_vn/Commons/Services/api_services.dart';
import 'package:cosplay_vn/Commons/Services/cosplay_api_services.dart';
import 'package:cosplay_vn/Commons/Services/firebase_service.dart';
import 'package:cosplay_vn/Models/check_token_model.dart';
import 'package:cosplay_vn/Models/user_info_model.dart';
import 'package:cosplay_vn/Views/AccountPage/account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //--------------------------------------------
  //Properties
  //--------------------------------------------
  final firebaseServices = FirebaseService();
  late Future<bool> isLogged;

  @override
  void onInit() {
    super.onInit();
    _initData();
    _initEvent();
  }

  _initData() async {
    isLogged = firebaseServices.isLogged();
  }

  _initEvent() {}

  loginGoogle() async {
    try {
      firebaseServices.signInWithGoogle().then((value) async {
        checkTokenLogin();
      });
    } catch (error) {
      _catchException(
          CosplayException(code: defaultCode, errorMsg: error.toString()));
    }
  }

  Future checkTokenLogin() async {
    DialogHelper.showDialogLoading();
    _checkToken().then((infoTokenResponse) {
      ApiServices.loginToken = infoTokenResponse.token;
      _getDataUserById().then((value) {
        DialogHelper.closeDialogLoading();
        Get.toNamed(AppRoutes.main);
      }).catchError((error, stackTrace) {
        _signOut();
        DialogHelper.closeDialogLoading();
        _catchException(error as CosplayException);
      });
    }).catchError((error, stackTrace) {
      _signOut();
      DialogHelper.closeDialogLoading();
      _catchException(error as CosplayException);
    });
  }

  Future checkTokenAutoLogin() async {
    _checkToken().then((infoTokenResponse) {
      ApiServices.loginToken = infoTokenResponse.token;
      _getDataUserById().then((value) {
        Get.toNamed(AppRoutes.main);
      }).catchError((error, stackTrace) {
        _signOut();
        _catchException(error as CosplayException);
      });
    }).catchError((error, stackTrace) {
      _signOut();
      _catchException(error as CosplayException);
    });
  }

  Future<CheckTokenResponse> _checkToken() async {
    try {
      return await ApiServices().checkToken(CheckTokenRequest(
          provider: providerGoogleValue,
          token: ApiServices.firebaseAccessToken));
    } on SocketException {
      throw CosplayException(code: defaultCode, errorMsg: errConnectServer);
    } on CosplayException {
      rethrow;
    } catch (exception) {
      throw CosplayException(code: defaultCode, errorMsg: errOther);
    }
  }

  Future<bool> _getDataUserById() async {
    try {
      return await ApiServices().getDataUserById();
    } on SocketException {
      throw CosplayException(code: defaultCode, errorMsg: errConnectServer);
    } on CosplayException {
      rethrow;
    } catch (exception) {
      throw CosplayException(code: defaultCode, errorMsg: errOther);
    }
  }

  void _signOut() {
    FirebaseService().signOut();

    if (!Get.currentRoute.contains(AppRoutes.login)) {
      Get.toNamed(AppRoutes.login);
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
