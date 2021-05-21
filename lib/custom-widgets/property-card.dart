import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      margin: EdgeInsets.all(5),
      child: Card(
        shape: RoundedRectangleBorder(),
      ),
    ));
  }
}
