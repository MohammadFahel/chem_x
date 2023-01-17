// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, avoid_print

import 'package:chem_x/Controller/firebase_controller.dart';
import 'package:chem_x/Controller/chem_provider.dart';
import 'package:chem_x/main.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/theme_service.dart';
import 'dialog_sign_in.dart';
import 'dialog_sign_up.dart';

int? initScreen;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePage();
  }
}

class MyHomePage extends State<MyApp> {
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/signup_in.png"),
                fit: BoxFit.cover)),
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Expanded(flex: 1, child: SizedBox()),
                Expanded(flex: 2, child: ContainerForSignInAndSignUp(context)),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

Widget ContainerForSignInAndSignUp(BuildContext context) {
  var textProvider = Provider.of<TextProvider>(context);
  return Container(
    decoration: BoxDecoration(
        color: ThemeService().getThemeMode() == ThemeMode.light
            ? Colors.white
            : Colors.grey.shade400,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
    child: Padding(
      padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
      child: Column(
        textDirection: languages.getMyLanguages() == 'EN'
            ? TextDirection.ltr
            : TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.0.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/chemxlogo.png",
                  width: 10.0.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.0.h),
                  child: Text(
                    "ChemX",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 22.0.sp,
                      color: HexColor("#192A51"),
                    )),
                  ),
                )
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),

          Container(
            height: 0.2.h,
            width: double.infinity,
            color: Colors.grey,
          ),

          Padding(
            padding: EdgeInsets.only(top: 4.0.h),
            child: Text(
              textProvider.niceToMetyouOrWelcomeBack,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 20.0.sp,
                color: Colors.black,
              )),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0.h),
            child: Text(
              textProvider.signUpOrSignIn,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 15.0.sp,
                      color: ThemeService().getThemeMode() == ThemeMode.light
                          ? Colors.grey
                          : Colors.black54)),
            ),
          ),

          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(HexColor("#849ED9")),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
              onPressed: () {
                FirebaseController().signInwithGoogle();
                textProvider.loguser();
              },
              child: SizedBox(
                height: 6.0.h,
                width: double.infinity,
                child: Row(
                    textDirection: languages.getMyLanguages() == 'EN'
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        textProvider.google,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 15.0.sp,
                          color: Colors.white,
                        )),
                      ), // <-- Text
                      const SizedBox(
                        width: 5,
                      ),
                      const Spacer(),
                      Container(
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/images/googlelogo.png",
                            width: 30,
                            height: 30,
                          )),
                    ]),
              )),
          SizedBox(
            height: 2.0.h,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(HexColor("#192A51")),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
              onPressed: () {
                FirebaseController().signInWithFacebook(context);
              },
              child: SizedBox(
                height: 6.0.h,
                width: double.infinity,
                child: Row(
                    textDirection: languages.getMyLanguages() == 'EN'
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        textProvider.faceBook,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 15.0.sp,
                          color: Colors.white,
                        )),
                      ), // <-- Text
                      const SizedBox(
                        width: 5,
                      ),
                      const Spacer(),
                      Container(
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/images/facebooklogo.png",
                            width: 30,
                            height: 30,
                          )),
                    ]),
              )),
          //   appButtons(color: "#192A51", text: text.faceBook, image: "assets/facebooklogo.png",type: "faceBook"),
          SizedBox(
            height: 2.0.h,
          ),

          Row(
            textDirection: languages.getMyLanguages() == 'EN'
                ? TextDirection.ltr
                : TextDirection.rtl,
            children: [
              Text(
                languages.SignOring(),
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Container(
                  height: 0.3.h,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.0.h,
          ),
          appButtons(
              color: "#AAA1C8",
              text: textProvider.email,
              image: "assets/images/Vector.png",
              type: "Email",
              context: context),
          spaceBetweenWidgets(MediaQuery.of(context).size.height),
          Row(
            textDirection: languages.getMyLanguages() == 'EN'
                ? TextDirection.ltr
                : TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textProvider.doYouHaveAnAccountOrNot,
                style: TextStyle(
                    fontSize: 12.0.sp,
                    color: ThemeService().getThemeMode() == ThemeMode.light
                        ? Colors.grey
                        : Colors.black54),
              ),
              InkWell(
                onTap: () {
                  print(textProvider.signUpOrSignIn);
                  if (textProvider.signUpOrSignIn == "Sign In" ||
                      textProvider.signUpOrSignIn == 'تسجيل الدخول') {
                    print("all good");
                    textProvider.NewUser();
                  } else if (textProvider.signUpOrSignIn == "Sign Up" ||
                      textProvider.signUpOrSignIn == 'اشترك الآن') {
                    textProvider.oldUser();
                  } else
                    print("hahahahahahaaa");
                },
                child: Text(
                  " ${textProvider.signUpOrSignInClick}",
                  style: TextStyle(color: Colors.blue, fontSize: 12.0.sp),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget appButtons(
    {required String color,
    required String text,
    required String image,
    required String type,
    required BuildContext context}) {
  var textProvider = Provider.of<TextProvider>(context);
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(HexColor(color)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)))),
      onPressed: () {
        if (type == "google") {
          print("what");
          FirebaseController().signInwithGoogle();
        } else if (type == "faceBook") {
        } else if (type == "Email") {
          if (textProvider.signUpOrSignIn == "Sign Up" ||
              textProvider.signUpOrSignIn == 'اشترك الآن') {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogSignUp();
                });
          } else if (textProvider.signUpOrSignIn == "Sign In" ||
              textProvider.signUpOrSignIn == 'تسجيل الدخول') {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const DialogSignIn();
                });
          } else
            return;
        }
      },
      child: SizedBox(
        height: 6.0.h,
        width: double.infinity,
        child: Row(
            textDirection: languages.getMyLanguages() == 'EN'
                ? TextDirection.ltr
                : TextDirection.rtl,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 15.0.sp,
                  color: Colors.white,
                )),
              ),
              const SizedBox(
                width: 5,
              ),
              const Spacer(),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Image.asset(
                    image,
                    width: 30,
                    height: 30,
                  )),
            ]),
      ));
}

Widget spaceBetweenWidgets(double size) {
  if (size < 600) {
    return SizedBox(
      height: 2.0.h,
    );
  } else {
    return SizedBox(
      height: 5.0.h,
    );
  }
}
