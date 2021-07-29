
import 'package:flutter_firebase_user/views/home_screen.dart';
import 'package:flutter_firebase_user/views/login_screen.dart';
import 'package:flutter_firebase_user/views/register_screen.dart';
import 'package:get/get.dart';

import 'bindings.dart';
import 'main.dart';

class Routers {
  static List<GetPage> routes = [
    GetPage(name: "/AppStart", page:() => AppStart(),binding: AppStartBind()),
    GetPage(name: "/login", page:() => LoginScreen(),binding: AppStartBind()),
    GetPage(name: "/home", page:() => HomeScreen(),binding: AppStartBind()),
    GetPage(name: "/register", page:() => RegisterScreeen(),binding: AppStartBind()),
  ];
}