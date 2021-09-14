import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cosplay_vn/Commons/Constants/ApiConsts.dart';
import 'package:cosplay_vn/Commons/Services/CommonApiRequest.dart';

abstract class CommonApiServices<T> {
  // -------------------------------------------------------
  // Field defined
  // -------------------------------------------------------
  static var httpClient = new HttpClient();

  // -------------------------------------------------------
  // Common functions. Continue...
  // -------------------------------------------------------

  // Post excutor
  Future<T> postExcutor(CommonApiRequest apiRequest) async {
    try {
      await InternetAddress.lookup(Uri.parse(BASE_URL).host);
      var response = await http.post(
        Uri.parse(apiRequest.uri),
        headers: apiRequest.requestHeaders,
        body: apiRequest.body,
      );

      if (response.statusCode == 200) {
        return fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (exception) {
      throw exception;
    }
  }

  // Get excutor
  Future<T> getExcutor(CommonApiRequest apiRequest) async {
    try {
      await InternetAddress.lookup(Uri.parse(BASE_URL).host);
      var response = await http.get(
        Uri.parse(apiRequest.uri),
        headers: apiRequest.requestHeaders,
      );

      if (response.statusCode == 200) {
        return fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (exception) {
      throw exception;
    }
  }

  // Put excutor
  Future<T> putExcutor(CommonApiRequest apiRequest) async {
    try {
      await InternetAddress.lookup(Uri.parse(BASE_URL).host);
      var response = await http.put(
        Uri.parse(apiRequest.uri),
        headers: apiRequest.requestHeaders,
        body: apiRequest.body,
      );

      if (response.statusCode == 200) {
        return fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (exception) {
      throw exception;
    }
  }

  T fromJson(json);
}
