import 'dart:io';
import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Commons/Constants/api_consts.dart';
import 'package:cosplay_vn/Commons/Services/common_api_services.dart';
import 'package:cosplay_vn/Commons/Services/cosplay_api_services.dart';
import 'package:cosplay_vn/Models/post_model.dart';
import 'package:cosplay_vn/Models/user_info_model.dart';

class ApiServices {
  CommonApiRequest apiRequest =
      CommonApiRequest(requestHeaders: {"Content-type": "application/json"});

  static const successCode = 0;
  static const createdCode = 201;
  static const deletedCode = 204;
  static const errorBadCode = 400;
  static String loginToken = "";

  Future<bool> checkToken() async {
    try {
      apiRequest.uri = apiCheckToken;
      apiRequest.requestHeaders = {
        "Content-type": "application/json",
        "Authorization": "$authorization$loginToken"
      };

      CosplayApiResponse? apiResponse =
      await CosplayApiServices().getExecutor(apiRequest);

      if (apiResponse?.code != successCode) {
        throw CosplayException.fromJson(apiResponse!);
      }

      return true;
    } on SocketException {
      rethrow;
    } catch (exception) {
      rethrow;
    }
  }

  Future<bool> getDataUserById() async {
    try {
      apiRequest.uri = apiGetUserById;
      apiRequest.requestHeaders = {
        "Content-type": "application/json",
        "Authorization": "$authorization$loginToken"
      };

      CosplayApiResponse? apiResponse =
          await CosplayApiServices().getExecutor(apiRequest);

      if (apiResponse?.code != successCode) {
        throw CosplayException.fromJson(apiResponse!);
      }

      return true;
    } on SocketException {
      rethrow;
    } catch (exception) {
      rethrow;
    }
  }

  Future<List<Post>> getDataPosts(int page, int size) async {
    try {
      List<Post> result = [];

      apiRequest.uri = "$apiGetPosts?page=$page&size=$size";
      apiRequest.requestHeaders = {
        "Content-type": "application/json",
        "Authorization": "$authorization$loginToken"
      };

      CosplayApiResponse? apiResponse =
          await CosplayApiServices().getExecutor(apiRequest);

      if (apiResponse?.code != successCode) {
        throw CosplayException.fromJson(apiResponse!);
      }

      for (var row in apiResponse?.data) {
        result.add(Post.fromJson(row));
      }
      return result;
    } on SocketException {
      rethrow;
    } catch (exception) {
      rethrow;
    }
  }

  Future<List<Post>> searchPosts(int page, int size, String keyword) async {
    try {
      List<Post> result = [];

      apiRequest.uri = "$apiSearchPosts?keyword=$keyword&page=$page&size=$size";
      apiRequest.requestHeaders = {
        "Content-type": "application/json",
        "Authorization": "$authorization$loginToken"
      };

      CosplayApiResponse? apiResponse =
          await CosplayApiServices().getExecutor(apiRequest);

      if (apiResponse?.code != successCode) {
        throw CosplayException.fromJson(apiResponse!);
      }

      for (var row in apiResponse?.data) {
        result.add(Post.fromJson(row));
      }
      return result;
    } on SocketException {
      rethrow;
    } catch (exception) {
      rethrow;
    }
  }

  Future<List<Post>> getListOfSavedImages(int post, int page, int size) async {
    try {
      List<Post> result = [];

      apiRequest.uri = "$apiRelated/$post?page=$page&size=$size";
      apiRequest.requestHeaders = {
        "Content-type": "application/json",
        "Authorization": "$authorization$loginToken"
      };

      CosplayApiResponse? apiResponse =
          await CosplayApiServices().getExecutor(apiRequest);

      if (apiResponse?.code != successCode) {
        throw CosplayException.fromJson(apiResponse!);
      }

      for (var row in apiResponse?.data) {
        result.add(Post.fromJson(row));
      }
      return result;
    } on SocketException {
      rethrow;
    } catch (exception) {
      rethrow;
    }
  }

  Future<UserInfo> getUserInfo() async {
    try {
      apiRequest.uri = apiUserInfo;
      apiRequest.requestHeaders = {
        "Content-type": "application/json",
        "Authorization": "$authorization$loginToken"
      };

      CosplayApiResponse? apiResponse =
          await CosplayApiServices().getExecutor(apiRequest);

      if (apiResponse?.code != successCode) {
        throw CosplayException.fromJson(apiResponse!);
      }

      return UserInfo.fromJson(apiResponse?.data);
    } on SocketException {
      rethrow;
    } catch (exception) {
      rethrow;
    }
  }

  Future<UserInfo> getAccountInfo() async {
    try {
      apiRequest.uri = apiAccountInfo;
      apiRequest.requestHeaders = {
        "Content-type": "application/json",
        "Authorization": "$authorization$loginToken"
      };

      CosplayApiResponse? apiResponse =
          await CosplayApiServices().getExecutor(apiRequest);

      if (apiResponse?.code != successCode) {
        throw CosplayException.fromJson(apiResponse!);
      }

      return UserInfo.fromJson(apiResponse?.data);
    } on SocketException {
      rethrow;
    } catch (exception) {
      rethrow;
    }
  }
}
