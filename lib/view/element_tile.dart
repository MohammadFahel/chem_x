import 'package:chem_x/View/periodic_table.dart';
import 'package:flutter/material.dart';

import '../Module/single_element_data.dart';

class ElementTile extends StatefulWidget {
  final Autogenerated element;
  const ElementTile({Key? key, required this.element}):super(key:key);

  @override
  _ElementTileState createState() => _ElementTileState();
}

class _ElementTileState extends State<ElementTile> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Column(
          children: [
            Text("${widget.element.myelements![0].number}")
          ],
        )
      ),
    );
  }
}