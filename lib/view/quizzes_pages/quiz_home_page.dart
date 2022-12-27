import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chem_x/view/quizzes_pages/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class QuizzesPage extends StatefulWidget {
  String categoryName;
   QuizzesPage({Key? key,required this.categoryName}) : super(key: key);

  @override
  _QuizzesPageState createState() => _QuizzesPageState(categoryName);
}

class _QuizzesPageState extends State<QuizzesPage> {
  String categoryName;
_QuizzesPageState(this.categoryName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

             Padding(
               padding: const EdgeInsets.only(bottom: 5,top: 10),
               child: Container(
                   width: 5.5.w,
                   height: 4.h,
                   child: Image.asset("assets/images/flask.png"
                   ,fit: BoxFit.fill,)),
             ),

            Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: Text(
                "Quizzes",
                style: TextStyle(fontSize: 12.sp,color: HexColor("#778198")),
              ),
            ),


     Divider(color: Colors.grey,thickness: 2,),
            SizedBox(
              height: 1.5.h,
            ),
            QuizzesList(categoryName)

          ],
        ),
      ),
    );
  }
}

Future<void> readJson() async {
  // Read the file
  final String response =
  await rootBundle.loadString("assets/data/quizzesData.json");
  final data = await json.decode(response);
print(data);
  // Parse the JSON string into a dart object
  return data;
}
Widget QuizzesList(String category){

  return FutureBuilder(
    future: readJson() ,
    builder: (context, snapshot) {
      // print(snapshot.data);
if(snapshot.hasData){
  var list=snapshot.data as Map;
  List myList=list["myelements"];

  List myList2=myList.where((user) => user["category"]== category).toList();
print(myList[0]["category"]);

  // print(myList2[0][0]["category"]);
  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      padding: EdgeInsets.zero,
        itemCount: myList2.length ,
        itemBuilder: (context, index) {
          return MaterialButton(onPressed: ()=> Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Quiz(summary: myList2[index]["summary"], index: index,
                name:  myList2[index]["name"], options: [myList2[index]["name"],myList[Random().nextInt(118 - 0) + 0]["name"]
                ,myList[Random().nextInt(118 - 0) + 0]["name"],myList[Random().nextInt(118 - 0) + 0]["name"]])),
          ),
          child: elementForListQuizzes(index),);

    }),
  );
}else{
  return const CircularProgressIndicator();
}
    });


}
Widget elementForListQuizzes(int index){
  return Container(
    alignment: Alignment.center,
    height:8.h,
    width: 15.w,
    decoration: BoxDecoration(

      color: HexColor("#D9D9D9"),
        border: Border.all(
          color: HexColor("#5181FB"),
          width: 2,
        ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child:
    // Row(
    //   children: [
        Text(" Quiz ${index+1}",style: TextStyle(color: HexColor("#626262")),),
      //   const Spacer(),
      //    Icon(Icons.arrow_forward_ios_rounded,color: HexColor("#5181FB") ,)
    //   // ],
    // ),
  );
}