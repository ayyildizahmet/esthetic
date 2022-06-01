import 'package:flutter/material.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({Key? key}) : super(key: key);

  @override
  _ForumScreen createState() => _ForumScreen();
}

class _ForumScreen extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Forum")));
  }
}
