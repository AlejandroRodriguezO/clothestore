import 'package:clothesstore/app/presentation/ui/screen/search/ui/search.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 40, top: 20),
            child: Text(
              'Buscar',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () => showSearch(
              context: context,
              delegate: Search(),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 40),
              width: double.infinity,
              height: 45,
              color: Colors.white,
              child: Row(
                children: const [
                  Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Busca productos, marcas y más',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
