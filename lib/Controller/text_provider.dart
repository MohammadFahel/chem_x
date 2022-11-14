import 'package:chem_x/Controller/auth.dart';
import 'package:flutter/cupertino.dart';

class TextProvider with ChangeNotifier {
  String niceToMetyouOrWelcomeBack = "Glad To Meet You!";
  String signUpOrSignIn = "Sign In";
  String google = "Sign Up With Google";
  String faceBook = "Sign Up With FaceBook";
  String email = "Sign Up With Email";
  String doYouHaveAnAccountOrNot = "Already have an account?";
  bool oldUserOrNot=true;

  void oldUser() {
    niceToMetyouOrWelcomeBack = "Welcome Back!";
    signUpOrSignIn = "Sign Up";
    google = "Sign In With Google";
    faceBook = "Sign In With FaceBook";
    email = "Sign In With Email";
    doYouHaveAnAccountOrNot = "Don't Have an account yet?";
    notifyListeners();
  }

  void NewUser() {
    niceToMetyouOrWelcomeBack = "Glad To Meet You!";
    signUpOrSignIn = "Sign In";
    google = "Sign Up With Google";
    faceBook = "Sign Up With FaceBook";
    email = "Sign Up With Email";
    doYouHaveAnAccountOrNot = "Already have an account?";
    notifyListeners();
  }
  void loguser(){
    AuthO().haundleAuthState();
    notifyListeners();
  }
}
