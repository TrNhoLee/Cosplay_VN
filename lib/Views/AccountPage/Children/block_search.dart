import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:flutter/material.dart';

class BlockSearch extends StatelessWidget {
  FocusNode _focus = new FocusNode();
  final VoidCallback onFocus;
  final VoidCallback onFilterClicked;
  final VoidCallback onAddClicked;

  BlockSearch(
      {super.key,
      required this.onFocus,
      required this.onFilterClicked,
      required this.onAddClicked});

  @override
  Widget build(BuildContext context) {
    _focus.addListener(() {
      if (onFocus != null) {
        onFocus.call();
      }
    });

    return Container(
      height: 60,
      child: Row(
        children: [
          Expanded(
              child: TextField(
                focusNode: _focus,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    hintText: hintInputSearch,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
              ),
              flex: 7),
          Expanded(
              child: IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {
                    if (onFilterClicked != null) {
                      onFilterClicked.call();
                    }
                  }),
              flex: 1),
          Expanded(
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (onAddClicked != null) {
                      onAddClicked.call();
                    }
                  }),
              flex: 1)
        ],
      ),
    );
  }
}
