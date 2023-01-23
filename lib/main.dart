import 'package:chem_x/view/registration_pages/sign_up_page.dart';
import 'package:chem_x/view_model/darkMode_controller.dart';
import 'package:chem_x/view_model/language_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'View/drawer_page/my_drawer.dart';

bool darkMode = false;
MyLanguages languages = MyLanguages();
String dropdownValue = languageList.first;
String myLanguages = 'EN';
void main() async {

  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt('initScreen');
  await prefs.setInt("initScreen", 1);

  runApp(const RunAppWithDarkMode());
}

