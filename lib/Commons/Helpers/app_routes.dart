import 'package:cosplay_vn/Views/Login/login_page.dart';
import 'package:get/get.dart';
import 'package:cosplay_vn/Views/MainPage/main_page.dart';
import 'package:cosplay_vn/Views/MainPage/main_binding.dart';
import 'package:cosplay_vn/Views/Loading/loading_page.dart';
import 'package:cosplay_vn/Views/HomePage/home_page.dart';
import 'package:cosplay_vn/Views/AccountPage/account_page.dart';
import 'package:cosplay_vn/Views/DetailViewPage/detail_view_page.dart';
import 'package:cosplay_vn/Views/NotificationPage/notification_page.dart';
import 'package:cosplay_vn/Views/SearchPage/search_page.dart';

class AppRoutes {
  static const loading = "/loading";
  static const login = "/login";
  static const main = "/main";
  static const home = "/main/home";
  static const account = "/main/account";
  static const detail = "/main/detail";
  static const notification = "/main/notification";
  static const search = "/main/search";

  static final List<GetPage> routes = [
    GetPage(name: loading, page: () => LoadingPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: main, page: () => MainPage(), binding: MainBinding()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: account, page: () => AccountPage()),
    GetPage(name: detail, page: () => DetailViewPage()),
    GetPage(name: notification, page: () => NotificationPage()),
    GetPage(name: search, page: () => SearchPage()),
  ];
}
