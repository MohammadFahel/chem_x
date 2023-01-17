import 'dart:async';
import 'package:chem_x/controller/firebase_controller.dart';
import 'package:chem_x/view/registration_pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => initScreen == 0 || initScreen == null
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen1()),
            )
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => FirebaseController().haundleAuthState()),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [Color(0xffaaa1c8), Color(0xffebebeb)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/chemxlogo.png",
                    height: 15.h, width: 20.w),
                SizedBox(width: 2.5.w),
                Text(
                  "ChemX",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 25.0.sp, color: HexColor("#192A51"))),
                ),
              ],
            ),
            Text(
              "The easy way to learn\nPeriodic Table",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 17.5.sp, color: HexColor("#494949"))),
            ),
            SizedBox(height: 20.h),
            CircularProgressIndicator(
              color: HexColor("#192A51"),
            ),
          ],
        ),
      ),
    );
  }
}
