
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../view_model/chem_provider.dart';


class QuizView extends StatefulWidget {
  String category;
  String summary;
  int index;
  String name;
  List<String> options;
  PageController pageController;
  int currentPage;

  QuizView(
      {required this.summary,
        required this.index,
        required this.name,
        required this.options,
        required this.pageController,
        required this.currentPage,
        required this.category});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<QuizView> {

  int pointNumber = 0;

  Set<int> numbers = {0, 1, 2, 3};

// Convert the set to a list and shuffle it
  late List<int> shuffledNumbers = numbers.toList()..shuffle();

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    var providerChem = Provider.of<TextProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              widget.summary,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 15.0.sp,
                  )),
            ),
            Text(
              "What is the name of this chemical element?",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 15.0.sp,
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
                          HexColor("#D9D9D9")

                      ),

                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)
                          ,side: BorderSide(width: 3,color: widget.name==widget.options[0]? Colors.green:Colors.red)))),
                  onPressed: () => {

                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor("#192A51"),
                        child: Text(
                          "A",
                          style: TextStyle(color:Colors.white, fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        " " + widget.options[0],
                        style: TextStyle(
                            color: HexColor("#626262"), fontSize: 15.sp),
                      ),
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
                        HexColor("#D9D9D9")

                    ),

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)
                            ,side: BorderSide(width: 3,color: widget.name==widget.options[1]? Colors.green:Colors.red)))),
                onPressed: () => {

                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: HexColor("#192A51"),
                      child: Text(
                        "B",
                        style: TextStyle(color:Colors.white, fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      " " + widget.options[1],
                      style: TextStyle(
                          color: HexColor("#626262"), fontSize: 15.sp),
                    ),
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
                        HexColor("#D9D9D9")

                    ),

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)
                            ,side: BorderSide(width: 3,color: widget.name==widget.options[2]? Colors.green:Colors.red))
                    )),
                onPressed: () => {

                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: HexColor("#192A51"),
                      child: Text(
                        "C",
                        style: TextStyle(color:Colors.white, fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      " " + widget.options[2],
                      style: TextStyle(
                          color: HexColor("#626262"), fontSize: 15.sp),
                    ),
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
                        HexColor("#D9D9D9")

                    ),

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)
                            ,side: BorderSide(width: 3,color: widget.name==widget.options[3]? Colors.green:Colors.red))
                    )),
                onPressed: () => {

                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: HexColor("#192A51"),
                      child: Text(
                        "D",
                        style: TextStyle(color:Colors.white, fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      " " + widget.options[3],
                      style: TextStyle(
                          color: HexColor("#626262"), fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
            ),
            // Spacer(),
            SizedBox(
              height: 2.h,
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: MaterialButton(
                onPressed: () =>
                {
                  if(widget.currentPage==5){
                    Navigator.pop(context)
                  }else
                    widget.pageController.jumpToPage(widget.currentPage + 1),

                },
                child: Container(
                  height: 7.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: HexColor("#D9D9D9"),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: Text(
                        widget.currentPage==5?"Return": "Next Question",
                        style: TextStyle(color: HexColor("#192A51"), fontSize: 15.sp),
                      )

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
