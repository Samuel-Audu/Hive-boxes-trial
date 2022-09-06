import 'package:hive/hive.dart';

class Box1 {
  static Box<String> getReferrals() => Hive.box<String>('referrals');
}

class Box2 {
  static Box<String> getReferrals2() => Hive.box<String>('referrals2');
  static Box<String> getReferrals3() => Hive.box<String>('referrals3');
}
