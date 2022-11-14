import 'package:chem_x/Controller/auth.dart';
import 'package:flutter/cupertino.dart';

class TextProvider with ChangeNotifier {
  String niceToMetyouOrWelcomeBack = "Glad to Meet You!";
  String signUpOrSignIn = "Sign In";
  String google = "Sign up with Google";
  String faceBook = "Sign up with FaceBook";
  String email = "Sign up with Email";
  String doYouHaveAnAccountOrNot = "Already have an account?";
  bool oldUserOrNot=true;

  void oldUser() {
    niceToMetyouOrWelcomeBack = "Welcome Back!";
    signUpOrSignIn = "Sign Up";
    google = "Sign in with Google";
    faceBook = "Sign in with FaceBook";
    email = "Sign in with Email";
    doYouHaveAnAccountOrNot = "Don't have an account yet?";
    notifyListeners();
  }

  void NewUser() {
    niceToMetyouOrWelcomeBack = "Glad to Meet You!";
    signUpOrSignIn = "Sign In";
    google = "Sign Up with Google";
    faceBook = "Sign Up with FaceBook";
    email = "Sign Up with Email";
    doYouHaveAnAccountOrNot = "Already have an account?";
    notifyListeners();
  }
  void loguser(){
    AuthO().haundleAuthState();
    notifyListeners();
  }
}
