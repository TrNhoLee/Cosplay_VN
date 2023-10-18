import 'package:cosplay_vn/Models/post_model.dart';
import 'package:get/get.dart';

class DetailViewController extends GetxController {
  var otherPictures = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
    _initEvent();
  }

  _initData() async {
    otherPictures.addAll(await getListOfOtherPictures());
  }

  _initEvent() {}

  Future<List<Post>> getListOfOtherPictures() async {
    return [];
  }
}
