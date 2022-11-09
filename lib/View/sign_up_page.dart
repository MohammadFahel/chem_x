import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return const MaterialApp(
      home: MyApp(),
    );
  }));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePage();
  }
}

class MyHomePage extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/signup_in.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(flex: 2, child: ContainerForSignInAndSignUp()),
          ],
        ),
      ),
    );
  }
}

Widget ContainerForSignInAndSignUp() {
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
    child: Padding(
      padding:  EdgeInsets.only(left: 10.0.w,right: 10.0.w),
      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 4.0.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/chemxlogo.png",width: 15.0.w,),
                Padding(
                  padding:  EdgeInsets.only(left: 2.0.h,top: 1.0.h),
                  child: Text("ChemX",style:  GoogleFonts.poppins(
                    textStyle:  TextStyle(fontSize: 22.0.sp,color: HexColor("#192A51"),)
                  ),
                    ),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),


              Container(
                height:0.2.h,
                width:double.infinity,
                color:Colors.grey,),

          Padding(
            padding:  EdgeInsets.only(top: 4.0.h),
            child: Text("Glad to Meet You!",style:  GoogleFonts.poppins(
                textStyle:  TextStyle(fontSize: 20.0.sp,color: Colors.black,)
            ),),
          ),

           Padding(
             padding:  EdgeInsets.only(bottom: 2.0.h),
             child: Text("Sign Up",style:  GoogleFonts.poppins(
                  textStyle:  TextStyle(fontSize: 15.0.sp,color: Colors.grey,)
              ),
          ),
           ),
          appButtons(color: "#849ED9", text:'Sign Up With Google' , image: "assets/googlelogo.png"),
          SizedBox(
            height: 2.0.h,
          ),
          appButtons(color: "#192A51", text: 'Sign Up With Facebook', image: "assets/facebooklogo.png"),
          SizedBox(
            height: 2.0.h,
          ),
  Row(
    children: [
      Text("OR ",style: TextStyle(color: Colors.black),),
      Container(
        height:0.3.h,
        width:70.0.w,
        color:Colors.black,),
    ],
  ),
          SizedBox(
            height: 3.0.h,
          ),
          appButtons(color: "#AAA1C8", text: 'Sign Up With Email', image: "assets/Vector.png"),

Padding(
  padding:  EdgeInsets.only(top:2.5.h ),
  child:   Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    Text("Already have an account?",style: TextStyle(fontSize: 12.0.sp),),

    InkWell(

      child: Text(" Sign In",style: TextStyle(color: Colors.blue,fontSize: 12.0.sp),),

    )

  ],),
)
  ],
  ),


    ),
  );
}
Widget appButtons({required String color, required String text, required String image}){
 return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(HexColor(color)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)
              )
          )
      ),
      onPressed: () {},
      child:  Container(
        height: 6.0.h,
        width: double.infinity,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(text,style:  GoogleFonts.poppins(
                  textStyle:  TextStyle(fontSize: 15.0.sp,color: Colors.white,)
              ),), // <-- Text
              SizedBox(
                width: 5,
              ),
              Spacer(),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),

                  child: Image.asset(image,width: 30,height:30 ,)),
            ]
        ),
      )
  );
}