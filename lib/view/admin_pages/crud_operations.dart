// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:math';

import 'package:chem_x/view/admin_pages/read_quizzes.dart';
import 'package:chem_x/view/admin_pages/update_quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../View/element_page.dart';
import '../../controller/theme_service.dart';
import '../quizzes_pages/quiz.dart';
import '../quizzes_pages/quiz_category_page.dart';
import 'admin_select_category.dart';
import 'create_quiz.dart';
import 'package:chem_x/view/home_page.dart' as colors;

class CRUDPage extends StatefulWidget {
  String categoryName;

  CRUDPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  _CRUDPageState createState() => _CRUDPageState();
}

class _CRUDPageState extends State<CRUDPage> {
  String myColor = "#00000";
  List<dynamic> _itemsToDesplay = [];
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
          title: Text("Quizzes for ${widget.categoryName}",
              style: const TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateQuiz()));
                },
                icon: const Icon(Icons.add),
                color: Colors.black,
                iconSize: 30),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: FutureBuilder(
              future: readJson(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var list = snapshot.data as Map;
                  List myList = list["myelements"];
                  List myList2 = myList
                      .where((user) => user["category"] == widget.categoryName)
                      .toList();
                  return ListView.separated(
                    itemCount: myList2.length,
                    itemBuilder: (BuildContext context, int index) {
                      String elementName = myList2[index]["name"];
                      return ListTile(
                          leading: viewElementDesgin(myList2, index),
                          trailing: myPopUpMenuWidget(myList2, index, context),
                          title: Text("This quiz for $elementName element"));
                    }, separatorBuilder: (BuildContext context, int index) { return const Divider(thickness: 1, height: 10, color: Colors.grey); },
                  );
                }else{
                  return CircularProgressIndicator();
                }
              }),
        )
    );
  }

  myPopUpMenuWidget(List myNewList, int count, BuildContext context) {
    return PopupMenuButton(itemBuilder: (context) {
      return [
        PopupMenuItem<int>(
            value: 0,
            child: Row(
              children: [
                Icon(Icons.remove_red_eye),
                SizedBox(width: 5),
                Text("View"),
              ],
            )),
        PopupMenuItem<int>(
            value: 1,
            child: Row(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 5),
                Text("Edit"),
              ],
            )),
        PopupMenuItem<int>(
          value: 2,
          child: Row(
            children: [Icon(Icons.delete), SizedBox(width: 5), Text("Delete")],
          ),
        ),
      ];
    }, onSelected: (value) {
      if (value == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReadQuizzes(
                      summary: myNewList[count]["summary"],
                      name: myNewList[count]["name"],
                    )));
      } else if (value == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UpdateQuiz(
                  summary: myNewList[count]["summary"],
                  name: myNewList[count]["name"],
                )));

        print("Edit Quizzzzzzzz.");
      } else if (value == 2) {
        setState(() {
          myNewList.removeAt(count);
        });
      }
    });
  }

  viewElementDesgin(List myList2, int count){
      myColor = "#00000";
      switch (myList2[count]["category"]) {
        case "noble gas":
          myColor = colors.noble_gases;
          break;
        case "diatomic nonmetal":
          myColor = colors.reactive_nonmetals;
          break;
        case "polyatomic nonmetal":
          myColor = colors.reactive_nonmetals;
          break;
        case "metalloid":
          myColor = colors.metalloids;
          break;
        case "post-transition metal":
          myColor = colors.post_transition_metals;
          break;
        case "unknown, probably transition metal":
          myColor = colors.unknown_properties;
          break;
        case "alkali metal":
          myColor = colors.alkali_metals;
          break;
        case "alkaline earth metal":
          myColor = colors.alkaline_earth_metals;
          break;
        case "transition metal":
          myColor = colors.transition_metals;
          break;
        case "actinide":
          myColor = colors.actinides;
          break;
        case "lanthanide":
          myColor = colors.lanthanides;
          break;
      }
      return GestureDetector(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ElementPage(
          //         atomicMass: myList2[count]["atomic_mass"] ==
          //             null
          //             ? 0.0
          //             : myList2[count]["atomic_mass"].toDouble(),
          //         appearance: myList2[count]["appearance"] ?? "",
          //         boil: myList2[count]["boil"] == null
          //             ? 0.0
          //             : myList2[count]["boil"].toDouble(),
          //         category: myList2[count]["category"] ?? "",
          //         density: myList2[count]["density"] == null
          //             ? 0.0
          //             : myList2[count]["density"].toDouble(),
          //         discoveredBy:
          //         myList2[count]["discovered_by"] ?? "",
          //         melt: myList2[count]["melt"] == null
          //             ? 0.0
          //             : myList2[count]["melt"].toDouble(),
          //         molarHeat: myList2[count]["molar_heat"] == null
          //             ? 0.0
          //             : myList2[count]["molar_heat"].toDouble(),
          //         namedBy: myList2[count]["named_by"] ?? "",
          //         number: myList2[count]["number"] ?? 0,
          //         period: myList2[count]["period"] ?? 0,
          //         phase: myList2[count]["phase"] ?? 0,
          //         summary: myList2[count]["summary"] ?? "",
          //         myColor: colors.unknown_properties,
          //         symbol: myList2[count]["symbol"] ?? "",
          //         name: myList2[count]["name"],
          //       ),
          //     ));
        },
        child: Container(
          height: 50,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: HexColor(myColor), width: 1.5),
            color: HexColor(myColor),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                HexColor(myColor).withOpacity(0.9),
                HexColor(myColor).withOpacity(0.6)
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${myList2[count]["number"]}",
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Text(myList2[count]["symbol"],
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text(myList2[count]['name'],
                  style: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ),
      );
  }
}
