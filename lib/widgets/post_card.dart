import 'package:carousel_slider/carousel_slider.dart';
import 'package:esthetic/data/model/feed_response_model.dart';
import 'package:esthetic/utilities/global_variable.dart';
import 'package:esthetic/utilities/color.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [];

class Post extends StatefulWidget {
  FeedResponseModel feed = FeedResponseModel();
  Post({Key? key, required this.feed}) : super(key: key);

  @override
  _Post createState() => _Post();
}

class _Post extends State<Post> {
  @override
  Widget build(BuildContext context) {
    //final model.User user = Provider.of<UserProvider>(context).getUser;
    final width = MediaQuery.of(context).size.width;
    return Container(
      // boundary needed for web
      child: Text(
        widget.feed.mediaList?.length.toString() ?? 'Liste boş!',
        style: TextStyle(
          fontSize: 40,
          color: Colors.grey[300],
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: width > webScreenSize ? secondaryColor : mobileBackgroundColor,
        ),
        color: mobileBackgroundColor,
      ),
    );
  }
}

class _Post2 extends State<Post> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.feed.mediaList!
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imgList.indexOf(item)} image',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }
}
