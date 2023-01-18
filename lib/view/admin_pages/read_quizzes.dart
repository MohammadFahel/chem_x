import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/chem_provider.dart';
import '../../controller/theme_service.dart';
import '../quizzes_pages/quiz_category_page.dart';
import 'admin_select_category.dart';

class ReadQuizzes extends StatefulWidget {
  String name;
  String summary;

  ReadQuizzes({Key? key, required this.name, required this.summary})
      : super(key: key);

  @override
  _ReadQuizzesState createState() => _ReadQuizzesState();
}

class _ReadQuizzesState extends State<ReadQuizzes> {
  Set<int> numbers = {0, 1, 2, 3};
  late List<int> shuffledNumbers = numbers.toList()..shuffle();

  @override
  Widget build(BuildContext context) {
    var providerChem = Provider.of<TextProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
              ? Colors.white
              : Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          shadowColor: Colors.black,
          centerTitle: true,
          title: Text("Read Quiz", style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  widget.summary,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 15.0.sp,
                  )),
                ),
                // Text(
                //   "What is the name of this chemical element?",
                //   style: GoogleFonts.poppins(
                //       textStyle: TextStyle(
                //     fontSize: 15.0.sp,
                //   )),
                // ),
                SizedBox(
                  height: 2.h,
                ),
                Consumer<TextProvider>(builder: (context, myData, child) {
                  return SizedBox(
                    height: 6.5.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            myData.isPressedButtonInQuizPageForD
                                ? HexColor("#192A51")
                                : HexColor("#D9D9D9"),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0)))),
                      onPressed: () => {
                        // myData.changeColorOfButtonInQuizPageForTrue("D"),
                        // myData.changeColorOfButtonInQuizPageForFalse("B"),
                        // myData.changeColorOfButtonInQuizPageForFalse("C"),
                        // myData.changeColorOfButtonInQuizPageForFalse("A"),
                        // providerChem.quizAnswer(widget.options[shuffledNumbers[3]]),
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: HexColor("#192A51"),
                            child: Icon(
                              Icons.check_outlined, color: Colors.white,
                            )
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            " " + widget.name,
                            style: TextStyle(
                                color: HexColor("#626262"), fontSize: 15.sp),
                          ),
                          const Spacer(),
                          myData.isPressedButtonInQuizPageForD
                              ? IconButton(
                                  onPressed: () => {
                                        myData
                                            .changeColorOfButtonInQuizPageForFalse(
                                                "D")
                                      },
                                  icon: const Icon(Icons.close_outlined))
                              : Container()
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
