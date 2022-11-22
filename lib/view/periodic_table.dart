import 'package:chem_x/Module/single_element_data.dart';
import 'package:chem_x/View/element_tile.dart';
import 'package:chem_x/module/single_element_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeriodicTable extends StatefulWidget {
  PeriodicTable({Key? key}) : super(key: key);

  // final periodicList = rootBundle
  //     .loadString("assets/data/elementsData.json")
  //     .then((value) => jsonDecode(value)['myelements'] as List)
  //     .then((list) => list
  //     .map((json) => json != null ? Autogenerated.fromJson(json) : null)
  //     .toList());
  @override
  _PeriodicTableState createState() => _PeriodicTableState();
}

class _PeriodicTableState extends State<PeriodicTable> {
  List<dynamic> _items = [];
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString("assets/data/elementsData.json");
    final data = await json.decode(response);
    setState(() {
      _items = data["myelements"];
    });
  }

  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readJson();
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

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9, crossAxisSpacing: 2, mainAxisSpacing: 10),
      scrollDirection: Axis.horizontal,
      itemCount: _items.length,
      itemBuilder: (_, index){
        return _items[index]==null? Container(width: 100,) : Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width:2),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${_items[index]["number"]}"),
                  const SizedBox(width: 20,),
                  //Text("${_items[index]["atomic_mass"].toStringAsFixed(3)}"),
                ],
              ),
              Text(_items[index]["symbol"], style: TextStyle(fontSize: 15)),
            ],
          ),
        );
      },
    );

    // return Column(
    //   children: [
    //     // Display the data loaded from sample.json
    //     _items.isNotEmpty
    //         ? Expanded(
    //       child: ListView.builder(
    //         itemCount: _items.length,
    //         itemBuilder: (context, index) {
    //           return Card(
    //             key: ValueKey(_items[index]["name"]),
    //             margin: const EdgeInsets.all(10),
    //             color: Colors.white24,
    //             child: ListTile(
    //               leading: Text(_items[index]["category"]),
    //               title: Text(_items[index]["name"]),
    //               subtitle: Text(_items[index]["symbol"]),
    //             ),
    //           );
    //         },
    //       ),
    //     )
    //         : Container(child: Text("ERROR"),)
    //   ],
    // );



    //  return SingleChildScrollView(
    //   child: SizedBox(
    //     height: 100,
    //     child: GridView.count(
    //       crossAxisCount: 10,
    //       children: <Widget>[...forGrid],
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return _items.isNotEmpty
        ? _buildTable(_items)
        : const Center(
            child: CircularProgressIndicator(),
          );

    // return FutureBuilder(
    //   future: _items,
    //   builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
    //       ? _buildTable(snapshot.data)
    //       : const Center(
    //           child: CircularProgressIndicator(),
    //         ),
    // );
  }
}
