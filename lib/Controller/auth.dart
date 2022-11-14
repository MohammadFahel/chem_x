import 'dart:convert';
import 'dart:math';

import 'package:chem_x/View/home_screen.dart';
import 'package:chem_x/View/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthO{
haundleAuthState(){
  return StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (BuildContext context,snapshot){
      if(snapshot.hasData){
        return HomePageChemX();
      }else{
        return MyApp();
      }
    }
  );}
signInwithGoogle()async{

// Trigger the authentication flow
  final GoogleSignInAccount? googleUser= await GoogleSignIn(
    scopes: <String>["email"]
  ).signIn();
// Obtain the auth details from the request
final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
// Create a new credential
final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth. accessToken,
    idToken: googleAuth. idToken,);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
}
Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.i.login(
    permissions: ['email','public_profile','user_birthday']
  );

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);


  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}

}