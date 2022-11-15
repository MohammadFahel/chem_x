import 'package:chem_x/Controller/auth.dart';
import 'package:chem_x/Controller/text_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<TextProvider>(
      create: (_) => TextProvider(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthO().haundleAuthState(),
        );
      })));
}
// class Odeh extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//   return MaterialApp(
//     home: AuthO().haundleAuthState(),
//   );
//   }
//
// }

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
    print(n++);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/signup_in.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(flex: 2, child: ContainerForSignInAndSignUp(context)),
          ],
        ),
      ),
    );
  }
}

Widget ContainerForSignInAndSignUp(BuildContext context) {
  var text = Provider.of<TextProvider>(context);
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
    child: Padding(
      padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.0.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/chemxlogo.png",
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
          Padding(padding: EdgeInsets.all(10)),

          Container(
            height: 0.2.h,
            width: double.infinity,
            color: Colors.grey,
          ),

          Padding(
            padding: EdgeInsets.only(top: 4.0.h),
            child: Text(
              text.niceToMetyouOrWelcomeBack,
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
              text.signUpOrSignIn,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 15.0.sp,
                color: Colors.grey,
              )),
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
                print("hi");
                AuthO().signInwithGoogle();
                text.loguser();
              },
              child: Container(
                height: 6.0.h,
                width: double.infinity,
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Text(
                    text.google,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 15.0.sp,
                      color: Colors.white,
                    )),
                  ), // <-- Text
                  SizedBox(
                    width: 5,
                  ),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Image.asset(
                        "assets/googlelogo.png",
                        width: 30,
                        height: 30,
                      )),
                ]),
              )),
          //  appButtons(color: "#849ED9", text:text.google , image: "assets/googlelogo.png",type: "google"),
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
                AuthO().signInWithFacebook();
              },
              child: Container(
                height: 6.0.h,
                width: double.infinity,
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Text(
                    text.faceBook,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 15.0.sp,
                      color: Colors.white,
                    )),
                  ), // <-- Text
                  SizedBox(
                    width: 5,
                  ),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Image.asset(
                        "assets/facebooklogo.png",
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
            children: [
              Text(
                "OR ",
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
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
              text: text.email,
              image: "assets/Vector.png",
              type: "Email"),
          spaceBetweenWidgets(MediaQuery.of(context).size.height),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text.doYouHaveAnAccountOrNot,
                style: TextStyle(fontSize: 12.0.sp),
              ),
              InkWell(
                onTap: () {
                  if (text.signUpOrSignIn == "Sign In") {
                    print("all good");
                    text.oldUser();
                  } else if (text.signUpOrSignIn == "Sign Up") {
                    text.NewUser();
                  }
                },
                child: Text(
                  " ${text.signUpOrSignIn}",
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
    required String type}) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(HexColor(color)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)))),
      onPressed: () {
        if (type == "google") {
          print("what");
          AuthO().signInwithGoogle();
        } else if (type == "faceBook") {}
      },
      child: Container(
        height: 6.0.h,
        width: double.infinity,
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          Text(
            text,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
              fontSize: 15.0.sp,
              color: Colors.white,
            )),
          ), // <-- Text
          SizedBox(
            width: 5,
          ),
          Spacer(),
          Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
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
