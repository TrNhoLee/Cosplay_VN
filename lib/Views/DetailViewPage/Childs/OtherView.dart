import 'package:cosplay_vn/ViewModels/Picture/PictureViewModel.dart';
import 'package:cosplay_vn/Views/HomePage/Childs/ListPicture.dart';
import 'package:flutter/material.dart';

class OtherView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OtherViewState();
}

class _OtherViewState extends State<OtherView> {
  //--------------------------------------------
  //ViewModel
  //--------------------------------------------
  PictureViewModel _pictureViewModel;

  //--------------------------------------------
  //Properties
  //--------------------------------------------
  List<String> _listOtherPicture;

  //--------------------------------------------
  //Initialize
  //--------------------------------------------
  @override
  void initState() {
    _pictureViewModel = PictureViewModel();
    _listOtherPicture = _pictureViewModel.getListOfOtherPictures();
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
    return Column(
      children: [
        ListTile(
          leading: Text("Other"),
        ),
        ListPicture(lstPictureUrl: _listOtherPicture),
      ],
    );
  }
}
