import 'package:chem_x/Module/single_element_data.dart';
import 'package:chem_x/View/element_tile.dart';
import 'package:chem_x/module/single_element_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class ElementPage extends StatelessWidget {
  final String summary,
      appearance,
      category,
      discoveredBy,
      namedBy,
      myColor,
      symbol,
      name,
      phase;
  final double atomicMass, boil, density, melt, molarHeat;
  final int number, period;
  const ElementPage(
      {Key? key,
      required this.summary,
      required this.atomicMass,
      required this.appearance,
      required this.boil,
      required this.category,
      required this.density,
      required this.discoveredBy,
      required this.melt,
      required this.molarHeat,
      required this.namedBy,
      required this.number,
      required this.period,
      required this.phase,
      required this.myColor,
      required this.symbol,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: HexColor("#$myColor"), width: 2),
                    color: HexColor("#$myColor"),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$number",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          // const SizedBox(
                          //   width: 50,
                          // ),
                          // Text(
                          //   "1.008",
                          //   style: const TextStyle(color: Colors.white),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text("$symbol",
                          style: const TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("$name",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            buildColumn("Atomic Mass", atomicMass),
          ],
        ),
      ),
    );
  }
}
buildColumn(String title, dynamic content){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("$title", style: TextStyle(color: HexColor("#192A51"), fontWeight: FontWeight.bold, fontSize: 15),),
      Text("$content"),
    ],
  );
}

// return Container(
// child: ElevatedButton(
// child: Text("$x"),
// onPressed: ()=>Navigator.pop(context),
// ),
// );
