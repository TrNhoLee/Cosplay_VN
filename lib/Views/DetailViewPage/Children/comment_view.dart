import 'package:flutter/material.dart';

class CommentView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
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
    return _createListComment();
  }

  Widget _createListComment() {
    return Column(
      children: [
        ListTile(
          leading: Text("Comment"),
          title: Text("35",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w100)),
          trailing: Icon(Icons.keyboard_arrow_down),
        ),
        ListTile(
          minLeadingWidth: 15,
          leading: FlutterLogo(size: 20),
          title: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
              style: TextStyle(
                fontSize: 13
              )),
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
