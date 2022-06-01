import 'package:esthetic/widgets/bubble_stories.dart';
import 'package:flutter/material.dart';
import 'package:esthetic/data/api.dart';
import 'package:esthetic/data/model/story_response_model.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreen createState() => _ActivityScreen();
}

class _ActivityScreen extends State<ActivityScreen> {
  List<StoryResponseModel> stories = <StoryResponseModel>[];

  _getStories() {
    ApiService api = ApiService();
    api.getStories().then((response) {
      setState(() {
        stories = response;
      });
    });
  }

  @override
  initState() {
    _getStories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return BubbleStories(name: stories[index].name ?? "", logoUrl: stories[index].logoUrl ?? "");
                },
              )),
          Text("List Count:" + stories.length.toString()),
          // Text("response:" + stories.toString()),
        ],
      ),
    );
  }
}
