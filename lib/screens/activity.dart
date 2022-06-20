import 'package:esthetic/widgets/bubble_stories.dart';
import 'package:esthetic/screens/add_operation.dart';
import 'package:flutter/material.dart';
import 'package:esthetic/data/api.dart';
import 'package:esthetic/data/model/story_bubble_response_model.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreen createState() => _ActivityScreen();
}

class _ActivityScreen extends State<ActivityScreen> {
  ApiService api = ApiService();
  List<StoryBubbleResponseModel> stories = <StoryBubbleResponseModel>[];

  _getStoryBubbles() => api.getStoryBubbles().then((response) {
        setState(() {
          stories = response;
        });
      });

  @override
  initState() {
    _getStoryBubbles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.grey[100],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Estegram', style: TextStyle(color: Colors.black)),
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.black,
                  highlightColor: Colors.grey[300],
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (signUpContext) => const AddOperationScreen()))
                  },
                ),
                const Padding(padding: EdgeInsets.all(24), child: Icon(Icons.favorite, color: Colors.black)),
                const Icon(Icons.share, color: Colors.black)
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return BubbleStories(name: stories[index].name ?? "", logoUrl: stories[index].logoUrl ?? "");
                },
              )),
          Text("First Item:" + stories[0].logoUrl.toString()),
          // Text("response:" + stories.toString()),
        ],
      ),
    );
  }
}
