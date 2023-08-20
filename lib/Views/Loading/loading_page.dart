import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Commons/Helpers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () => Get.toNamed(AppRoutes.main));

    return Scaffold(
      body: Center(
        child: Image.asset(logo, width: 80, height: 80),
      ),
    );
  }
}
