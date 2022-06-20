import 'package:flutter/material.dart';

class BubbleStories extends StatefulWidget {
  final String name;
  final String logoUrl;
  const BubbleStories({Key? key, required this.name, required this.logoUrl}) : super(key: key);
  @override
  _BubbleStories createState() => _BubbleStories();
}

class _BubbleStories extends State<BubbleStories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.black26,
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.logoUrl),
              radius: 38,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(widget.name)
        ],
      ),
    );
  }
}
