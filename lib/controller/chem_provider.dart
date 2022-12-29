import 'package:chem_x/Controller/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class TextProvider extends ChangeNotifier {

  // ThemeData _themeData = darkMode? ThemeData.dark(): ThemeData.light();
  // getTheme(){
  //   return _themeData;
  // }
  // void setTheme(ThemeData theme){
  //   _themeData = theme;
  //   notifyListeners();
  // }
  //

  String niceToMetyouOrWelcomeBack = "Glad To Meet You!";
  String signUpOrSignIn = "Sign Up";
  String google = "Sign Up With Google";
  String faceBook = "Sign Up With FaceBook";
  String email = "Sign Up With Email";
  String doYouHaveAnAccountOrNot = "Already have an account?";
  bool oldUserOrNot=true;
  String signUpOrSignInClick="Sign In";
  String userFaceBookId="";
  Map<dynamic, dynamic> _data={};
  Map<dynamic, dynamic> get data => _data;
  bool isPressedButtonInQuizPageForA=false;
  bool isPressedButtonInQuizPageForB=false;
  bool isPressedButtonInQuizPageForC=false;
  bool isPressedButtonInQuizPageForD=false;
  bool isActive = false;

  void isActiveSwitch(bool x){
    if (x){
      isActive=true;
    } else {
      isActive=false;
    }
    notifyListeners();
  }

  set data(Map<dynamic, dynamic> value) {
    _data = value;
    notifyListeners();
  }
  Map<dynamic, dynamic> _userData={};
  Map<dynamic, dynamic> get userData => _userData;
  set userData(Map<dynamic, dynamic> value) {
    print(value);
    print("user was hereeeeeeeeeeeeeeee");
    _userData = value;
    notifyListeners();
  }
  void changeColorOfButtonInQuizPageForTrue(String symbol){
    if(symbol=="A"){
      isPressedButtonInQuizPageForA=true;

    }else if(symbol=="B"){
      isPressedButtonInQuizPageForB=true;

    }else if(symbol=="C"){
      isPressedButtonInQuizPageForC=true;
    }else{
      isPressedButtonInQuizPageForD=true;

    }
    notifyListeners();
  }
  void changeColorOfButtonInQuizPageForFalse(String symbol){
    if(symbol=="A"){
      isPressedButtonInQuizPageForA=false;
    }else if(symbol=="B"){
      isPressedButtonInQuizPageForB=false;
    }else if(symbol=="C"){
      isPressedButtonInQuizPageForC=false;
    }else{
      isPressedButtonInQuizPageForD=false;

    }
    notifyListeners();
  }
  void changeColorOfButtonInQuizPageForAllFalse(){

      isPressedButtonInQuizPageForA=false;

      isPressedButtonInQuizPageForB=false;

      isPressedButtonInQuizPageForC=false;

      isPressedButtonInQuizPageForD=false;


    notifyListeners();
  }

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
  void facebookId(String x){
    userFaceBookId=x;
    notifyListeners();
  }
  void loguser(){
    AuthO().haundleAuthState();
    notifyListeners();
  }



}