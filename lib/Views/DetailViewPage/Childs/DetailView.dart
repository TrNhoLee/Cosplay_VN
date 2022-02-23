import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  //--------------------------------------------
  //ViewModel
  //--------------------------------------------

  //--------------------------------------------
  //Properties
  //--------------------------------------------
  double _heightImage;

  //--------------------------------------------
  //Initialize
  //--------------------------------------------
  @override
  void initState() {
    _heightImage = 300;
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
        _createPictureItem(),
        _createBottomItem(),
      ],
    );
    ;
  }

  Widget _createPictureItem() {
    return InkWell(
      child: Stack(
        children: [
          _createImageView(),
          _createBackButton(),
          _createMoreButton(),
          _createReactionView(),
        ],
      ),
    );
  }

  Widget _createImageView() {
    return Container(
      width: double.infinity,
      child: InteractiveViewer(
        child: FlutterLogo(size: _heightImage),
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _createReactionView() {
    return Container(
      height: _heightImage,
      width: double.infinity,
      alignment: Alignment.bottomLeft,
      child: TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.favorite, color: Colors.red),
          label: Text("6,7n", style: TextStyle(color: Colors.white))),
    );
  }

  Widget _createBackButton() {
    return Align(
        alignment: Alignment.topLeft,
        child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}));
  }

  Widget _createMoreButton() {
    return Align(
        alignment: Alignment.topRight,
        child: PopupMenuButton<int>(
          icon: Icon(Icons.more_horiz),
          onSelected: (int result) {},
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            const PopupMenuItem<int>(
              value: 0,
              child: ListTile(
                  leading: Icon(Icons.file_download), title: Text("Download")),
            ),
            const PopupMenuItem<int>(
              value: 1,
              child: ListTile(leading: Icon(Icons.share), title: Text("Share")),
            ),
          ],
        ));
  }

  Widget _createBottomItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "Flutter logo by Nho Le",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: FlutterLogo(size: 30),
          title: Text("Nho Le"),
          subtitle: Text("7,2 tr Follower"),
          trailing: OutlinedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey)),
              child: Text("Follow", style: TextStyle(color: Colors.white)),
              onPressed: () {}),
        )
      ],
    );
  }
}
