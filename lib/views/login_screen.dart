import 'package:flutter/material.dart';
import 'package:flutter_firebase_user/controllers/auth_controller.dart';
import 'package:flutter_firebase_user/views/register_screen.dart';
import "package:ionicons/ionicons.dart";
import 'package:get/get.dart';


class LoginScreen extends GetView<AuthController> {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: double.infinity,
                  height: size.height*0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/login.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
              ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        child: Text("Login",style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                        ),
                        textAlign: TextAlign.left
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          hintText: "Email ID",
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                       SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                       SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff6666ff)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                              )
                            )
                          ),
                          onPressed: (){
                            controller.isLoading.value = true;
                            controller.loginWithEmailAndPassword();
                          },
                          child: Obx((){
                            return 
                            controller.isLoading.value ? Container(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(color: Colors.white,)
                          ): 
                          Text("Login",style: TextStyle(fontSize: 18),);
                          }),
                          
                          ),
                      )
                    ],),
                ),
              ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Text("Or, login with",style: TextStyle(
                          fontSize: 16,
                        ),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Container(
                                width: size.width*0.4,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey, //                   <--- border color
                                    width: 0.5,
                                  ),
                                ),
                                child: Icon(Icons.facebook,color: Colors.blue,size: 40,),
                              ),
                              onTap: (){
                                print("Ready for facebook Sign in!!");
                              },
                            ),
                            InkWell(
                              child: Container(
                                width: size.width*0.4,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,                  
                                    width: 0.5,
                                  ),
                                ),
                                child: Icon(Ionicons.logo_google,color: Colors.redAccent,size: 38,),
                              ),
                              onTap: (){
                                print("Ready for google Sign in!!");
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: (){
                            Get.to(RegisterScreeen());
                          },
                          child: Text("Create new account?",style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xff6666ff),
                            fontWeight: FontWeight.w500
                          ),))
                      ],),
                  ),
                )
            ],
            ),
        )
    );
  }
}

//#6666ff
// #4d4dff