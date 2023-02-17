import 'package:flutter/material.dart';
import 'package:flutter_insta_firebase/Screens/dragDropScreen.dart';
import 'package:flutter_insta_firebase/Screens/home_screen.dart';
import 'package:flutter_insta_firebase/Screens/user_screen.dart';
import 'package:flutter_insta_firebase/Widgets/appbar.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _selectedIndex = 0;
  // late PageController pageController;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    DragDropScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    UserScreen(),
    // DragDropScreen()
    HomeScreen()
  ];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   pageController = PageController();
  // }
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   pageController.dispose();
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // pageController.jumpToPage(index);
  }

  // void onChangePage(int page) {
  //   setState(() {
  //     _selectedIndex = page;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? getAppBar() : null,
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
        // child: PageView(
        //   children:  _widgetOptions,
        //   controller: pageController,
        //   onPageChanged: onChangePage,
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_sharp),
            label: 'Edit Image',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
