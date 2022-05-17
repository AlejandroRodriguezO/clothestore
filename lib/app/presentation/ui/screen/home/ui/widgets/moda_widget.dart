
import 'package:flutter/material.dart';

class Moda extends StatelessWidget {
  const Moda({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: size.width,
        height: size.height * 0.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Container(
                  width: size.width * 0.7,
                  height: size.height * 0.2,
                  margin: EdgeInsets.only(right: index == 2 ? 5 : 10),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/image$index.jpeg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: size.width * 0.7,
                  height: 200,
                  decoration: BoxDecoration(
                  color: Colors.black26,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      index == 0
                          ? 'MODA INFANTIL'
                          : index == 1
                              ? 'MODA DAMA'
                              : 'MODA CABALLERO',
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}