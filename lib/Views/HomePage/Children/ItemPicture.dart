import 'package:cosplay_vn/Commons/Helpers/app_routes.dart';
import 'package:cosplay_vn/Models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPicture extends StatelessWidget {
  final Post post;
  double _widthItem = 0;

  ItemPicture({super.key, required this.post});

  //--------------------------------------------
  //Widget
  //--------------------------------------------
  @override
  Widget build(BuildContext context) {
    _widthItem = MediaQuery.of(context).size.width / 2 - 10;

    return Column(
      children: [
        _createPictureItem(),
        _createBottomItem(),
      ],
    );
  }

  Widget _createPictureItem() {
    return InkWell(
      child: Stack(
        children: [
          Container(
            height: 300,
            width: _widthItem,
            child: post.cover.isEmpty
                ? FlutterLogo(size: 100)
                : Image.network(
                    post.cover,
                    errorBuilder: (_, __, ___) {
                      return FlutterLogo(size: 100);
                    },
                    fit: BoxFit.cover,
                  ),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Container(
            height: 300,
            width: _widthItem,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                        post.liked == 0
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.red),
                    label: Text(post.like.toString(),
                        style: TextStyle(color: Colors.white))),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
              ],
            ),
          )
        ],
      ),
      onTap: () => Get.toNamed(AppRoutes.main),
    );
  }

  Widget _createBottomItem() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: _widthItem,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 10),
          Text(post.title),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
