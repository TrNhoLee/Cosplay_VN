import 'package:flutter/material.dart';
import 'package:cosplay_vn/Commons/Constants/app_consts.dart';
import 'package:get/get.dart';

class InputSearch extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onValueInput;
  final ValueChanged<String> onValueChanged;
  final ValueChanged<String> onValueSubmitted;

  var _enableIconClearSearch = false.obs;

  InputSearch(
      {super.key,
      required this.searchController,
      required this.onValueInput,
      required this.onValueChanged,
      required this.onValueSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => TextField(
            controller: searchController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                hintText: hintInputSearch,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: _enableIconClearSearch.value
                    ? IconButton(
                        icon: Icon(Icons.close, color: Colors.grey),
                        onPressed: _clearInputSearch)
                    : null,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
            onChanged: _inputSearchValueChanged,
            onSubmitted: _inputSearchSubmitted,
          )),
    );
  }

  void _clearInputSearch() {
    onValueInput.call();
    searchController.clear();
    _enableIconClearSearch.value = false;
  }

  void _inputSearchValueChanged(String value) {
    onValueChanged.call(value);

    if (value.isNotEmpty) {
      _enableIconClearSearch.value = true;
    } else {
      _enableIconClearSearch.value = false;
    }
  }

  void _inputSearchSubmitted(String value) {
    onValueSubmitted.call(value);
  }
}
