import 'dart:convert';
import 'package:chem_x/view/quizzes_pages/quiz_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class QuizDrawerPage extends StatefulWidget {
  const QuizDrawerPage({Key? key}) : super(key: key);

  @override
  _QuizDrawerPageState createState() => _QuizDrawerPageState();
}

class _QuizDrawerPageState extends State<QuizDrawerPage> {

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
            quizzesCategory(context)

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
Widget quizzesCategory(BuildContext context)
{

  return Expanded(
    child: GridView.count(crossAxisCount: 2,
    padding: EdgeInsets.zero,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
    children: [
      elementInsideGridForQuizzes("#85CAC4","alkali_metals",context,"alkali metal"),
      elementInsideGridForQuizzes("#8C692B","metalloids",context,"metalloid"),
      elementInsideGridForQuizzes("#8C4D2D","actinides",context,"actinide"),
      elementInsideGridForQuizzes("#622E39","alkaline_earth_metals",context,"alkaline earth metal"),
      elementInsideGridForQuizzes("#2A4165","reactive_nonmetals",context,"diatomic nonmetal"),
      elementInsideGridForQuizzes("#46474C","unknown_properties",context,"unknown, probably transition metal"),
      elementInsideGridForQuizzes("#433C65","transition_metals",context,"transition metal"),
      elementInsideGridForQuizzes("#934356","noble_gases",context,"noble gas"),
      elementInsideGridForQuizzes("#2F4D47","post_transition_metals",context,"post-transition metal"),
      elementInsideGridForQuizzes("#004A77","lanthanides",context,"lanthanide"),
      // elementInsideGridForQuizzes("#D5C6E0","alkali_metals"),
      // elementInsideGridForQuizzes("#D5C6E0","metalloids"),
      // elementInsideGridForQuizzes("#D5C6E0","actinides"),
      // elementInsideGridForQuizzes("#D5C6E0","alkaline_earth_metals"),
      // elementInsideGridForQuizzes("#D5C6E0","reactive_nonmetals"),
      // elementInsideGridForQuizzes("#D5C6E0","unknown_properties"),
      // elementInsideGridForQuizzes("#D5C6E0","transition_metals"),
      // elementInsideGridForQuizzes("#D5C6E0","noble_gases"),
      // elementInsideGridForQuizzes("#D5C6E0","post_transition_metals"),
      // elementInsideGridForQuizzes("#D5C6E0","lanthanides"),
      // elementInsideGridForQuizzes("#849ED9","alkali_metals"),
      // elementInsideGridForQuizzes("#849ED9","metalloids"),
      // elementInsideGridForQuizzes("#849ED9","actinides"),
      // elementInsideGridForQuizzes("#849ED9","alkaline_earth_metals"),
      // elementInsideGridForQuizzes("#849ED9","reactive_nonmetals"),
      // elementInsideGridForQuizzes("#849ED9","unknown_properties"),
      // elementInsideGridForQuizzes("#849ED9","transition_metals"),
      // elementInsideGridForQuizzes("#849ED9","noble_gases"),
      // elementInsideGridForQuizzes("#849ED9","post_transition_metals"),
      // elementInsideGridForQuizzes("#849ED9","lanthanides"),

    ],),
  );
}
Widget elementInsideGridForQuizzes(String color,String name,BuildContext context,String category){
  return InkWell(
    onTap: ()=>{
      Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizzesPage(categoryName: category,)))
    //   Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) => QuizzesPage()))
    },
    child: Container(
      alignment: Alignment.center,
      width: 10.w,
      height: 10.h,
      decoration: BoxDecoration(
        color: HexColor(color),
borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(name,style:  GoogleFonts.poppins(
            textStyle: TextStyle(
color: Colors.white,
              fontSize: 15.0.sp,
            )),),
      ),) ,


  );

}