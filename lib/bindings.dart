import 'package:flutter_firebase_user/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AppStartBind extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
  
  
}