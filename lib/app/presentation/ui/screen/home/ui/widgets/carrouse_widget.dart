import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/dot_indicator.dart';
import 'package:flutter/material.dart';

class Carrousel extends StatefulWidget {
  const Carrousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carrousel> createState() => _CarrouselState();
}

class _CarrouselState extends State<Carrousel> {
  int index = 0;

  void pageCarrousel(int i, CarouselPageChangedReason reason) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.4,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: size.height * 0.4,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 1100),
              autoPlayCurve: Curves.easeIn,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) => pageCarrousel(index, reason),
            ),
            itemCount: 3,
            itemBuilder: (BuildContext context, int i, int pageViewIndex) =>
                Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/banner$i.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        DotIndicator(
          index: index,
        )
      ],
    );
  }
}
