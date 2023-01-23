import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import '../../View/admin_pages/crud_operations.dart';
import '../../main.dart';
import '../../../view_model/theme_service.dart';
import '../../view_model/admin_firebase_crud.dart';


class CreateQuiz extends StatefulWidget {
  String category;

  CreateQuiz({Key? key, required this.category}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  TextEditingController addQuestionField = TextEditingController();
  TextEditingController addAnswerCorrectField = TextEditingController();
  TextEditingController addAnswerTwoField = TextEditingController();
  TextEditingController addAnswerThreeField = TextEditingController();
  TextEditingController addAnswerFourField = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
            ? Colors.white
            : Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        shadowColor: Colors.black,
        centerTitle: true,
        title: Row(children: [
          SizedBox(width: 13.w),
          const Text("Create New Quiz", style: TextStyle(color: Colors.black)),
          SizedBox(width: 2.w),
          const Icon(Icons.add, color: Colors.black),
        ]),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CRUDPage(categoryName: widget.category)));
          },
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 15, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Write New Question",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 15,
                    color: ThemeService().getThemeMode() == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                  ))),
              Form(
                key: _formKey,
                child: Column(
                  children: [],
                ),
              ),
              const SizedBox(height: 15),
              myAddTextFieldQuestion(
                  10, addQuestionField, "Enter New Question Here.."),
              const SizedBox(height: 20),
              const Divider(thickness: 1, height: 12, color: Colors.grey),
              const SizedBox(height: 15),
              Text("Write Four Answers For This Question",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 15,
                    color: ThemeService().getThemeMode() == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                  ))),
              const SizedBox(height: 10),
              myAddTextFieldAnswer(
                  1, addAnswerCorrectField, "Enter The Correct Answer Here.."),
              const SizedBox(height: 10),
              myAddTextFieldAnswerTwo(
                  1, addAnswerTwoField, "Enter The Second Answer Here.."),
              const SizedBox(height: 10),
              myAddTextFieldAnswerThree(
                  1, addAnswerThreeField, "Enter The Third Answer Here.."),
              const SizedBox(height: 10),
              myAddTextFieldAnswerFour(
                  1, addAnswerFourField, "Enter The Fourth Answer Here.."),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ThemeService().getThemeMode() == ThemeMode.light
                            ? HexColor("#192A51")
                            : HexColor("#849ED9"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var response = await FirebaseCrud.addElement(
                      elementCategory: widget.category.toString(),
                      elementQuestion: addQuestionField.text,
                      elementsCorrectAnswer: addAnswerCorrectField.text,
                      elementAnswerTwo: addAnswerTwoField.text,
                      elementAnswerThree: addAnswerThreeField.text,
                      elementAnswerFour: addAnswerFourField.text,
                    );

                    if (response.code != 200) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(response.message.toString()),
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(response.message.toString()),
                            );
                          });
                    }
                  }
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>  CRUDPage(categoryName: widget.category)
                  //     ));
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    languages.feedbackSubmit(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 15.sp,
                    )),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CRUDPage(categoryName: widget.category)));
                    // Navigator.of(context).pop();
                  },
                  child: Text(
                    languages.profileCancelChanges(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: ThemeService().getThemeMode() == ThemeMode.light
                          ? HexColor("#B90000")
                          : Colors.redAccent,
                      fontSize: 14.sp,
                    )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

Widget myAddTextFieldQuestion(
    int maxValue, TextEditingController myController, String myMessage) {
  return TextFormField(
    controller: myController,
    keyboardType: TextInputType.multiline,
    minLines: maxValue,
    maxLines: null,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      hintText: myMessage,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              width: 2),
          borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              width: 2),
          borderRadius: BorderRadius.circular(20)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
          borderRadius: BorderRadius.circular(20)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
          borderRadius: BorderRadius.circular(20)),
    ),
  );
}

Widget myAddTextFieldAnswer(
    int maxValue, TextEditingController myController, String myMessage) {
  return TextFormField(
    controller: myController,
    keyboardType: TextInputType.multiline,
    minLines: maxValue,
    maxLines: null,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      hintText: myMessage,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              width: 2),
          borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              width: 2),
          borderRadius: BorderRadius.circular(20)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
          borderRadius: BorderRadius.circular(20)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
          borderRadius: BorderRadius.circular(20)),
    ),
  );
}

Widget myAddTextFieldAnswerTwo(
    int maxValue, TextEditingController myController, String myMessage) {
  return TextFormField(
    controller: myController,
    keyboardType: TextInputType.multiline,
    minLines: maxValue,
    maxLines: null,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      hintText: myMessage,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              width: 2),
          borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              width: 2),
          borderRadius: BorderRadius.circular(20)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
          borderRadius: BorderRadius.circular(20)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
          borderRadius: BorderRadius.circular(20)),
    ),
  );
}

Widget myAddTextFieldAnswerThree(
    int maxValue, TextEditingController myController, String myMessage) {
  return TextFormField(
    controller: myController,
    keyboardType: TextInputType.multiline,
    minLines: maxValue,
    maxLines: null,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      hintText: myMessage,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              width: 2),
          borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              width: 2),
          borderRadius: BorderRadius.circular(20)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
          borderRadius: BorderRadius.circular(20)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
          borderRadius: BorderRadius.circular(20)),
    ),
  );
}

Widget myAddTextFieldAnswerFour(
    int maxValue, TextEditingController myController, String myMessage) {
  return TextFormField(
    controller: myController,
    keyboardType: TextInputType.multiline,
    minLines: maxValue,
    maxLines: null,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      hintText: myMessage,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              width: 2),
          borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
              width: 2),
          borderRadius: BorderRadius.circular(20)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
          borderRadius: BorderRadius.circular(20)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ThemeService().getThemeMode() == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
          borderRadius: BorderRadius.circular(20)),
    ),
  );
}
