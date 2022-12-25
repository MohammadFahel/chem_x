import 'package:chem_x/Module/single_element_data.dart';
import 'package:chem_x/View/element_tile.dart';
import 'package:chem_x/module/single_element_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

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

  // List<String> btn=["Nice One!", "Good to Know", "Understood", "Close", "Done"];
  // var randomItem = (List.shuffle()).first;
  @override
  Widget build(BuildContext context) {
    showPopUp(String title, String description) {
      return showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              insetPadding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, right: 7, left: 7),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.only(right: 10),
                      ),
                      Text(
                        "$title",
                        style: GoogleFonts.poppins(
                            color: HexColor("#192A51"),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 0.2,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Text(
                      "$description",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: HexColor("192A51"),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 6.0,
                        backgroundColor: HexColor("#AAA1C8"),
                      ),
                      child: Text(
                        "Done",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                            )),
                      ))
                ]),
              ),
            );
          });
    }

    showButton(BuildContext context, String title, String description) {
      return Transform.rotate(
        angle: 180 * math.pi / 180,
        child: IconButton(
            onPressed: () => showPopUp(title, description),
            iconSize: 20,
            icon: Icon(Icons.arrow_back_ios)),
      );
    }

    buildColumn(String title, dynamic content, bool desc, String description) {
      return Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "$title",
              style: GoogleFonts.poppins(
                  color: HexColor("#192A51"),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            desc
                ? showButton(context, title, description)
                : SizedBox(
                    width: 5,
                  )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "$content",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: HexColor("192A51"),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5, left: 20),
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
                    border: Border.all(color: HexColor("$myColor"), width: 2),
                    color: HexColor("$myColor"),
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
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      Text("$symbol",
                          style: GoogleFonts.poppins(
                              fontSize: 45,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("$name",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              child: const Text(
                "M",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      buildColumn("Summary", summary, true, summary),
                      buildColumn("Category", category, false, category),
                      appearance.isNotEmpty
                          ? buildColumn(
                              "Appearance", appearance, false, appearance)
                          : const SizedBox(
                              height: 0.0,
                            ),
                      buildColumn("Atomic Mass", atomicMass.toStringAsFixed(3),
                          true, "Atomic mass, the quantity of matter contained in an atom of an element. It is expressed as a multiple of one-twelfth the mass of the carbon-12 atom, 1.992646547 × 10−23 gram, which is assigned an atomic mass of 12 units."),
                      buildColumn("Boil", boil, true, "Boiling is the process by which a liquid turns into a vapor when it is heated to its boiling point. The change from a liquid phase to a gaseous phase occurs when the vapor pressure of the liquid is equal to the atmospheric pressure exerted on the liquid."),
                      buildColumn("Density", density, true, "Density is the measurement of how tightly a material is packed together. It is defined as the mass per unit volume. Density Symbol: D or ρ Density Formula: ρ = m/V, where ρ is the density, m is the mass of the object and V is the volume of the object."),
                      buildColumn("Melt", melt, true, "Melting, change of a solid into a liquid when heat is applied. In a pure crystalline solid, this process occurs at a fixed temperature called the melting point; an impure solid generally melts over a range of temperatures below the melting point of the principal component."),
                      buildColumn("Molar Heat", molarHeat, true, "Molar heat capacity is defined as the amount of heat required to raise 1 mole of a substance by 1 degree Kelvin."),
                      buildColumn("Period", period, false, ""),
                      buildColumn("Phase", phase, true, "There are four phases in chemistry: solid, liquid, gas, and plasma."),
                      namedBy.isNotEmpty
                          ? buildColumn("Named By", namedBy, false, "")
                          : const SizedBox(
                              height: 0.0,
                            ),
                      discoveredBy.isNotEmpty
                          ? buildColumn(
                              "Discovered By", discoveredBy, false, "")
                          : const SizedBox(
                              height: 0.0,
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// showPopUp(BuildContext context, String title, String description){
//   return Dialog(
//     insetPadding: EdgeInsets.all(10),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(30),
//     ),
//     elevation: 0,
//     backgroundColor: Colors.transparent,
//     child: Container(
//       padding: EdgeInsets.only(top: 3.h,bottom: 3.h,right: 7.w,left:7.w),
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(30)),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "$title",
//                 style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 15.0.sp,
//                     )),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           Container(
//             height: 0.2.h,
//             width: double.infinity,
//             color: Colors.grey,
//           ),
//           SizedBox(
//             height: 3.h,
//           ),
//         ],
//       ),
//     ),
//   );
// }
