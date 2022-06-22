import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final Color bottonColor;
  final IconData icon;
  final bool statePoint;

  const AppBarButton(
      {Key? key,
      required this.bottonColor,
      required this.icon,
      required this.statePoint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 36,
          height: 36,
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bottonColor,
          ),
        ),
        if (statePoint)
          Positioned(
              right: 10,
              top: 9,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(color: Colors.white, width: 2)),
              ))
      ],
    );
  }
}
