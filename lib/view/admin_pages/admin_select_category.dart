// ignore_for_file: non_constant_identifier_names

import 'package:chem_x/view/admin_pages/read_quizzes.dart';
import 'package:chem_x/view/admin_pages/update_quiz.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../View/home_page.dart';
import '../../View/quizzes_pages/quiz_category_page.dart';
import '../../controller/theme_service.dart';
import '../../main.dart';
import '../quizzes_pages/quiz_home_page.dart';
import 'create_quiz.dart';
import 'crud_operations.dart';


class CRUDOperations extends StatefulWidget {
  const CRUDOperations({Key? key}) : super(key: key);

  @override
  _CRUDOperationsState createState() => _CRUDOperationsState();
}

class _CRUDOperationsState extends State<CRUDOperations> {
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
        title: Text("Select Category",
          style: TextStyle(fontSize: 14.sp, color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>  PeriodicTablePage()
            //     ));

            Navigator.of(context).pop();
          },
        ),
        actions: [
          Image.asset("assets/images/flask.png",color: Colors.black)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            selectElementsCategory(context)
          ],
        ),
      ),
    );
  }
}

Widget selectElementsCategory(BuildContext context) {
  return Expanded(
    child: GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.zero,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        crudOperationsPage(
            "#85CAC4", "Alkali metals", context, "alkali metal"),
        crudOperationsPage(
            "#8C692B", "Metalloids", context, "metalloid"),
        crudOperationsPage(
            "#8C4D2D", "Actinides", context, "actinide"),
        crudOperationsPage("#622E39", "Alkaline earth metals", context,
            "alkaline earth metal"),
        crudOperationsPage(
            "#2A4165", "Reactive nonmetals", context, "diatomic nonmetal"),
        crudOperationsPage("#46474C", "Unknown properties", context,
            "unknown, probably transition metal"),
        crudOperationsPage(
            "#433C65", "Transition metals", context, "transition metal"),
        crudOperationsPage(
            "#934356", "Noble gases", context, "noble gas"),
        crudOperationsPage("#2F4D47", "Post transition metals",
            context, "post-transition metal"),
        crudOperationsPage(
            "#004A77", "Lanthanides", context, "lanthanide"),
      ],
    ),
  );
}

Widget crudOperationsPage(
    String color, String name, BuildContext context, String category) {
  return InkWell(
    onTap: () => {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>  CRUDPage(categoryName: category)
          ))
    },
    child: Container(
      alignment: Alignment.center,
      width: 10.w,
      height: 10.h,
      decoration: BoxDecoration(
          color: HexColor(color), borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          name,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 15.0.sp,
              )),
        ),
      ),
    ),
  );
}
