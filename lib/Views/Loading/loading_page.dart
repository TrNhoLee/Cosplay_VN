import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Commons/Helpers/app_routes.dart';
import 'package:cosplay_vn/Views/Login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () async {
      if(await controller.isLogged) {
        return controller.checkTokenAutoLogin();
      }

      Get.toNamed(AppRoutes.login);
    });

    return Scaffold(
      body: Center(
        child: Image.asset(logo, width: 80, height: 80),
      ),
    );
  }
}
