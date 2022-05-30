import 'package:flutter/material.dart';

class BubbleStories extends StatefulWidget {
  final String name;
  const BubbleStories({Key? key, required this.name}) : super(key: key);
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
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[400]),
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
