import 'package:cosplay_vn/Models/post_model.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  var listYourPicture = <Post>[].obs;
  var listPictureSaved = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
    _initEvent();
  }

  _initData() async {
    listYourPicture.addAll(getListOfYourPictures());
    listPictureSaved.addAll(getListOfSavedImages());
  }

  _initEvent() {}

  List<Post> getListOfYourPictures() {
    return [];
  }

  List<Post> getListOfSavedImages() {
    return [];
  }

  Future<void> accountRefresh() async {}
}
