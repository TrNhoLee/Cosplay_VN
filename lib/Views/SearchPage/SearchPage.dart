import 'package:cosplay_vn/Views/SearchPage/Childs/InputSearch.dart';
import 'package:flutter/material.dart';
import 'package:cosplay_vn/ViewModels/Search/SearchViewModel.dart';
import 'package:cosplay_vn/Views/HomePage/Childs/ListPicture.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //--------------------------------------------
  //ViewModel
  //--------------------------------------------
  SearchViewModel _searchViewModel;

  //--------------------------------------------
  //Properties
  //--------------------------------------------
  List<String> _listPicture;
  TextEditingController _searchController;
  bool _enableIconClearSearch;

  //--------------------------------------------
  //Initialize
  //--------------------------------------------
  @override
  void initState() {
    _searchViewModel = SearchViewModel();
    _searchController = TextEditingController();
    _enableIconClearSearch = false;
    _listPicture = [];
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
      body: Container(
        child: Column(
          children: [
            InputSearch(
              onValueInput: _clearInputSearch,
              onValueChanged: _inputSearchValueChanged,
              onValueSubmitted: _inputSearchSubmitted,
            ),
            Flexible(
                child: Center(
              child: _listPicture.isEmpty ? null : createListPictureView(),
            ))
          ],
        ),
      ),
    );
  }

  //--------------------------------------------
  //Private function
  //--------------------------------------------
  void _clearInputSearch() {
    setState(() {
      _listPicture = [];
    });
    return;
  }

  _inputSearchValueChanged(String value) {
    return;
  }

  _inputSearchSubmitted(String value) async {
    var keyword = value.trim();

    if (keyword.isEmpty) {
      return;
    }

    _listPicture = await _searchViewModel.searchPictures(keyword);

    setState(() {
      _listPicture;
    });
  }

  Future<void> _lstPictureRefresh() async {
    _listPicture = await _searchViewModel.refreshListPicture(_listPicture);

    setState(() {
      _listPicture;
    });
  }

  createListPictureView() {
    return RefreshIndicator(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: ListPicture(lstPictureUrl: _listPicture),
      ),
      onRefresh: _lstPictureRefresh,
    );
  }
}
