import 'package:faceexample/widgets/bottom_circular.dart';
import 'package:flutter/material.dart';

class SecondBody extends StatelessWidget {
  final Color color1;
  final String text;
  final IconData icon;
  const SecondBody({
    Key? key,
    required this.color1,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color1.withOpacity(0.2)),
      child: Row(
        children: [
          AppBarButton(bottonColor: color1, icon: icon, statePoint: false),
          Text(
            text,
            style: TextStyle(color: color1),
          ),
        ],
      ),
    );
  }
}
