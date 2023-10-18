import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
    _initEvent();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _initData() async {}

  _initEvent() {}

  void bottomBarItemTapped(int value) {
    selectedIndex.value = value;
  }
}
