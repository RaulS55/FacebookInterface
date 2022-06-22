import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:faceexample/Models/publications.dart';
import 'package:faceexample/widgets/bottom_circular.dart';
import 'package:faceexample/widgets/initial_body.dart';
import 'package:faceexample/widgets/publication_item.dart';
import 'package:faceexample/widgets/second_body.dart';
import 'package:faceexample/widgets/stories.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FacePage extends StatefulWidget {
  const FacePage({Key? key}) : super(key: key);

  @override
  State<FacePage> createState() => _FacePageState();
}

class _FacePageState extends State<FacePage> {
  final List _colorsList = [Colors.green, Colors.blue, Colors.red];
  final List _textList = ["Galery", "Tag Friends", "Live"];
  final List _iconsList = [
    EvaIcons.imageOutline,
    EvaIcons.people,
    EvaIcons.video
  ];
  List<IconData> listIconos = [
    EvaIcons.search,
    EvaIcons.bell,
    EvaIcons.people,
    EvaIcons.messageCircle
  ];
  List<Color> listColors = [
    const Color(0xffBFBFBF),
    const Color(0xffFE7574),
    const Color(0xff7BBAFF),
    const Color(0xff1C86E4),
  ];
  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final random = faker.randomGenerator;
    final publications = <Publication>[];
    for (int i = 0; i < 50; i++) {
      final publication = Publication(
          title: faker.lorem.sentence(),
          datePubli: faker.date.dateTime(),
          imagegPubli: faker.image.image(random: true),
          commentsCount: random.integer(10000),
          shareCounts: random.integer(1000),
          user: User(
              avatar: faker.image.image(keywords: ["people"], random: true),
              userName: faker.person.name()),
          userReaction:
              Reaction.values[random.integer(Reaction.values.length - 1)]);

      publications.add(publication);
    }
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SvgPicture.asset(
          "assets/logo/facebook.svg",
          color: Colors.blue,
          width: 150,
        ),
        actions: List.generate(
            listColors.length,
            (index) => AppBarButton(
                  bottonColor: listColors[index],
                  icon: listIconos[index],
                  statePoint: index == 2,
                )),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 15),
        children: [
          const InitialBody(),
          const SizedBox(height: 20),
          SizedBox(
            height: 35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                _colorsList.length,
                (index) => SecondBody(
                  color1: _colorsList[index],
                  text: _textList[index],
                  icon: _iconsList[index],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Stories(),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true, //la altura se calcula de forma automatica
            itemBuilder: (_, index) => PublicationItem(
              publication: publications[index],
            ),
            itemCount: publications.length,
          )
        ],
      ),
    );
  }
}
