import 'package:flutter/material.dart';
import 'package:cosplay_vn/ViewModels/Picture/PictureViewModel.dart';
import 'package:cosplay_vn/Views/HomePage/Childs/ListPicture.dart';
import 'package:cosplay_vn/Commons/Helpers/DialogHelper.dart';
import 'package:cosplay_vn/Views/AccountPage/Childs/BlockSearch.dart';
import 'package:cosplay_vn/Views/AccountPage/Childs/InfoAccount.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  //--------------------------------------------
  //ViewModel
  //--------------------------------------------
  PictureViewModel _pictureViewModel;

  //--------------------------------------------
  //Properties
  //--------------------------------------------
  List<String> _listYourPicture;
  List<String> _listPictureSaved;

  //--------------------------------------------
  //Initialize
  //--------------------------------------------
  @override
  void initState() {
    _pictureViewModel = PictureViewModel();
    _listYourPicture = _pictureViewModel.getListOfYourPictures();
    _listPictureSaved = _pictureViewModel.getListOfSavedImages();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //--------------------------------------------
  //Widget
  //--------------------------------------------
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
            InfoAccount(),
            SizedBox(height: 20),
            BlockSearch(
              onAddClicked: _searchAddClick,
              onFilterClicked: _filterSearchClick,
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Your pictures",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
            ),
            SizedBox(height: 20),
            ListPicture(lstPictureUrl: _listYourPicture),
            SizedBox(height: 10),
            Divider(color: Colors.white, height: 1),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("List of saved images",
                    style: TextStyle(color: Colors.white, fontSize: 25))),
            SizedBox(height: 20),
            ListPicture(lstPictureUrl: _listPictureSaved),
          ],
        ),
      ),
      onRefresh: _accountRefresh,
    );
  }

  Future<void> _accountRefresh() async {
    await print("aaaaa");
    setState(() {});
  }

  void _searchAddClick() {
    DialogHelper.showDialogBottom(context, lstItem: []);
  }

  void _filterSearchClick() {
    DialogHelper.showDialogBottom(context, lstItem: []);
  }
}
