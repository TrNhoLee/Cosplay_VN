import 'package:cosplay_vn/Commons/Helpers/app_routes.dart';
import 'package:cosplay_vn/Models/post_model.dart';
import 'package:cosplay_vn/Views/HomePage/Children/image_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPicture extends StatelessWidget {
  final Post post;
  final double _widthItem = Get.width / 2 - 10;

  ItemPicture({super.key, required this.post});

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
  }

  Widget _createPictureItem() {
    return InkWell(
      child: Stack(
        children: [
          Container(
            height: 300,
            width: _widthItem,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ImageCustom.network(
                url: post.cover,
                placeholder: const SizedBox.shrink(),
                errorWidget: const Center(child: Icon(Icons.broken_image)),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          post.imageQty > 1
              ? Container(
                  height: 300,
                  alignment: Alignment.topRight,
                  width: _widthItem,
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.photo_library_outlined, size: 15))
              : SizedBox.shrink(),
          Container(
            height: 300,
            width: _widthItem,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: _widthItem / 2,
                  child: Text(post.title,
                      maxLines: 4,
                      style: Get.textTheme.titleSmall
                          ?.copyWith(overflow: TextOverflow.ellipsis)),
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                        post.liked == 0
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.red),
                    label: Text(post.like.toString(),
                        style: TextStyle(color: Colors.white))),
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
          Text(post.userFullName),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
