import 'package:clothesstore/app/presentation/ui/screen/detail/provider/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<DetailProvider>(
      builder: (context, detailProvider, child) => Container(
        width: size.width * 0.30,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            width: 0.1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => detailProvider.decrement(),
              child:const Icon(Icons.remove),
            ),
            Text(detailProvider.count.toString()),
            InkWell(
              onTap: () => detailProvider.increment(),
              child:const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
