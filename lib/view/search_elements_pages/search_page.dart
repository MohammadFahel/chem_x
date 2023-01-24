// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:chem_x/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../view_model/theme_service.dart';
import 'package:chem_x/view/periodic_table_pages/home_page.dart' as colors;

import '../periodic_table_pages/element_page.dart';


class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<dynamic> _items = [];
  List<dynamic> _itemsToDesplay = [];
  String myColor = "#00000";
  final _controller = TextEditingController();

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString("assets/data/quizzesData.json");
    final data = await json.decode(response);
    setState(() {
      _items = data["myelements"];
      _itemsToDesplay = _items;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isNotEmpty) {
    } else {
      readJson();
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
        appBar: AppBar(
          title:  Text(languages.searchTitle(),
              style: const TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: ThemeService().getThemeMode() == ThemeMode.light
              ? Colors.white
              : Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          shadowColor: Colors.black,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return index == 0 ? AppBarSearch() : ViewData(index - 1);
          },
          itemCount: _itemsToDesplay.length + 1,
        ));
  }

  AppBarSearch() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: ThemeService().getThemeMode() == ThemeMode.light
                ? Colors.grey.shade200
                : Colors.grey.shade800,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.redAccent,
                prefixIconColor: Colors.redAccent,
                focusColor: Colors.yellow,
                iconColor: Colors.lightGreen,
                suffixIcon: IconButton(
                    onPressed: () {
                      _controller.clear();
                      setState(() {
                        readJson();
                      });
                    },
                    icon: const Icon(Icons.clear)),
                hintText: languages.searchHint(),
                border: InputBorder.none),
            onChanged: (changeText) {
              changeText = changeText.toLowerCase();
              setState(() {
                _itemsToDesplay = _items.where((item) {
                  var itemTitle = item['name'].toLowerCase();
                  return itemTitle.contains(changeText);
                }).toList();
              });
            },
          ),
        ),
      ),
    );
  }

  ViewData(counter) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myElementInSearch(counter),
              ],
            ),
          ],
        ),
      ),
    );
  }

  myElementInSearch(counterElement) {
    myColor = "#00000";
    switch (_itemsToDesplay[counterElement]["category"]) {
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
                atomicMass: _itemsToDesplay[counterElement]["atomic_mass"] ==
                        null
                    ? 0.0
                    : _itemsToDesplay[counterElement]["atomic_mass"].toDouble(),
                appearance: _itemsToDesplay[counterElement]["appearance"] ?? "",
                boil: _itemsToDesplay[counterElement]["boil"] == null
                    ? 0.0
                    : _itemsToDesplay[counterElement]["boil"].toDouble(),
                category: _itemsToDesplay[counterElement]["category"] ?? "",
                density: _itemsToDesplay[counterElement]["density"] == null
                    ? 0.0
                    : _itemsToDesplay[counterElement]["density"].toDouble(),
                discoveredBy:
                    _itemsToDesplay[counterElement]["discovered_by"] ?? "",
                melt: _itemsToDesplay[counterElement]["melt"] == null
                    ? 0.0
                    : _itemsToDesplay[counterElement]["melt"].toDouble(),
                molarHeat: _itemsToDesplay[counterElement]["molar_heat"] == null
                    ? 0.0
                    : _itemsToDesplay[counterElement]["molar_heat"].toDouble(),
                namedBy: _itemsToDesplay[counterElement]["named_by"] ?? "",
                number: _itemsToDesplay[counterElement]["number"] ?? 0,
                period: _itemsToDesplay[counterElement]["period"] ?? 0,
                phase: _itemsToDesplay[counterElement]["phase"] ?? 0,
                summary: _itemsToDesplay[counterElement]["summary"] ?? "",
                myColor: colors.unknown_properties,
                symbol: _itemsToDesplay[counterElement]["symbol"] ?? "",
                name: _itemsToDesplay[counterElement]["name"],
              ),
            ));
      },
      child: Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: HexColor(myColor), width: 1.5),
          color: HexColor(myColor),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              HexColor(myColor).withOpacity(0.9),
              HexColor(myColor).withOpacity(0.6)
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${_itemsToDesplay[counterElement]["number"]}",
                  style: const TextStyle(fontSize: 17.5, color: Colors.white),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Text(_itemsToDesplay[counterElement]["symbol"],
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Text(_itemsToDesplay[counterElement]['name'],
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
