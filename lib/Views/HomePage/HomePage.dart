import 'package:flutter/material.dart';
import 'package:cosplay_vn/Commons/Constants/AppConsts.dart';
import 'package:cosplay_vn/ViewModels/Home/HomeViewModel.dart';
import 'package:cosplay_vn/Views/HomePage/Childs/ListPicture.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //--------------------------------------------
  //ViewModel
  //--------------------------------------------
  HomeViewModel _homeViewModel;

  //--------------------------------------------
  //Properties
  //--------------------------------------------
  List<String> _listUrlPicture;

  //--------------------------------------------
  //Initialize
  //--------------------------------------------
  @override
  void initState() {
    _homeViewModel = HomeViewModel();
    _listUrlPicture = _homeViewModel.getListPicture();
    super.initState();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
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
        await _homeViewModel.refreshListPicture(_listUrlPicture);

    setState(() {
      _listUrlPicture;
    });
  }

  _appBarBtnAllPress() {}
}
