import 'package:cosplay_vn/Commons/Constants/AppConsts.dart';
import 'package:flutter/material.dart';
import 'package:cosplay_vn/ViewModels/HomePage/HomePageViewModel.dart';
import 'package:cosplay_vn/Views/AccountPage/Childs/ListPicture.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //--------------------------------------------
  //ViewModel
  //--------------------------------------------
  HomePageViewModel _homePageViewModel;

  //--------------------------------------------
  //Properties
  //--------------------------------------------
  List<String> _listUrlPicture;

  //--------------------------------------------
  //Initialize
  //--------------------------------------------
  @override
  void initState() {
    _homePageViewModel = HomePageViewModel();
    _listUrlPicture = _homePageViewModel.getListPicture();
    super.initState();
  }

  @override
  void dispose() {
    _homePageViewModel.dispose();
    super.dispose();
  }

  //--------------------------------------------
  //Widget
  //--------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text(lblButtonAll, style: TextStyle(color: Colors.black)),
          onPressed: _appBarBtnAllPress,
        ),
      ),
      body: Center(
        child: RefreshIndicator(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: ListPicture(lstPictureUrl: _listUrlPicture),
          ),
          onRefresh: _lstPictureRefresh,
        ),
      ),
    );
  }

  //--------------------------------------------
  //Private function
  //--------------------------------------------

  Future<void> _lstPictureRefresh() async {
    _listUrlPicture =
        await _homePageViewModel.refreshListPicture(_listUrlPicture);

    setState(() {
      _listUrlPicture;
    });
  }

  _appBarBtnAllPress() {}
}
