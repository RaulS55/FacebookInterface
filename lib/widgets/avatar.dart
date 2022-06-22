import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String image;
  final bool borderImage;

  const Avatar(
      {Key? key,
      required this.size,
      required this.image,
      this.borderImage = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool _frontNetwork = image.startsWith("http");
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: borderImage
              ? Border.all(
                  width: 3,
                  color: Colors.white,
                )
              : const Border(),
          shape: BoxShape.circle,
          image: DecorationImage(
              image: _frontNetwork
                  ? NetworkImage(image) as ImageProvider
                  : AssetImage(image),
              fit: BoxFit.cover)),
    );
  }
}
