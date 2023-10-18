import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cosplay_vn/Commons/Helpers/dialog_helper.dart';
import 'package:cosplay_vn/Views/AccountPage/account_controller.dart';
import 'package:cosplay_vn/Views/HomePage/Children/list_picture.dart';
import 'package:cosplay_vn/Views/AccountPage/Children/block_search.dart';
import 'package:cosplay_vn/Views/AccountPage/Children/account_info.dart';

class AccountPage extends StatelessWidget {
  final AccountController controller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: _createBodyAccount(),
      ),
    );
  }

  //--------------------------------------------
  //Private function
  //--------------------------------------------
  _createBodyAccount() {
    return RefreshIndicator(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AccountInfo(),
            SizedBox(height: 20),
            BlockSearch(
              onAddClicked: _searchAddClick,
              onFilterClicked: _filterSearchClick,
              onFocus: () {},
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Your pictures",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
            ),
            SizedBox(height: 20),
            ListPicture(posts: controller.listYourPicture),
            SizedBox(height: 10),
            Divider(color: Colors.white, height: 1),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("List of saved images",
                    style: TextStyle(color: Colors.white, fontSize: 25))),
            SizedBox(height: 20),
            ListPicture(posts: controller.listPictureSaved),
          ],
        ),
      ),
      onRefresh: controller.accountRefresh,
    );
  }

  void _searchAddClick() {
    DialogHelper.showDialogBottomSheet(_createContentPopup("Add", Center()));
  }

  void _filterSearchClick() {
    DialogHelper.showDialogBottomSheet(_createContentPopup("Search", Center()));
  }

  //create popup web-view
  Widget _createContentPopup(String title, Widget child) {
    return Container(
      height: 361,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          _headerPopup(title),
          Divider(
            height: 1,
            color: Colors.black45,
            thickness: 1,
          ),
          SizedBox(
            height: 300,
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _headerPopup(String title) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 40),
            width: Get.context!.width - 50,
            child: Text(
              title,
              style: Get.context!.textTheme.titleMedium
                  ?.copyWith(overflow: TextOverflow.ellipsis),
            ),
          ),
          SizedBox(
            width: 50,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Get.back(),
            ),
          )
        ],
      ),
    );
  }
}
