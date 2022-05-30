import 'package:esthetic/data/model/home_bottom_navigation_menu_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Body Here'),
      ),
      bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed, currentIndex: _selectedIndex, onTap: navigateBottomNavBar, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
        BottomNavigationBarItem(icon: Icon(Icons.forum), label: "Forum"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ]),
    );
  }
}
