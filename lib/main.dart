import 'package:cosplay_vn/Commons/ThemeData/theme_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cosplay_vn/Commons/Helpers/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: appBarTheme,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.transparent,
          bottomNavigationBarTheme: bottomNavigationBarThemeData),
      initialRoute: AppRoutes.loading,
      getPages: AppRoutes.routes,
    );
  }
}
