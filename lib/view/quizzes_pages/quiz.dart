
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class Quiz extends StatefulWidget {
  String summary;
  int index;
  String name;
  List<String> options;
   Quiz({required  this.summary,required  this.index,required  this.name,
  required  this.options});

  @override
  _QuizState createState() =>  _QuizState(summary,index,name,options);
}

class _QuizState extends State<Quiz> {
  String summary;
  int index;
  String name;
  List<String> options;
   int pointNumber=0;
  _QuizState(this.summary,this.index,this.name,this.options);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             SizedBox(
               height: 10.h,
             ),
              Row(
                children: [
                  Text("Quiz: ${index}",style: GoogleFonts.poppins(
                      textStyle: TextStyle(

                        fontSize: 15.0.sp,
                      )),),
                  Spacer(),
                  Text("Point: $pointNumber/1",style: GoogleFonts.poppins(
                      textStyle: TextStyle(

                        fontSize: 15.0.sp,
                      )),),
                ],
              ),
              Divider(color: Colors.black,thickness: 2,),
              Text(summary,style: GoogleFonts.poppins(
                  textStyle: TextStyle(

                    fontSize: 13.0.sp,
                  )),),

                Text("What is the name of this chemical element?",style: GoogleFonts.poppins(
                    textStyle: TextStyle(

                      fontSize:13.0.sp,
                    )),),

              Container(
                height: 6.5.h,
                child: ElevatedButton(

                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(  HexColor("#D9D9D9"),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                  onPressed: ()=>{},
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: HexColor("#192A51"),
                      child: Text("A",style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(" "+options[1],style: TextStyle(color: HexColor("#626262"),fontSize: 15.sp),),
                  ],
                ),),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 6.5.h,
                child: ElevatedButton(

                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(  HexColor("#D9D9D9"),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                  onPressed: ()=>{},
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor("#192A51"),
                        child: Text("B",style: TextStyle(color: Colors.white,fontSize: 18.sp),),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(" "+options[0],style: TextStyle(color: HexColor("#626262"),fontSize: 15.sp),),
                    ],
                  ),),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 6.5.h,
                child: ElevatedButton(

                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(  HexColor("#D9D9D9"),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                  onPressed: ()=>{},
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor("#192A51"),
                        child: Text("C",style: TextStyle(color: Colors.white,fontSize: 18.sp),),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(" "+options[3],style: TextStyle(color: HexColor("#626262"),fontSize: 15.sp),),
                    ],
                  ),),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 6.5.h,
                child: ElevatedButton(

                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(  HexColor("#D9D9D9"),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                  onPressed: ()=>{},
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor("#192A51"),
                        child: Text("D",style: TextStyle(color: Colors.white,fontSize: 18.sp),),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(" "+options[2],style: TextStyle(color: HexColor("#626262"),fontSize: 15.sp),),
                    ],
                  ),),
              ),
         SizedBox(
           height: 5.h,
         ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MaterialButton(onPressed: ()=>{},
                child: Container(
                  height: 7.h,
                  width: double.infinity,
                  decoration: BoxDecoration(

                    color: HexColor("#D9D9D9"),

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(child: Text("SUBMIT",style: TextStyle(color: HexColor("#192A51"),fontSize: 15.sp),)),
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

