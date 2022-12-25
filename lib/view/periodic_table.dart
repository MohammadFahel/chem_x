import 'package:chem_x/Module/single_element_data.dart';
import 'package:chem_x/View/element_tile.dart';
import 'package:chem_x/module/single_element_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'element_page.dart';
import 'home_page.dart' as colors;
import 'package:hexcolor/hexcolor.dart';

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

  _buildTable(List elements) {
    // final forGrid = elements
    //     .map(
    //       (element) => elements != null
    //           ? ElementTile(element: element!)
    //           : Container(
    //               margin: EdgeInsets.all(1.w),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //             ),
    //     )
    //     .toList();
    //

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 9, crossAxisSpacing: 2, mainAxisSpacing: 10),
      scrollDirection: Axis.horizontal,
      itemCount: _items.length,
      itemBuilder: (_, index) {
        if (_items[index] == null) {
          return Container(
            width: 100,
          );
        } else {
          return GestureDetector(
            onTap: () {
              // print(_items[index]['category']);
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: HexColor(_items[index]["cpk-hex"]), width: 2),
                color: HexColor(_items[index]["cpk-hex"]),
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
                        "${_items[index]["number"]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      //Text("${_items[index]["atomic_mass"].toStringAsFixed(3)}"),
                    ],
                  ),
                  Text(_items[index]["symbol"],
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text(_items[index]["name"],
                      style: const TextStyle(
                          fontSize: 7.5,
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

  @override
  Widget build(BuildContext context) {
    if (_items.isNotEmpty) {
      return _buildTable(_items);
    } else {
      readJson();
      return const Center(child: CircularProgressIndicator());
    }
  }
}
