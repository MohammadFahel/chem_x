
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../Controller/auth.dart';


class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({Key? key}) : super(key: key);
  @override
  _OnBoardingScreen1State createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {

  int _currentPage = 0;
  final PageController _controller = PageController();
  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  _storeOnboardInfo() async{
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('OnBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onChanged,
              controller: _controller,
              children: [
                OnboardingPage1(),
                OnboardingPage2()
              ],
            ),
          ),
          ChangeStateButton()
        ],
      )
    );


  }
  OnboardingPage1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: 2.h),
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
      ],
    );
  }


  OnboardingPage2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: 2.h),
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
                    children: const [
                      TextSpan(text: "With "),
                      TextSpan(text: "ChemX", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: " you can:")
                    ]
                ),
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
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
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
      ],
    );
  }

  ChangeStateButton(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(2, (int index) {
              return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 0.75.h,
                  width: (index == _currentPage) ? 8.h : 3.h,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == _currentPage)
                          ? HexColor("#192A51")
                          : HexColor("#898989")));
            })),
        InkWell(
          onTap: () {
            _storeOnboardInfo();
            print(_currentPage);
            if (_currentPage == 0){
              print("In IF");
              _controller.nextPage(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOutQuint);
            }
            else{
              print("In Else");
              print("just test");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthO().haundleAuthState()),
              );
            }

          },
          child: AnimatedContainer(
              alignment: Alignment.center,
              duration: Duration(milliseconds: 300),
              height: 7.h,
              width: (_currentPage == (2 - 1)) ? 50.w : 40.w,
              decoration: BoxDecoration(
                  color: HexColor("#192A51"),
                  borderRadius: BorderRadius.circular(35)),
              child: (_currentPage == (2 - 1))
                  ? Text(
                "Start Learning",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              )
                  : Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              )
          ),
        ),
        SizedBox(
          height: 5.h,
        )

      ],
    );
  }
}