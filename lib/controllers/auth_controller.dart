import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_user/services/user_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  RxString message = 'Initialized'.obs;
  late UserRepository _userRepository;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> formKey;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _userRepository = UserRepository();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
   

    Future.delayed(Duration(seconds: 1)).then((value) {
      checkUser();
    });

    
    
  }

  checkUser(){
    User? user = _userRepository.getCurrentUser();
    if(user == null){
      message.value = 'UnAuthenticated';
    }
    else{
      message.value = 'Authenticated';
    }
  }

  loginWithEmailAndPassword() async{
    try{
      await _userRepository.login(email: emailController.text, password: passwordController.text).then((value){
        isLoading.value = false;
        message.value = "Authenticated";
        Get.snackbar("Success", "login successfully!",snackPosition: SnackPosition.BOTTOM);
      });
    }
    on FirebaseAuthException catch (e) {
      isLoading.value = false;
      message.value = "UnAuthenticated";
      if (e.code == 'user-not-found') {
        Get.snackbar("Someting Wrong!", "No user found for that email.",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Someting Wrong!", "Password is wrong!",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      isLoading.value = false;
      message.value = "UnAuthenticated";
      Get.snackbar("Someting Wrong!", "Register failed ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM);
    }

    }

  Future<void> userLogOut() async{
    try{
      await _userRepository.logOut().then((value) {
        message.value = "UnAuthenticated";
        Get.snackbar("Success", "Log Out Successfully!",snackPosition: SnackPosition.BOTTOM);
      });
    }catch(e){
      message.value = "Authenticated";
      Get.snackbar("Failed", "Log out Failed! ${e.toString()}",snackPosition: SnackPosition.BOTTOM);
    }
  }

 registerWithEmailAndPassword() async{
   try{
     await _userRepository.register(email: emailController.text, password: passwordController.text).then((value) async {

       //add other data into userinfo collection
       var userData =  await _userRepository.getUserData();
       
       if(userData == null){
         await _userRepository.createUser();
       }
     

       isLoading.value = false;
       message.value = "Authenticated";
       Get.snackbar("Success", "Register Successfully!",snackPosition: SnackPosition.BOTTOM);
       
       
     });
   }on FirebaseAuthException catch(e){
      isLoading.value = false;
      message.value = "UnAuthenticated";
      if (e.code == 'weak-password') {
        Get.snackbar("Someting Wrong!", "The password provided is too weak.", snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Something Wrong!", "The account already exists for that email.", snackPosition: SnackPosition.BOTTOM);
      }
   }
   catch(e){
     isLoading.value = false;
     message.value = "UnAuthenticated";
     Get.snackbar("Something wrong!", "Register failed.${e.toString()}");
   }

 }

@override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    super.onClose();
  }
  }


