import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Views/AccountPage/account_page.dart';
import 'package:cosplay_vn/Views/HomePage/home_page.dart';
import 'package:cosplay_vn/Views/MainPage/main_controller.dart';
import 'package:cosplay_vn/Views/NotificationPage/notification_page.dart';
import 'package:cosplay_vn/Views/SearchPage/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  //--------------------------------------------
  //Properties
  //--------------------------------------------
  late MainController controller;
  final List<Widget> _widgetOptions = [];

  //--------------------------------------------
  //Widget
  //--------------------------------------------
  @override
  Widget build(BuildContext context) {
    controller = Get.put(MainController());
    _widgetOptions.addAll([
      topPage,
      searchPage,
      notificationPage,
      accountPage,
    ]);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(() => IndexedStack(
                index: controller.selectedIndex.value,
                children: _widgetOptions,
              )),
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: lblHome),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: lblSearch),
                BottomNavigationBarItem(
                    icon: Icon(Icons.mark_chat_unread), label: lblNoti),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: lblAccount),
              ],
              onTap: controller.bottomBarItemTapped,
            )),
      ),
    );
  }

  Widget get topPage => HomePage();

  Widget get searchPage => SearchPage();

  Widget get notificationPage => NotificationPage();

  Widget get accountPage => AccountPage();
}
