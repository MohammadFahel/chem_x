
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'dart:convert';
import 'element_page.dart';
import 'home_page.dart' as colors;
import 'package:hexcolor/hexcolor.dart';
import 'package:glassmorphism/glassmorphism.dart';

class PeriodicTable extends StatefulWidget {
  PeriodicTable({Key? key}) : super(key: key);

  @override
  _PeriodicTableState createState() => _PeriodicTableState();
}

class _PeriodicTableState extends State<PeriodicTable> {
  List<dynamic> _items = [];
  String myColor = "#00000";
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString("assets/data/elementsData.json");
    final data = await json.decode(response);
    setState(() {
      _items = data["myelements"];
    });
  }


  _buildTableHorizontally(List elements) {
    print("_buildTableHorizontally");
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 9, crossAxisSpacing: 6, mainAxisSpacing: 6),
      scrollDirection: Axis.horizontal,
      itemCount: _items.length,
      itemBuilder: (_, index) {
        if (_items[index] == null) {
          return Container();
        } else {
          myColor = "#00000";
          switch (_items[index]["category"]) {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ElementPage(
                      atomicMass: _items[index]["atomic_mass"] == null
                          ? 0.0
                          : _items[index]["atomic_mass"].toDouble(),
                      appearance: _items[index]["appearance"] == null
                          ? ""
                          : _items[index]["appearance"],
                      boil: _items[index]["boil"] == null
                          ? 0.0
                          : _items[index]["boil"].toDouble(),
                      category: _items[index]["category"] == null
                          ? ""
                          : _items[index]["category"],
                      density: _items[index]["density"] == null
                          ? 0.0
                          : _items[index]["density"].toDouble(),
                      discoveredBy: _items[index]["discovered_by"] == null
                          ? ""
                          : _items[index]["discovered_by"],
                      melt: _items[index]["melt"] == null
                          ? 0.0
                          : _items[index]["melt"].toDouble(),
                      molarHeat: _items[index]["molar_heat"] == null
                          ? 0.0
                          : _items[index]["molar_heat"].toDouble(),
                      namedBy: _items[index]["named_by"] == null
                          ? ""
                          : _items[index]["named_by"],
                      number: _items[index]["number"] == null
                          ? 0
                          : _items[index]["number"],
                      period: _items[index]["period"] == null
                          ? 0
                          : _items[index]["period"],
                      phase: _items[index]["phase"] == null
                          ? 0
                          : _items[index]["phase"],
                      summary: _items[index]["summary"] == null
                          ? ""
                          : _items[index]["summary"],
                      myColor: _items[index]["cpk-hex"],
                      symbol: _items[index]["symbol"] == null
                          ? ""
                          : _items[index]["symbol"],
                      name: _items[index]["name"],
                    ),
                  ));
            },
            child: Container(
              // width: 100,
              // height: 100,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: HexColor("${myColor}"), width: 1.5),
                color: HexColor("${myColor}"),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    HexColor("${myColor}").withOpacity(0.9),
                    HexColor("${myColor}").withOpacity(0.6)
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "${_items[index]["number"]}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                        style: TextStyle(color: Colors.white, fontSize: 8.sp),
                      ),
                    ],
                  ),
                  Text(_items[index]["symbol"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style:  TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text(_items[index]["name"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style:  TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            ),
          );
        }
      },
    );
  }


  // _buildTableVertically(List elements) {
  //   print("_buildTableVertically");
  //   return GridView.builder(
  //     shrinkWrap: true,
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 9, crossAxisSpacing: 7, mainAxisSpacing: 7),
  //     scrollDirection: Axis.vertical,
  //     itemCount: _items.length,
  //     itemBuilder: (_, index) {
  //       if (_items[index] == null) {
  //         return Container();
  //       } else {
  //         myColor = "#00000";
  //         switch (_items[index]["category"]) {
  //           case "noble gas":
  //             myColor = colors.noble_gases;
  //             break;
  //           case "diatomic nonmetal":
  //             myColor = colors.reactive_nonmetals;
  //             break;
  //           case "polyatomic nonmetal":
  //             myColor = colors.reactive_nonmetals;
  //             break;
  //           case "metalloid":
  //             myColor = colors.metalloids;
  //             break;
  //           case "post-transition metal":
  //             myColor = colors.post_transition_metals;
  //             break;
  //           case "unknown, probably transition metal":
  //             myColor = colors.unknown_properties;
  //             break;
  //           case "alkali metal":
  //             myColor = colors.alkali_metals;
  //             break;
  //           case "alkaline earth metal":
  //             myColor = colors.alkaline_earth_metals;
  //             break;
  //           case "transition metal":
  //             myColor = colors.transition_metals;
  //             break;
  //           case "actinide":
  //             myColor = colors.actinides;
  //             break;
  //           case "lanthanide":
  //             myColor = colors.lanthanides;
  //             break;
  //         }
  //         return GestureDetector(
  //           onTap: () {
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => ElementPage(
  //                     atomicMass: _items[index]["atomic_mass"] == null
  //                         ? 0.0
  //                         : _items[index]["atomic_mass"].toDouble(),
  //                     appearance: _items[index]["appearance"] == null
  //                         ? ""
  //                         : _items[index]["appearance"],
  //                     boil: _items[index]["boil"] == null
  //                         ? 0.0
  //                         : _items[index]["boil"].toDouble(),
  //                     category: _items[index]["category"] == null
  //                         ? ""
  //                         : _items[index]["category"],
  //                     density: _items[index]["density"] == null
  //                         ? 0.0
  //                         : _items[index]["density"].toDouble(),
  //                     discoveredBy: _items[index]["discovered_by"] == null
  //                         ? ""
  //                         : _items[index]["discovered_by"],
  //                     melt: _items[index]["melt"] == null
  //                         ? 0.0
  //                         : _items[index]["melt"].toDouble(),
  //                     molarHeat: _items[index]["molar_heat"] == null
  //                         ? 0.0
  //                         : _items[index]["molar_heat"].toDouble(),
  //                     namedBy: _items[index]["named_by"] == null
  //                         ? ""
  //                         : _items[index]["named_by"],
  //                     number: _items[index]["number"] == null
  //                         ? 0
  //                         : _items[index]["number"],
  //                     period: _items[index]["period"] == null
  //                         ? 0
  //                         : _items[index]["period"],
  //                     phase: _items[index]["phase"] == null
  //                         ? 0
  //                         : _items[index]["phase"],
  //                     summary: _items[index]["summary"] == null
  //                         ? ""
  //                         : _items[index]["summary"],
  //                     myColor: _items[index]["cpk-hex"],
  //                     symbol: _items[index]["symbol"] == null
  //                         ? ""
  //                         : _items[index]["symbol"],
  //                     name: _items[index]["name"],
  //                   ),
  //                 ));
  //           },
  //           child: Container(
  //             width: 100,
  //             height: 100,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(10),
  //               border: Border.all(color: HexColor("${myColor}"), width: 1.5),
  //               color: HexColor("${myColor}"),
  //               gradient: LinearGradient(
  //                 begin: Alignment.topRight,
  //                 end: Alignment.bottomRight,
  //                 colors: [
  //                   HexColor("${myColor}").withOpacity(0.9),
  //                   HexColor("${myColor}").withOpacity(0.6)
  //                 ],
  //               ),
  //               boxShadow: const [
  //                 BoxShadow(
  //                   color: Colors.black12,
  //                   blurRadius: 10.0,
  //                   spreadRadius: 5.0,
  //                 ),
  //               ],
  //             ),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     SizedBox(
  //                       width: 1.w,
  //                     ),
  //                     Text(
  //                       "${_items[index]["number"]}",
  //                       overflow: TextOverflow.ellipsis,
  //                       maxLines: 1,
  //                       softWrap: true,
  //                       style: TextStyle(color: Colors.white, fontSize: 8.sp),
  //                     ),
  //                   ],
  //                 ),
  //                 Text(_items[index]["symbol"],
  //                     overflow: TextOverflow.ellipsis,
  //                     maxLines: 1,
  //                     softWrap: false,
  //                     style:  TextStyle(
  //                         fontSize: 12.sp,
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold)),
  //                 Text(_items[index]["name"],
  //                     overflow: TextOverflow.ellipsis,
  //                     maxLines: 1,
  //                     softWrap: false,
  //                     style:  TextStyle(
  //                         fontSize: 8.sp,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.white)),
  //               ],
  //             ),
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final deviceOrintation = MediaQuery.of(context).orientation;
    if (_items.isNotEmpty) {
      return _buildTableHorizontally(_items);
      // return deviceOrintation == Orientation.portrait ? _buildTableHorizontally(_items) : _buildTableVertically(_items);
    } else {
      readJson();
      return const Center(child: CircularProgressIndicator());
    }
  }
}
