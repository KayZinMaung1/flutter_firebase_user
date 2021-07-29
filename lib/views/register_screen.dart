

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_user/controllers/auth_controller.dart';
import 'package:get/get.dart';


class RegisterScreeen extends GetView<AuthController> {
  const RegisterScreeen({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 85),
              child: Container(
                width: double.infinity,
                height: size.height*0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/register.png"),
                    fit: BoxFit.cover,
                    
                  ),
                ),
                ),
            ),
      
      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Container(
                          width: double.infinity,
                          child: Text("Register",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700
                          ),
                          textAlign: TextAlign.left
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          controller: controller.emailController,
                          validator: (text){
                            if(text!.isEmpty){
                              return "Email is empty!";
                            }
                            else if(EmailValidator.validate(text)){
                              return null;
                            }
                            else{
                              return "Email is invalid!";
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email ID",
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                         SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          controller: controller.passwordController,
                          validator: (text){
                            if(text!.isEmpty){
                              return "Password is empty!";
                            }
                            else if(text.length < 8){
                              return "At least 8 characters!";
                            }
                            else {return null;}
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                         SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          controller: controller.confirmPasswordController,
                          obscureText: true,
                          validator: (text){
                            if(text != controller.passwordController.text){
                              return "Not Match with password!";
                            }
                            else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                         SizedBox(
                          height: 35,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                         
                          child: ElevatedButton(
                            onPressed: (){
                              
                              if(controller.formKey.currentState!.validate()){
                                controller.isLoading.value = true;
                                controller.registerWithEmailAndPassword();
                              }
                            }, 
                           
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xff6666ff)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                                )
                              )
                            ),
                  
                             child: Obx((){
                               return
                               controller.isLoading.value ? Container(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(color: Colors.white,)
                                ): 
                             Text("Register",style: TextStyle(fontSize: 18),);
                             }),
                            
                            ),
                        )
                      ],),
                  ),
                ),
              ),

        ],),),
    );
}
}