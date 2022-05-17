
import 'package:clothesstore/app/presentation/ui/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Align(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 20,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 5,),
              decoration: BoxDecoration(
                  color:
                      homeProvider.index == index ? Colors.black : Colors.black12,
                  shape: BoxShape.circle),
            ),
          ),
        ),
      ),
    );
  }
}