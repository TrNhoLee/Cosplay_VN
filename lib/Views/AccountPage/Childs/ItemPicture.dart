import 'package:flutter/material.dart';

class ItemPicture extends StatelessWidget {
  final String url;

  const ItemPicture({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: FlutterLogo(size: 100),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          width: MediaQuery.of(context).size.width/2 - 10,
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          width: MediaQuery.of(context).size.width/2 - 10,
          child: _createBottomItem(),
        ),
      ],
    );
  }

  Widget _createBottomItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("6,7n"),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
      ],
    );
  }
}