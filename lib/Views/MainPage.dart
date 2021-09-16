import 'package:cosplay_vn/Commons/Constants/AppConsts.dart';
import 'package:cosplay_vn/Views/AccountPage/AccountPage.dart';
import 'package:cosplay_vn/Views/HomePage/HomePage.dart';
import 'package:cosplay_vn/Views/NotificationPage/NotificationPage.dart';
import 'package:cosplay_vn/Views/SearchPage/SearchPage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //--------------------------------------------
  //ViewModel
  //--------------------------------------------

  //--------------------------------------------
  //Properties
  //--------------------------------------------
  List<Widget> _mainScreens;
  int _selectedIndex;

  //--------------------------------------------
  //Initialize
  //--------------------------------------------
  @override
  void initState() {
    _selectedIndex = 0;
    _mainScreens = [
      HomePage(),
      SearchPage(),
      NotificationPage(),
      AccountPage()
    ];
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
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _mainScreens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: lblHome,
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: lblSearch,
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.mark_chat_unread),
              label: lblNoti,
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: lblAccount,
              backgroundColor: Colors.grey),
        ],
        onTap: _bottomBarItemTapped,
      ),
    );
  }

  //--------------------------------------------
  //Private function
  //--------------------------------------------
  _bottomBarItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
