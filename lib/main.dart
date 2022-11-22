import 'package:chem_x/view/registration_pages/sign_up_page.dart';
import 'package:chem_x/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'Controller/text_provider.dart';
import 'View/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt('initScreen');
  await prefs.setInt("initScreen", 1);

  runApp(ChangeNotifierProvider<TextProvider>(
      create: (_) => TextProvider(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return  OverlaySupport.global(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
              // home: AuthO().haundleAuthState(),
            ));
      })));
}