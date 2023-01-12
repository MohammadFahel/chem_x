// ignore_for_file: non_constant_identifier_names

import 'package:chem_x/view/admin_pages/read_quizzes.dart';
import 'package:chem_x/view/admin_pages/update_quiz.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../View/quizzes_pages/quiz_category_page.dart';
import '../../controller/theme_service.dart';
import '../../main.dart';
import '../quizzes_pages/quiz_home_page.dart';
import 'create_quiz.dart';
import 'crud_operations.dart';
//
// dynamic dropDownValues = 'metalloid';
//
// class CRUDOperations extends StatefulWidget {
//   const CRUDOperations({Key? key}) : super(key: key);
//
//   @override
//   State<CRUDOperations> createState() => _CRUDOperationsState();
// }
//
// class _CRUDOperationsState extends State<CRUDOperations> {
//   final dropDownListItems = [
//     'metalloid',
//     'actinide',
//     'alkaline earth metal',
//     'diatomic nonmetal',
//     'unknown, probably transition metal',
//     'transition metal',
//     'noble gas',
//     'post-transition metal',
//     'lanthanide'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
//             ? Colors.white
//             : Colors.grey,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
//         shadowColor: Colors.black,
//         centerTitle: true,
//         title: const Text(
//           "CRUD Operations",
//           style: TextStyle(color: Colors.black),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         bottom: const PreferredSize(
//           preferredSize: Size.fromHeight(1),
//           child: SizedBox(
//             height: 1,
//           ),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //         builder: (context) => const CRUDOperations()));
//               },
//               icon: const Icon(Icons.add), color: Colors.black, iconSize: 30),
//         ],
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             children: [
//               SizedBox(height: 10.h),
//               Text("Choose Category You To Apply",
//                   style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                     fontSize: 15,
//                     color: ThemeService().getThemeMode() == ThemeMode.light
//                         ? Colors.black
//                         : Colors.white,
//                   ))),
//               //SizedBox(height: 5.h),
//               GridView.count(
//                 crossAxisCount: 2,
//                 padding: EdgeInsets.zero,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20,
//                 children: [
//                   elementInsideGridForQuizzes(
//                       "#85CAC4", "Alkali metals", context, "alkali metal"),
//                   elementInsideGridForQuizzes(
//                       "#8C692B", "Metalloids", context, "metalloid"),
//                   elementInsideGridForQuizzes(
//                       "#8C4D2D", "Actinides", context, "actinide"),
//                   elementInsideGridForQuizzes("#622E39", "Alkaline earth metals", context,
//                       "alkaline earth metal"),
//                   elementInsideGridForQuizzes(
//                       "#2A4165", "Reactive nonmetals", context, "diatomic nonmetal"),
//                   elementInsideGridForQuizzes("#46474C", "Unknown properties", context,
//                       "unknown, probably transition metal"),
//                   elementInsideGridForQuizzes(
//                       "#433C65", "Transition metals", context, "transition metal"),
//                   elementInsideGridForQuizzes(
//                       "#934356", "Noble gases", context, "noble gas"),
//                   elementInsideGridForQuizzes("#2F4D47", "Post transition metals",
//                       context, "post-transition metal"),
//                   elementInsideGridForQuizzes(
//                       "#004A77", "Lanthanides", context, "lanthanide"),
//                 ],
//               ),
//               // DropdownButton(
//               //   dropdownColor: Colors.grey.shade200,
//               //     value: dropDownValues,
//               //     iconSize: 30,
//               //     elevation: 1,
//               //     borderRadius: BorderRadius.circular(18.0),
//               //     isExpanded: true,
//               //     items: [
//               //       'metalloid',
//               //       'actinide',
//               //       'alkaline earth metal',
//               //       'diatomic nonmetal',
//               //       'unknown, probably transition metal',
//               //       'transition metal',
//               //       'noble gas',
//               //       'post-transition metal',
//               //       'lanthanide'
//               //     ]
//               //         .map((dynamic value) => DropdownMenuItem(
//               //               value: value,
//               //               child: Text(value,
//               //                   style: GoogleFonts.poppins(
//               //                       textStyle: TextStyle(
//               //                     fontSize: 15,
//               //                     color: ThemeService().getThemeMode() ==
//               //                             ThemeMode.light
//               //                         ? Colors.black
//               //                         : Colors.white,
//               //                   ))),
//               //             ))
//               //         .toList(),
//               //     onChanged: (newMenu) {
//               //       setState(() {
//               //         dropDownValues = newMenu!;
//               //       });
//               //     }),
//               SizedBox(height: 3.h),
//
//               //ViewAllQuizzes(context, 10),
//               //quizzesCategory(context)
//             ],
//           ),
//         ),
//     );
//   }
//
//   ViewAllQuizzes(BuildContext context, int index1){
//     return FutureBuilder(
//         future: readJson(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             var list = snapshot.data as Map;
//             List myList = list["myelements"];
//             List myList2 =
//             myList.where((user) => user["category"] == dropDownValues).toList();
//             return ListView.builder(
//               itemCount: myList2.length,
//               itemBuilder: (BuildContext context, int index) {
//                 index = index+1;
//                 return ListTile(
//                     leading: const Icon(Icons.remove_red_eye),
//                     trailing: const Text(
//                       "View Question",
//                       style: TextStyle(color: Colors.green, fontSize: 15),
//                     ),
//                     title: Text("Question Number $index"));
//               },
//
//             );
//           } else {
//             return CircularProgressIndicator();
//           }
//         }
//     );
//   }
//
//   singleQuizeView(){
//
//   }
// }
//
// // Widget quizzesCategory(BuildContext context) {
// //   return Expanded(
// //     child: GridView.count(
// //       crossAxisCount: 2,
// //       padding: EdgeInsets.zero,
// //       crossAxisSpacing: 15,
// //       mainAxisSpacing: 15,
// //       children: [
// //         elementInsideGridForQuizzes("#85CAC4", "Create New Quiz", context),
// //         elementInsideGridForQuizzes("#004A77", "Read All Quizzes", context),
// //         elementInsideGridForQuizzes("#004A77", "Update Quiz", context),
// //         elementInsideGridForQuizzes("#85CAC4", "Delete Quiz", context),
// //       ],
// //     ),
// //   );
// // }
//
// Widget elementInsideGridForQuizzes(
//     String color, String name, BuildContext context, String category) {
//   return InkWell(
//     onTap: () => {
//       // Navigator.push(
//       //     context,
//       //     MaterialPageRoute(
//       //         builder: (context) => QuizzesPage(
//       //           categoryName: category,
//       //         ))
//       // )
//     },
//     child: Container(
//       alignment: Alignment.center,
//       width: 10.w,
//       height: 10.h,
//       decoration: BoxDecoration(
//           color: HexColor(color), borderRadius: BorderRadius.circular(20)),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Text(
//           name,
//           style: GoogleFonts.poppins(
//               textStyle: TextStyle(
//                 color: Colors.white,
//                 fontSize: 15.0.sp,
//               )),
//         ),
//       ),
//     ),
//   );
// }
//
//
//
//
// // Widget elementInsideGridForQuizzes(
// //     String color, String name, BuildContext context) {
// //   return InkWell(
// //     onTap: () => {
// //       if (name == 'Create New Quiz')
// //         {
// //           Navigator.push(context,
// //               MaterialPageRoute(builder: (context) => const CreateQuiz()))
// //         }
// //       else if (name == 'Read All Quizzes')
// //         {
// //           Navigator.push(context,
// //               MaterialPageRoute(builder: (context) => const ReadQuizzes()))
// //         }
// //       else if (name == 'Update Quiz')
// //         {
// //           Navigator.push(context,
// //               MaterialPageRoute(builder: (context) => const UpdateQuiz()))
// //         }
// //       else if (name == 'Delete Quiz')
// //         {
// //           Navigator.push(context,
// //               MaterialPageRoute(builder: (context) => const DeleteQuiz()))
// //         }
// //
// //       // Navigator.push(
// //       //     context,
// //       //     MaterialPageRoute(
// //       //         builder: (context) => QuizzesPage(
// //       //           categoryName: category,
// //       //         )))
// //     },
// //     child: Container(
// //       alignment: Alignment.center,
// //       width: 10,
// //       height: 10,
// //       decoration: BoxDecoration(
// //           color: HexColor(color), borderRadius: BorderRadius.circular(20)),
// //       child: Padding(
// //         padding: const EdgeInsets.all(10.0),
// //         child: Text(name,
// //             style: GoogleFonts.poppins(
// //                 textStyle: const TextStyle(fontSize: 15, color: Colors.white))),
// //       ),
// //     ),
// //   );
// // }
//


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
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Image.asset("assets/images/flask.png",color: Colors.black)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
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
