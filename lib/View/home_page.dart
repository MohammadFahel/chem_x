import 'package:chem_x/View/periodic_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';


const String alkali_metals="#85CAC4";
const String metalloids="#8C692B";
const String actinides="#8C4D2D";
const String alkaline_earth_metals="#622E39";
const String reactive_nonmetals="#2A4165";
const String unknown_properties="#46474C";
const String transition_metals="#433C65";
const String noble_gases="#934356";
const String post_transition_metals="#2F4D47";
const String lanthanides="#004A77";


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const HomePage());
    },);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _periodicTable = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: SizedBox(
            height: 20,
          ),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        shadowColor: Colors.black,
        leading: Padding(
            padding:
                const EdgeInsets.only(left: 7, top: 8, bottom: 0, right: 0),
            child: IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage("assets/images/profile.png"),
                  size: 60,
                  color: Colors.black,
                ))),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 0, top: 12, bottom: 0, right: 7),
            child: IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage("assets/images/flask.png"),
                  size: 40,
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: PageView(
        controller: _periodicTable,
        children: [
          PeriodicTable(),
        ],
        physics: const NeverScrollableScrollPhysics()
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: HexColor("#00000").withOpacity(0.3),
                blurRadius: 10,
              )
            ]),
        child: BottomAppBar(
            elevation: 8,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Row(
                      children: [
                        CategoryContainer(alkali_metals),
                        SizedBox(width: 5,),
                        CategoryText("Alkali Metals"),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Row(
                      children: [
                        CategoryContainer(metalloids),
                        SizedBox(width: 5,),
                        CategoryText("Metalloids"),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Row(
                      children: [
                        CategoryContainer(actinides),
                        SizedBox(width: 5,),
                        CategoryText("Actinides"),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Row(
                      children: [
                        CategoryContainer(alkaline_earth_metals),
                        SizedBox(width: 5,),
                        CategoryText("Alkaline Earth Metals"),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Row(
                      children: [
                        CategoryContainer(reactive_nonmetals),
                        SizedBox(width: 5,),
                        CategoryText("Reactive Nonmetals"),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Row(
                      children: [
                        CategoryContainer(unknown_properties),
                        SizedBox(width: 5,),
                        CategoryText("Unknown Properties"),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Row(
                      children: [
                        CategoryContainer(transition_metals),
                        SizedBox(width: 5,),
                        CategoryText("Transition Metals"),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Row(
                      children: [
                        CategoryContainer(noble_gases),
                        SizedBox(width: 5,),
                        CategoryText("Noble Gases"),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Row(
                      children: [
                        CategoryContainer(post_transition_metals),
                        SizedBox(width: 5,),
                        CategoryText("Post-transition Metals"),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Row(
                      children: [
                        CategoryContainer(lanthanides),
                        SizedBox(width: 5,),
                        CategoryText("Lanthanides"),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

CategoryContainer(String color){
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      color: HexColor("$color"),
      shape: BoxShape.circle,
    ),
  );
}

CategoryText(String category){
  return Text(
    "$category",
    style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15, color: HexColor("#192A51")),
    ),
  );
}