import 'package:flutter/material.dart';
import 'package:hive_boxes/pages/homepage.dart';
import 'package:hive_boxes/pages/referralpage.dart';
import 'package:hive_boxes/pages/referralpage2.dart';
import 'package:hive_boxes/pages/referralpage3.dart';

class RouteManager {
  static const String homePage = '/';
  static const String referralPage = '/referralPage';
  static const String referralPage2 = '/referralPage2';
  static const String referralPage3 = '/referralPage3';

  RouteManager._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case referralPage:
        final title = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ReferralPage(
            title: title,
          ),
        );

      case referralPage2:
        final title = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ReferralPage2(
            title: title,
          ),
        );

      case referralPage3:
        final title = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ReferralPage3(
            title: title,
          ),
        );

      default:
        throw const FormatException('Route not found!');
    }
  }
}
