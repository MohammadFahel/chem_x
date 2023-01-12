import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/theme_service.dart';
import '../../main.dart';

final addQuestionController = TextEditingController();
TextEditingController addQuestionField = TextEditingController();
final addAnswerController = TextEditingController();
TextEditingController addAnswerField = TextEditingController();

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {



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
        title: const Text("Create New Quiz",
          style: TextStyle(color: Colors.black)
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
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
              const SizedBox(height: 15),
              MyTextFieldWidget(14, addQuestionField, "Enter New Question Here.."),
              const SizedBox(height: 20),
              const Divider(thickness: 1, height: 10, color: Colors.grey),
              const SizedBox(height: 15),
              Text("Write The Correct Answer",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: ThemeService().getThemeMode() == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                      ))),
              const SizedBox(height: 15),
              MyTextFieldWidget(1, addAnswerField, "Enter The Correct Message Here.."),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                    ThemeService().getThemeMode() == ThemeMode.light
                        ? HexColor("#192A51")
                        : HexColor("#849ED9"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                onPressed: ()  {

                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    languages.feedbackSubmit(),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 17.5,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget MyTextFieldWidget(int maxValue, TextEditingController myController, String myMessage){
  return TextField(
    controller: myController,
    keyboardType: TextInputType.multiline,
    maxLines: maxValue,
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