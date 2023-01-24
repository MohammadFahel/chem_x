import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:chem_x/view/quizzes_pages/quiz_QuestionViewResutls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../view_model/chem_provider.dart';
import 'dialog_are_you_sure_you_want_to_get_out.dart';


class QuizzesExamView extends StatefulWidget {
  String category;

  QuizzesExamView({
    required this.category,
  });

  @override
  _QuizzesExamState createState() => _QuizzesExamState();
}

class _QuizzesExamState extends State<QuizzesExamView>
    with SingleTickerProviderStateMixin {
  var textProvider;
  late PageController pageController;
  late AnimationController _controller;
  var providerChem;
  var providerToGetinfoToDispose;

  void initState() {
    super.initState();
    pageController = PageController();
    _controller = AnimationController(
      duration: const Duration(seconds: 120),
      vsync: this,
    );
    textProvider = Provider.of<TextProvider>(context, listen: false)
        .currentPageForExamPage = 0;
    providerChem = Provider.of<TextProvider>(context, listen: false)
        .isPressedButtonInQuizPageForA = false;
    providerChem = Provider.of<TextProvider>(context, listen: false)
        .isPressedButtonInQuizPageForB = false;
    providerChem = Provider.of<TextProvider>(context, listen: false)
        .isPressedButtonInQuizPageForC = false;
    providerChem = Provider.of<TextProvider>(context, listen: false)
        .isPressedButtonInQuizPageForD = false;
    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    providerToGetinfoToDispose =
        Provider.of<TextProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
_controller.dispose();
    pageController.dispose();
    super.dispose();
  }

  int x = Random().nextInt(118 - 0) + 0;

  Future<bool> _onBackPressed() async {
    final backButtonProvider =
    Provider.of<TextProvider>(context, listen: false);
    if (!backButtonProvider.onBackspacePressed) {
      return Future.value(false);
    }

    return showPopUpInExam(widget.category, context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return  Scaffold(
          // appBar: AppBar(
          //   leading: IconButton(
          //     icon: Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.black,
          //       size: 30,
          //     ),
          //     onPressed: () => Navigator.pop(context),
          //   ),
          //   // centerTitle: true,
          //   backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
          //       ? Colors.white
          //       : Colors.grey.shade500,
          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          //   shadowColor: Colors.black,
          //   // elevation: 0.0,
          //   // title: Container(
          //   //   width: 5.5.w,
          //   //   height: 4.h,
          //   //   child: Image.asset("assets/images/flask.png"
          //   //     ,fit: BoxFit.fill,)),
          // ),
            body:
            //     GestureDetector(
            //     onTap: () {
            //   FocusScope.of(context).requestFocus(new FocusNode());
            // },
            // child:
            examsPages(widget.category, pageController, context,
                _controller, x));
  }
}

Future<void> readJson() async {
  // Read the file
  final String response =
  await rootBundle.loadString("assets/data/quizzesData.json");
  final data = await json.decode(response);
  // Parse the JSON string into a dart object
  return data;
}

Widget examsPages(
    String category,
    PageController pageController,
    BuildContext context,
    AnimationController _controller,

    int x) {
  var textProvider = Provider.of<TextProvider>(context, listen: false);
  return Consumer<TextProvider>(
  builder: (context,data,child) {
          return Padding(
            padding: EdgeInsets.only(top: 10.h, right: 2.w, left: 2.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                      Consumer<TextProvider>(builder: (context, myData, child) {
                        return Container(
                          alignment: Alignment.center,
                          height: 5.5.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: myData.userData["trueAnswers"]["question${myData.currentPageForExamPage}"] !=null &&
                                  myData.userData["trueAnswers"]["question${myData.currentPageForExamPage}"] != false? HexColor("#B3FBB6"):Colors.red,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Question ${myData.currentPageForExamPage + 1}",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 15.0.sp,
                                )),
                          ),
                        );
                      }),

                  SizedBox(
                    height: 1.w,
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  Expanded(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (num) {
                        textProvider.onPageExamChanged(num);
                      },
                      controller: pageController,
                      children: [
                      QuizView(
                      category: category,
                      summary: data.userData[category]["question0"],
                      index: 1,
                      name: data.userData[category]["rightAnswer0"],
                      options: [
                        data.userData[category]["options0"][0],
                        data.userData[category]["options0"][1],
                        data.userData[category]["options0"][2],
                        data.userData[category]["options0"][3],
                      ],
                      pageController: pageController,
                      currentPage: 0,
                    ),
                        data.userData[category]["question1"] != null ?
                        QuizView(
                          category: category,
                          summary: data.userData[category]["question1"],
                          index: 1,
                          name: data.userData[category]["rightAnswer1"],
                          options: [
                            data.userData[category]["options1"][0],
                            data.userData[category]["options1"][1],
                            data.userData[category]["options1"][2],
                            data.userData[category]["options1"][3],
                          ],
                          pageController: pageController,
                          currentPage: 1,
                        ) : const Center(
                          child: Text("You didn't answer this question",
                            style: TextStyle(fontSize: 20),),
                        ), // second quiz page
                        data.userData[category]["question2"] != null ?
                        QuizView(
                          category: category,
                          summary: data.userData[category]["question2"],
                          index: 1,
                          name: data.userData[category]["rightAnswer2"],
                          options: [
                            data.userData[category]["options2"][0],
                            data.userData[category]["options2"][1],
                            data.userData[category]["options2"][2],
                            data.userData[category]["options2"][3],
                          ],
                          pageController: pageController,
                          currentPage: 2,
                        ) : const Center(
                          child: Text("You didn't answer this question",
                            style: TextStyle(fontSize: 20),),
                        ), //
                        data.userData[category]["question3"] != null ?
                        QuizView(
                          category: category,
                          summary: data.userData[category]["question3"],
                          index: 1,
                          name: data.userData[category]["rightAnswer3"],
                          options: [
                            data.userData[category]["options3"][0],
                            data.userData[category]["options3"][1],
                            data.userData[category]["options3"][2],
                            data.userData[category]["options3"][3],
                          ],
                          pageController: pageController,
                          currentPage: 3,
                        ) : const Center(
                          child: Text("You didn't answer this question",
                            style: TextStyle(fontSize: 20),),
                        ),
                        data.userData[category]["question4"] != null ?
                        QuizView(
                          category: category,
                          summary: data.userData[category]["question4"],
                          index: 1,
                          name: data.userData[category]["rightAnswer4"],
                          options: [
                            data.userData[category]["options4"][0],
                            data.userData[category]["options4"][1],
                            data.userData[category]["options4"][2],
                            data.userData[category]["options4"][3],
                          ],
                          pageController: pageController,
                          currentPage: 4,
                        ) : const Center(
                          child: Text("You didn't answer this question",
                            style: TextStyle(fontSize: 20),),
                        ),
                        data.userData[category]["question5"] != null ?
                        QuizView(
                          category: category,
                          summary: data.userData[category]["question5"],
                          index: 1,
                          name: data.userData[category]["rightAnswer5"],
                          options: [
                            data.userData[category]["options5"][0],
                            data.userData[category]["options5"][1],
                            data.userData[category]["options5"][2],
                            data.userData[category]["options5"][3],
                          ],
                          pageController: pageController,
                          currentPage: 5,
                        ) : const Center(
                          child: Text("You didn't answer this question",
                            style: TextStyle(fontSize: 20),),
                        ), //// third quiz page
                      ],
                    ),
                  ),
                ]),
          );
        });


}
