import 'package:chem_x/Controller/auth.dart';
import 'package:flutter/cupertino.dart';

class TextProvider with ChangeNotifier {
  String niceToMetyouOrWelcomeBack = "Glad To Meet You!";
  String signUpOrSignIn = "Sign Up";
  String google = "Sign Up With Google";
  String faceBook = "Sign Up With FaceBook";
  String email = "Sign Up With Email";
  String doYouHaveAnAccountOrNot = "Already have an account?";
  bool oldUserOrNot=true;
  String signUpOrSignInClick="Sign In";

  void oldUser() {
    niceToMetyouOrWelcomeBack = "Welcome Back!";
    signUpOrSignIn = "Sign In";
    google = "Sign In With Google";
    faceBook = "Sign In With FaceBook";
    email = "Sign In With Email";
    doYouHaveAnAccountOrNot = "Don't Have an account yet?";
     signUpOrSignInClick="Sign Up";
    notifyListeners();
  }

  void NewUser() {
    niceToMetyouOrWelcomeBack = "Glad To Meet You!";
    signUpOrSignIn = "Sign Up";
    google = "Sign Up With Google";
    faceBook = "Sign Up With FaceBook";
    email = "Sign Up With Email";
    doYouHaveAnAccountOrNot = "Already have an account?";
    signUpOrSignInClick="Sign In";
    notifyListeners();
  }
  void loguser(){
    AuthO().haundleAuthState();
    notifyListeners();
  }
}