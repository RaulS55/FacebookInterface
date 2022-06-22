import 'package:faceexample/Models/story.dart';
import 'package:faceexample/widgets/avatar.dart';
import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 160,
      child: ListView.builder(
        itemCount: listStory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final _story = listStory[index];
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 90,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(_story.story),
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                top: 100,
                child: Avatar(
                  size: 40,
                  image: _story.avatar,
                  borderImage: true,
                ),
              ),
              Positioned(bottom: 0, child: Text(_story.name))
            ],
          );
        },
      ),
    );
  }
}
