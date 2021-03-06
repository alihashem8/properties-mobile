import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/custom-widgets/property-card.dart';
import 'package:test_flutter/services/properties.service.dart';

class BuyRentPage extends StatefulWidget {
  BuyRentPage({Key key}) : super(key: key);

  @override
  _BuyRentPageState createState() => _BuyRentPageState();
}

class _BuyRentPageState extends State<BuyRentPage> {
  PropertiesServices propertiesService = PropertiesServices();

  var properties = [];

  @override
  void initState() {
      getProperties();
              super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: properties.length,
      itemBuilder: (context, index) {
        return PropertyCard(properties[index]);
      },
    ));
  }

  Future<void> getProperties() async {
    properties = await propertiesService.getAll();
    setState(() {
      properties = properties;
    });
  }
}
