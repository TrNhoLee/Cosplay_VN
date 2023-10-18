import 'package:cosplay_vn/Models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:cosplay_vn/Views/HomePage/Children/item_picture.dart';

class ListPicture extends StatelessWidget {
  final List<Post> posts;

  const ListPicture({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: createListItemPicture(),
    );
  }

  List<Widget> createListItemPicture() {
    List<Widget> lstItemPicture = [];

    posts.forEach((element) {
      lstItemPicture.add(ItemPicture(post: element));
    });

    return lstItemPicture;
  }
}
