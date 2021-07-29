import 'package:flutter/material.dart';
import 'package:flutter_firebase_user/controllers/auth_controller.dart';
import 'package:flutter_firebase_user/router.dart';
import 'package:flutter_firebase_user/views/home_screen.dart';
import 'package:flutter_firebase_user/views/login_screen.dart';
import 'package:flutter_firebase_user/views/splash_screen.dart';
import "package:get/get.dart";
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Firebase User",
      initialRoute: '/AppStart',
      getPages: Routers.routes
    );
  }
}

class AppStart extends GetView<AuthController> {
  
  @override
  Widget build(BuildContext context) {
   return Obx((){
     if(controller.message.value == 'Initialized') {
      return SplashScreen();
    } 
    else if (controller.message.value == 'Authenticated'){
      return HomeScreen();
    }
    else if (controller.message.value == 'UnAuthenticated'){
      return LoginScreen();
    }
    return SplashScreen();
  }
   );
  }
}