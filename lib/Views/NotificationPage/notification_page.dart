import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Views/NotificationPage/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  //--------------------------------------------
  //Properties
  //--------------------------------------------
  late NotificationController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find<NotificationController>();

    return Scaffold(
      body: Center(
          child: Text(lblNoti)
      ),
    );
  }
}