import 'package:clothesstore/app/presentation/ui/screen/home/ui/tabs/home_tab.dart';
import 'package:flutter/material.dart';

class BuildTabBarView extends StatelessWidget {
  const BuildTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TabBarView(
      children: [
        const HomeTab(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.height * 0.2,
                height: size.height * 0.2,
                child: Image.asset('assets/cono.png'),
              ),
              SizedBox(
                height: size.height * 0.02,
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
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.height * 0.2,
                height: size.height * 0.2,
                child: Image.asset('assets/cono.png'),
              ),
              SizedBox(
                height: size.height * 0.02,
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
      ],
    );
  }
}
