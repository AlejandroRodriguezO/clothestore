import 'package:flutter/material.dart';

class CarritoTab extends StatelessWidget {
  const CarritoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/cono.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'ESTA SECCIÓN ESTÁ \n EN CONSTRUCCIÓN, \n ¡ESPERALA PRONTO! 👌',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
