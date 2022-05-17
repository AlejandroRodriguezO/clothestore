import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carrousel extends StatelessWidget {
  const Carrousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeProvider = Provider.of<HomeProvider>(context);
    return SizedBox(
      height: size.height * 0.2,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: size.height * 0.2,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 1100),
          autoPlayCurve: Curves.easeIn,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) =>
              homeProvider.pageCarrousel(index, reason),
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
    );
  }
}
