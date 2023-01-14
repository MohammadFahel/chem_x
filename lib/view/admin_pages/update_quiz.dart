// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/chem_provider.dart';
import '../../Module/single_element_data.dart';
import '../../controller/theme_service.dart';
import '../../main.dart';
import '../quizzes_pages/quiz_category_page.dart';
import 'admin_select_category.dart';


Myelements? updateJson;

class UpdateQuiz extends StatefulWidget {
  String name;
  String summary;

  UpdateQuiz({Key? key, required this.name, required this.summary})
      : super(key: key);

  @override
  _UpdateQuizState createState() => _UpdateQuizState();
}

class _UpdateQuizState extends State<UpdateQuiz> {
  final _summaryKey = GlobalKey<FormFieldState>();
  var _summaryKeyController = TextEditingController();
  final _nameKey = GlobalKey<FormFieldState>();
  var _nameKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
              ? Colors.white
              : Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          shadowColor: Colors.black,
          centerTitle: true,
          title: Row(
              children: [
                SizedBox(width: 15.w),
            const Text("Update Quiz", style: TextStyle(color: Colors.black)),
                SizedBox(width: 2.w),
                const Icon(
                    Icons.edit,
                    color: Colors.black
                ),

          ]),

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
                  "What is the name of this chemical element?",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 15.0.sp,
                  )),
                ),
                SizedBox(
                  height: 5.h,
                ),
                myTextFieldUpdatedWidget(
                    enable: true,
                    initialText: widget.summary,
                    lable: "Change Question",
                    keyy: _summaryKey,
                    validator: ""),
                SizedBox(
                  height: 2.h,
                ),
                myTextFieldUpdatedWidget(
                    enable: true,
                    initialText: widget.name,
                    lable: "Change Answer",
                    keyy: _nameKey,
                    validator: ""),
                SizedBox(
                  height: 5.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ThemeService().getThemeMode() == ThemeMode.light
                              ? HexColor("#192A51")
                              : HexColor("#849ED9"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0))),
                  onPressed: () async {
                    // FutureBuilder(
                    //     future: readJson(),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasData) {
                    //         var list = snapshot.data as Map;
                    //         List myList = list["myelements"];
                    //         List myList2 = myList
                    //             .where((user) => user["category"] == widget.categoryName)
                    //             .toList();
                    //         return null;
                    //       }else{
                    //         return CircularProgressIndicator();
                    //       }
                    //     });
                      Directory appDocDir = await getApplicationDocumentsDirectory();
                      final String response =
                      await rootBundle.loadString("assets/data/quizzesData.json");
                      final data = await json.decode(response);

                      //update
                      final jsonAsString = data;
                      updateJson = Myelements.fromJson(jsonDecode(jsonAsString));
                      updateJson?.name = _nameKey.toString();
                      updateJson?.summary = _summaryKey.toString();
                      data.writeAsStringSync(jsonEncode(updateJson?.toJson()));
                      setState(() {});

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      languages.profileSaveChanges(),
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 15.sp,
                      )),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
        ));
  }

  Widget myTextFieldUpdatedWidget(
      {required String lable,
      GlobalKey<FormFieldState>? keyy,
      required String validator,
      TextEditingController? controller,
      String? initialText,
      required bool enable}) {
    return Directionality(
      textDirection: languages.getMyLanguages() == 'EN'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: TextFormField(
        initialValue: initialText,
        enabled: enable,
        obscureText: validator == "Password" ? true : false,
        controller: controller,
        maxLines: null,
        textInputAction: TextInputAction.done,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
          fontSize: 15.0.sp,
        )),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          label: Text(lable, style: const TextStyle(fontSize: 15)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ThemeService().getThemeMode() == ThemeMode.light
                      ? Colors.black
                      : Colors.white,
                  width: 2),
              borderRadius: BorderRadius.circular(20)),
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
      ),
    );
  }
}
