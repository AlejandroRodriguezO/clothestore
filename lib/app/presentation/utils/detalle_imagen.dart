import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      backgroundColor: Colors.black,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Image.network(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
