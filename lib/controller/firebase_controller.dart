// ignore_for_file: avoid_print

import 'package:chem_x/Controller/chem_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../View/home_page.dart';
import '../view/registration_pages/sign_up_page.dart';

class FirebaseController {
  final _firebaseAuth = FirebaseAuth.instance;

  haundleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const PeriodicTablePage();
          } else {
            return const MyApp();
          }
        });
  }

  Future<void> signInWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSimpleNotification(
          Text(
            'Email does not exist',
            style: TextStyle(fontSize: 15.sp),
          ),
          background: Colors.red,
          duration: const Duration(seconds: 2),
        );
      } else if (e.code == 'wrong-password') {
        showSimpleNotification(
          Text(
            'Wrong password',
            style: TextStyle(fontSize: 15.sp),
          ),
          background: Colors.red,
          duration: const Duration(seconds: 2),
        );
      }
    }
  }

  userChangePassword(String currentPassword, String newPassword) {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      print("nooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
      return;
    }
    AuthCredential credential = EmailAuthProvider.credential(
      email: user.email.toString(),
      password: currentPassword,
    );

    _firebaseAuth.signInWithCredential(credential).then((authResult) {
      user.updatePassword(newPassword).then((_) {
        print("Successfully changed password!");
        toast("Password Changed Successfully!");
      }).catchError((error) {
        print("Error changing password: $error");
      });
    }).catchError((error) {
      print("Error re-authenticating user: $error");
    });
  }

  Future<void> createUserWithEmailAndPassword(
    BuildContext context, {
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      DatabaseReference ref =
          FirebaseDatabase.instance.ref(_firebaseAuth.currentUser!.uid);
      await ref.set({
        "userName": userName,
        "email": email,
        "password": password,
        "photo":
            "https://firebasestorage.googleapis.com/v0/b/chemx-59612.appspot.com/o/userImages%2Ffacebook-silhouette_thumb.jpg?alt=media&token=d3e4307a-6f90-4f56-a852-b68f4faf4b50",
      });
      ref.onValue.listen((event) {
        if (event.snapshot.exists) {
          Provider.of<TextProvider>(context, listen: false).userData =
              event.snapshot.value as Map;
        } else {
          print("nonononononononononononononononon");
        }
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          showSimpleNotification(
            Text(
              'Email already exist',
              style: TextStyle(fontSize: 15.sp),
            ),
            background: Colors.red,
            duration: const Duration(seconds: 2),
          );
          break;
      }
    }
  }

  addOrUpdateUserDataOdExams(String category,
      {int? score,
      String? question,
      List<String>? options,
      String? rightAnswer
      ,int? questionNumber}) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref(_firebaseAuth.currentUser!.uid)
        .child(category);
    await ref.update({
      if (score != null) "score": "$score",
      "question$questionNumber": question,
      "options$questionNumber": options,
      "rightAnswer$questionNumber": rightAnswer
    });
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

  getUserData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child(_firebaseAuth.currentUser!.uid).get();
    if (snapshot.exists) {
      return snapshot.value;
    } else {
      print('No data available.');
    }
  }

  Future<UserCredential> signInWithFacebook(BuildContext context) async {
    // Trigger the sign-in flow
    final LoginResult loginResult =
        await FacebookAuth.i.login(permissions: ['email', 'public_profile']);
    final userData = await FacebookAuth.instance.getUserData();
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    DatabaseReference ref = FirebaseDatabase.instance.ref(userData['id']);

    await ref.set({
      "name": userData['name'],
      "email": userData['email'],
      "pic": userData['picture']['data']['url']
    });
    ref.onValue.listen((event) {
      Provider.of<TextProvider>(context, listen: false).data =
          event.snapshot.value as Map;
    });
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  signOutUser() {
    _firebaseAuth.signOut();
  }
}
