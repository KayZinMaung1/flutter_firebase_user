import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserRepository{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebase = FirebaseFirestore.instance;

  User? getCurrentUser(){
    User? currentUser = _auth.currentUser;
    return currentUser;
  }

  Future<UserCredential> login({required String email,required String password}){
    Future<UserCredential> user = _auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }

 Future<void> logOut(){
   return _auth.signOut();
 }

 Future<UserCredential> register({required String email,required String password}) async{
   UserCredential user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
   return user;
 }


 createUser() async{
   final _user = _auth.currentUser;
   

   Map<String,dynamic> requestData = {
      "uid": _user!.uid,
      "name": _user.displayName,
      "email": _user.email,
      "profile": _user.photoURL,
      "createdAt": DateTime.now()
   };

   await _firebase
   .collection("users")
   .doc(_user.uid)
   .collection("user_info")
   .add(requestData)
   .whenComplete(() => "Successfully added!");
 }


 getUserData() async{
   
   String userId = _auth.currentUser!.uid;
   
   QuerySnapshot querySnapshot = await _firebase
                                      .collection("users")
                                      .doc(userId)
                                      .collection("user_info")
                                      .get()
                                      .whenComplete(() => "Get data successfully");

  Map<String,dynamic>? userData;

  if(querySnapshot.docs.length > 0){
    userData = querySnapshot.docs.single.data() as Map<String, dynamic>?; 
  }
  return userData;

 }

}