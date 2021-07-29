import 'package:flutter/material.dart';
import 'package:flutter_firebase_user/controllers/auth_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<AuthController> {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: (){
              controller.userLogOut();
            }, 
            icon: Icon(Icons.exit_to_app))
        ],
      ),
    );
}
}