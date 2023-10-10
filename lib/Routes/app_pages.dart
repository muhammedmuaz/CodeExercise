import 'package:get/get.dart';

import '../views/listscreen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static var initial = _Paths.home;
  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomePage(),
    ),
  ];
}