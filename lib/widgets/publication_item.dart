import 'package:faceexample/Models/publications.dart';
import 'package:faceexample/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cacheing/image_cacheing.dart';
import 'package:timeago/timeago.dart' as time_ago;

class PublicationItem extends StatelessWidget {
  const PublicationItem({Key? key, required this.publication})
      : super(key: key);
  final Publication publication;
  final reactions = Reaction.values;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 6, color: Color(0xffEBEBEB)))),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Avatar(
                  size: 40,
                  image: publication.user.avatar,
                ),
                const SizedBox(width: 10),
                Text(publication.user.userName),
                const Spacer(),
                Text(time_ago.format(publication.datePubli))
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 2.3,
            child: ImageCacheing(
              url: publication.imagegPubli,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              publication.title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ...List.generate(reactions.length, (index) {
                        final reaction = reactions[index];
                        final bool isActive =
                            reaction == publication.userReaction;
                        return Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                getEmojiPad(reaction),
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(height: 3),
                              if (isActive)
                                const Icon(
                                  Icons.circle,
                                  size: 5,
                                  color: Colors.red,
                                )
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                                "${formatCount(publication.commentsCount)} Comment"),
                            const SizedBox(width: 10),
                            Text(
                                "${formatCount(publication.shareCounts)} Shares"),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }

  String getEmojiPad(Reaction reaction) {
    switch (reaction) {
      case Reaction.angry:
        return "assets/emojis/angry.svg";
      case Reaction.laughing:
        return "assets/emojis/laughing.svg";
      case Reaction.like:
        return "assets/emojis/like.svg";
      case Reaction.sad:
        return "assets/emojis/sad.svg";
      case Reaction.love:
        return "assets/emojis/heart.svg";
      case Reaction.shocked:
        return "assets/emojis/shocked.svg";
    }
  }

  String formatCount(int value) {
    if (value <= 1000) {
      return value.toString();
    } else {
      return (value / 1000).toStringAsFixed(1) + "K";
    }
  }
}
