// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:chem_x/view_model/firebase_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class TextProvider extends ChangeNotifier {
  String niceToMetyouOrWelcomeBack = "Glad To Meet You!";
  String signUpOrSignIn = "Sign Up";
  String google = "Sign Up With Google";
  String faceBook = "Sign Up With FaceBook";
  String email = "Sign Up With Email";
  String doYouHaveAnAccountOrNot = "Already have an account?";
  bool oldUserOrNot = true;
  String signUpOrSignInClick = "Sign In";
  String userFaceBookId = "";
  Map<dynamic, dynamic> _data = {};

  Map<dynamic, dynamic> get data => _data;
  bool isPressedButtonInQuizPageForA = false;
  bool isPressedButtonInQuizPageForB = false;
  bool isPressedButtonInQuizPageForC = false;
  bool isPressedButtonInQuizPageForD = false;
  bool isActive = false;
  int currentPageForExamPage = 0;
  String answerInQuiz = "";
  int pointsForTrueAnswers = 0;
  String dropDownValue = "";
  bool startedExamOrNot=false;
  void startedExam(){
    startedExamOrNot=true;
    notifyListeners();
  }
  bool _onBackspacePressed = true;
  bool get onBackspacePressed => _onBackspacePressed;
  final drawerKey = GlobalKey<ScaffoldState>();

  void openFirstDrawer() {
    if(drawerKey.currentState != null){
      drawerKey.currentState!.openDrawer();
    }
  }
  void setBackspacePressed() {
    _onBackspacePressed = false;
    notifyListeners();
  }


  void pointsForExamToZeroValue() {
    pointsForTrueAnswers = 0;
    notifyListeners();
  }

  void pointsForExam() {
    pointsForTrueAnswers++;
    notifyListeners();
  }

  void quizAnswer(String name) {
    answerInQuiz = name;
    notifyListeners();
  }

  void onPageExamChanged(int num) {
    currentPageForExamPage = num;
    notifyListeners();
  }

  void isActiveSwitch(bool x) {
    if (x) {
      isActive = true;
    } else {
      isActive = false;
    }
    notifyListeners();
  }

  set data(Map<dynamic, dynamic> value) {
    _data = value;
    notifyListeners();
  }

  Map<dynamic, dynamic> _userData = {};
  Map<dynamic, dynamic> get userData => _userData;

  set userData(Map<dynamic, dynamic> value) {
    _userData = value;
    notifyListeners();
  }

  void changeColorOfButtonInQuizPageForTrue(String symbol) {
    if (symbol == "A") {
      isPressedButtonInQuizPageForA = true;
    } else if (symbol == "B") {
      isPressedButtonInQuizPageForB = true;
    } else if (symbol == "C") {
      isPressedButtonInQuizPageForC = true;
    } else {
      isPressedButtonInQuizPageForD = true;
    }
    notifyListeners();
  }

  void changeColorOfButtonInQuizPageForFalse(String symbol) {
    if (symbol == "A") {
      isPressedButtonInQuizPageForA = false;
    } else if (symbol == "B") {
      isPressedButtonInQuizPageForB = false;
    } else if (symbol == "C") {
      isPressedButtonInQuizPageForC = false;
    } else {
      isPressedButtonInQuizPageForD = false;
    }
    notifyListeners();
  }

  void changeColorOfButtonInQuizPageForAllFalse() {
    isPressedButtonInQuizPageForA = false;
    isPressedButtonInQuizPageForB = false;
    isPressedButtonInQuizPageForC = false;
    isPressedButtonInQuizPageForD = false;
    notifyListeners();
  }

  void oldUser() {
    niceToMetyouOrWelcomeBack = languages.SignWelcomeBack();
    signUpOrSignIn = languages.SignSignin();
    google = languages.SigninWithGoogle();
    faceBook = languages.SigninWithFacebook();
    email = languages.SigninWithEmail();
    doYouHaveAnAccountOrNot = languages.SignWithNoAccount();
    signUpOrSignInClick = languages.SignWithSignup();
    notifyListeners();
  }

  void NewUser() {
    niceToMetyouOrWelcomeBack = languages.SignGladToMeetYou();
    signUpOrSignIn = languages.SignSignup();
    google = languages.SignupWithGoogle();
    faceBook = languages.SignupWithFacebook();
    email = languages.SignupWithEmail();
    doYouHaveAnAccountOrNot = languages.SignWithAccount();
    signUpOrSignInClick = languages.SignWithSignin();
    notifyListeners();
  }

  void facebookId(String x) {
    userFaceBookId = x;
    notifyListeners();
  }

  void loguser() {
   FirebaseController().haundleAuthState();
    notifyListeners();
  }

  void onChangedDDLAdmin(String NewValue) {
    dropDownValue = NewValue;
    notifyListeners();
  }

}
