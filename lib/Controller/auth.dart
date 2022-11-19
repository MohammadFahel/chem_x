import 'package:chem_x/View/home_screen.dart';
import 'package:chem_x/View/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sizer/sizer.dart';

import '../View/splash_screen.dart';

class AuthO {
  final _firebaseAuth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

  haundleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomePageChemX();
          } else {
            return MyApp();
          }
        });
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSimpleNotification(
          Text('Email does not exist', style: TextStyle(fontSize: 15.sp),),
          background: Colors.red,
          duration: Duration(seconds: 2),);
      } else if (e.code == 'wrong-password') {
        showSimpleNotification(
          Text('Wrong password', style: TextStyle(fontSize: 15.sp),),
          background: Colors.red,
          duration: Duration(seconds: 2),);
      }
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          // toast('Email already exist',duration:Toast.LENGTH_LONG );
          showSimpleNotification(
            Text('Email already exist', style: TextStyle(fontSize: 15.sp),),
            background: Colors.red,
            duration: Duration(seconds: 2),);
          break;
      }
    }
  }

  signInwithGoogle() async {
// Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
    await GoogleSignIn(scopes: <String>["email"]).signIn();
// Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;
// Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.i
        .login(permissions: ['email', 'public_profile']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  signOutUser() {
    _firebaseAuth.signOut();
  }

  // void facebookSignInMethod() async {
  //   FacebookLoginResult result = await _facebookLogin.logIn(
  //       permissions: [FacebookPermission.email]);
  //   final accessToken = result.accessToken!.token;
  //   if (result.status == FacebookLoginStatus.values) {
  //     final faceCredential = FacebookAuthProvider.credential(accessToken);
  //     await _firebaseAuth.signInWithCredential(faceCredential);
  //   }
  // }
}
