import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/chem_provider.dart';

class Quiz extends StatefulWidget {
  String summary;
  int index;
  String name;
  List<String> options;

  Quiz(
      {required this.summary,
      required this.index,
      required this.name,
      required this.options});

  @override
  _QuizState createState() => _QuizState(summary, index, name, options);
}

class _QuizState extends State<Quiz> {
  String summary;
  int index;
  String name;
  List<String> options;
  int pointNumber = 0;

  _QuizState(this.summary, this.index, this.name, this.options);
  Set<int> _generatedNumbers = {};


  int _randomNumber() {
    final random = Random();
    int n;
    do {
      n = random.nextInt(4);
    } while (_generatedNumbers.contains(n));
    _generatedNumbers.add(n);
    return n;
  }

  @override
  Widget build(BuildContext context) {
    var providerChem = Provider.of<TextProvider>(context, listen: true);
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,

              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 5.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                        color: HexColor("#B3FBB6"),
                        borderRadius: BorderRadius.
                          circular(5)
                      ),
                      child: Text(
                        "Quiz ${index}",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 15.0.sp,
                        )),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      height: 5.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                          color: HexColor("#F87171"),
                          borderRadius: BorderRadius.
                          circular(5)
                      ),
                      child: Text(
                      "Point $pointNumber/1",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(

                        fontSize: 15.0.sp,
                      )),
                    ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Text(
                  summary,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 13.0.sp,
                  )),
                ),
                Text(
                  "What is the name of this chemical element?",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 13.0.sp,
                  )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 6.5.h,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          providerChem.isPressedButtonInQuizPageForA
                              ? HexColor("#192A51")
                              : HexColor("#D9D9D9"),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: () =>
                        {
                          // providerChem.changeColorOfButtonInQuizPageForTrue("A"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("B"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("C"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("D"),

                        },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: HexColor("#192A51"),
                          child: Text(
                            "A",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          " " + options[_randomNumber()],
                          style: TextStyle(
                              color: HexColor("#626262"), fontSize: 15.sp),
                        ),
                        Spacer(),
                        providerChem.isPressedButtonInQuizPageForA
                            ? IconButton(
                                onPressed: () => {
                                      providerChem
                                          .changeColorOfButtonInQuizPageForFalse(
                                              "A")
                                    },
                                icon: Icon(Icons.close_outlined))
                            : Container()
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 6.5.h,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          providerChem.isPressedButtonInQuizPageForB
                              ? HexColor("#192A51")
                              : HexColor("#D9D9D9"),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: () =>
                        {
                          // providerChem.changeColorOfButtonInQuizPageForTrue("B"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("A"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("C"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("D"),
                          //

                        },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: HexColor("#192A51"),
                          child: Text(
                            "B",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          " " + options[_randomNumber()],
                          style: TextStyle(
                              color: HexColor("#626262"), fontSize: 15.sp),
                        ),
                        Spacer(),
                        providerChem.isPressedButtonInQuizPageForB
                            ? IconButton(
                                onPressed: () => {
                                      providerChem
                                          .changeColorOfButtonInQuizPageForFalse(
                                              "B")
                                    },
                                icon: Icon(Icons.close_outlined))
                            : Container()
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 6.5.h,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          providerChem.isPressedButtonInQuizPageForC
                              ? HexColor("#192A51")
                              : HexColor("#D9D9D9"),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: () =>
                        {
                          //
                          // providerChem.changeColorOfButtonInQuizPageForTrue("C"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("B"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("A"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("D"),
                        },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: HexColor("#192A51"),
                          child: Text(
                            "C",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          " " + options[_randomNumber()],
                          style: TextStyle(
                              color: HexColor("#626262"), fontSize: 15.sp),
                        ),
                        Spacer(),
                        providerChem.isPressedButtonInQuizPageForC
                            ? IconButton(
                                onPressed: () => {
                                      providerChem
                                          .changeColorOfButtonInQuizPageForFalse(
                                              "C")
                                    },
                                icon: Icon(Icons.close_outlined))
                            : Container()
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 6.5.h,
                  child: ElevatedButton(

                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          providerChem.isPressedButtonInQuizPageForD
                              ? HexColor("#192A51")
                              : HexColor("#D9D9D9"),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: () =>
                        {
                          // providerChem.changeColorOfButtonInQuizPageForTrue("D"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("B"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("C"),
                          // providerChem.changeColorOfButtonInQuizPageForFalse("A"),


                        },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: HexColor("#192A51"),
                          child: Text(
                            "D",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          " " + options[_randomNumber()],
                          style: TextStyle(
                              color: HexColor("#626262"), fontSize: 15.sp),
                        ),
                        Spacer(),
                        providerChem.isPressedButtonInQuizPageForD
                            ? IconButton(
                                onPressed: () => {
                                      providerChem
                                          .changeColorOfButtonInQuizPageForFalse(
                                              "D")
                                    },
                                icon: Icon(Icons.close_outlined))
                            : Container()
                      ],
                    ),
                  ),
                ),
               Spacer(),
               SizedBox(height: 2.h,),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    onPressed: () => {},
                    child: Container(
                      height: 7.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor("#D9D9D9"),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Text(
                        "SUBMIT",
                        style: TextStyle(
                            color: HexColor("#192A51"), fontSize: 15.sp),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      );}
    ),
    );
  }
}
