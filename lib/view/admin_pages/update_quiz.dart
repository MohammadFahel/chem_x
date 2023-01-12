import 'package:flutter/material.dart';

import '../../controller/theme_service.dart';
import '../quizzes_pages/quiz_category_page.dart';
import 'admin_select_category.dart';

class UpdateQuiz extends StatefulWidget {
  const UpdateQuiz({Key? key}) : super(key: key);

  @override
  _UpdateQuizState createState() => _UpdateQuizState();
}

class _UpdateQuizState extends State<UpdateQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
            ? Colors.white
            : Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17)),
        shadowColor: Colors.black,
        centerTitle: true,
        title: const Text("Update Quiz",
            style: TextStyle(color: Colors.black)
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder(
          future: readJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var list = snapshot.data as Map;
              List myList = list["myelements"];
              List myList2 =
              myList.where((user) => user["category"] == 8).toList();
              return ListView.builder(
                itemCount: myList2.length,
                itemBuilder: (BuildContext context, int index) {
                  index = index+1;
                  return ListTile(
                      leading: const Icon(Icons.edit),
                      trailing: const Text(
                        "Update Question",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text("Question Number $index"));
                },

              );
            } else {
              return CircularProgressIndicator();
            }
          }
      ),
    );
  }
}
