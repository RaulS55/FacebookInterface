import 'package:flutter/material.dart';

class MyAspectRatio extends StatelessWidget {
  const MyAspectRatio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 0.8,
          child: Image.network(
            "https://www.caracteristicas.co/wp-content/uploads/2017/02/perro-3-e1561679204818-800x400.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
