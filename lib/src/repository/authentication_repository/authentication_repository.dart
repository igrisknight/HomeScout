import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homescout/src/features/authentication/screens/welcome/welcome.dart';
import 'package:homescout/src/features/core/screens/dashboard/dashboard.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  //variable related to firebase
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const Dashboard());

  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
    }catch (_){}
  }
  Future<void> loginWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
    }catch (_){}
  }

  Future<void> logout() async => _auth.signOut();
}