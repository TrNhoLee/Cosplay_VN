import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:cosplay_vn/Views/Login/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.decal,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 75, 45, 75),
                  ],
                ),
              ),
            ),
          ),
          Scaffold(
            extendBodyBehindAppBar: true,
            body: Center(
              child: OutlinedButton.icon(
                onPressed: controller.loginGoogle,
                icon: Image.asset(iconGoogleUrl, width: 60, height: 60),
                label: Text(loginGoogleButtonLabel),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
