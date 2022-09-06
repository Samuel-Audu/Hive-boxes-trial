import 'package:flutter/material.dart';
import 'package:hive_boxes/route/route.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pyramid'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RouteManager.referralPage, arguments: 'Abims');
              },
              child: const Text('Abims')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RouteManager.referralPage2, arguments: 'Femi');
              },
              child: const Text('Femi')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RouteManager.referralPage3, arguments: 'Olisa');
              },
              child: const Text('Olisa')),
        ],
      ),
    );
  }
}
