import 'package:cosplay_vn/Views/AccountPage/account_controller.dart';
import 'package:cosplay_vn/Views/HomePage/home_controller.dart';
import 'package:cosplay_vn/Views/NotificationPage/notification_controller.dart';
import 'package:cosplay_vn/Views/SearchPage/search_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}