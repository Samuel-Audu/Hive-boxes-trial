import 'package:flutter/material.dart';
import 'package:hive_boxes/route/route.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  await Hive.initFlutter();

  await Hive.openBox<String>('referrals');
  await Hive.openBox<String>('referrals2');
  await Hive.openBox<String>('referrals3');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Admins',
      initialRoute: RouteManager.homePage,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
