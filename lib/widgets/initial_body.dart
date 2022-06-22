import 'package:faceexample/widgets/avatar.dart';
import 'package:flutter/material.dart';

class InitialBody extends StatelessWidget {
  const InitialBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 20),
        Avatar(size: 60, image: "assets/users/1.jpg"),
        SizedBox(width: 15),
        Expanded(
          child: Text(
            "What is on you mind, Lisa ?",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
