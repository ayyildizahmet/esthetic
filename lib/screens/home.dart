import 'package:esthetic/screens/activity.dart';
import 'package:esthetic/screens/forum.dart';
import 'package:esthetic/screens/shop.dart';
import 'package:esthetic/screens/profile.dart';
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

  final List<Widget> children = [
    ActivityScreen(),
    ShopScreen(),
    ForumScreen(),
    ProfileScreen(),
  ];

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
