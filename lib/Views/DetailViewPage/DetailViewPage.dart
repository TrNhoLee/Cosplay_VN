import 'package:cosplay_vn/Views/DetailViewPage/Childs/CommentView.dart';
import 'package:cosplay_vn/Views/DetailViewPage/Childs/DetailView.dart';
import 'package:cosplay_vn/Views/DetailViewPage/Childs/OtherView.dart';
import 'package:flutter/material.dart';

class DetailViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailViewPageState();
}

class _DetailViewPageState extends State<DetailViewPage> {
  //--------------------------------------------
  //ViewModel
  //--------------------------------------------

  //--------------------------------------------
  //Properties
  //--------------------------------------------

  //--------------------------------------------
  //Initialize
  //--------------------------------------------
  @override
  void initState() {
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
      body: ListView(
        children: [
          DetailView(),
          Divider(height: 1, color: Colors.grey),
          CommentView(),
          Divider(height: 1, color: Colors.grey),
          OtherView()
        ],
      ),
    );
  }
}
