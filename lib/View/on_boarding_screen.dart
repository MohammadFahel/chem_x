import 'package:chem_x/View/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({Key? key}) : super(key: key);

  @override
  _OnBoardingScreen1State createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: HexColor("#FFFFFF")
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Image.asset("assets/images/onBoardingImage1.png"),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Feeling lost learning\nthe periodic table of\nchemistry?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 25.sp, color: HexColor("#0E131F")))),
                SizedBox(
                  height: 2.0.h,
                ),
                Text("Sometimes it might get\noverwhelming...",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15.0.sp, color: HexColor("#494949")))),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(HexColor("#192A51")),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OnBoardingScreen2()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 6.h,
                    width: 20.w,
                    child:
                    Text(
                      "Next",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15.0.sp,
                            color: Colors.white,
                          )),
                    ), // <-- Text
                  ),
                ),
                TextButton(
                    onPressed:(){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyApp()));
                    },
                    child: Text('Skip',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15.0.sp,
                            color: HexColor("#545454") ,
                          )),
                    )),
              ],
            ),



          ],
        ),
      ),
    );
  }
}


class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  _OnBoardingScreen2State createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: HexColor("#FFFFFF")
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/onBoardingImage2.png"),
            Text("We got you covered!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 25.sp, color: HexColor("#0E131F")))),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 18.sp, color: HexColor("#0E131F"))),
                      children: [
                        TextSpan(text: "With "),
                        TextSpan(text: "ChemX", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: " you can:")
                      ]
                  ),
                  ),
                  // Text("With ChemX you can:",
                  //     textAlign: TextAlign.center,
                  //     style: GoogleFonts.poppins(
                  //         textStyle: TextStyle(
                  //             fontSize: 18.sp, color: HexColor("#0E131F")))),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 7.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: HexColor("#AAA1C8"),
                          border: Border.all(width: 10.w,color: HexColor("#AAA1C8")),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Text("View and learn the different\nelements in the periodic table",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 12.sp, color: HexColor("#0E131F")))),
                    ],
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 7.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: HexColor("#AAA1C8"),
                          border: Border.all(width: 10.w,color: HexColor("#AAA1C8")),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Text("Solve quizzes to better understand the\nmaterials and test your knowledge",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 12.sp, color: HexColor("#0E131F")))),
                    ],
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 7.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: HexColor("#AAA1C8"),
                          border: Border.all(width: 10.w,color: HexColor("#AAA1C8")),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Text("Have fun!",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 12.sp, color: HexColor("#0E131F")))),
                    ],
                  ),

                ],
              ),
            ),


            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(HexColor("#192A51")),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyApp()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 6.0.h,
                width: 35.w,
                child:
                Text(
                  "Start Learning",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 15.0.sp,
                        color: Colors.white,
                      )),
                ), // <-- Text
              ),
            ),

          ],
        ),
      ),
    );
  }
}

