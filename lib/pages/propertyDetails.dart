import 'package:flutter/cupertino.dart';
import 'package:test_flutter/models/property.dart';

class PropertyDetails extends StatefulWidget {
  Property property;
  PropertyDetails(this.property);

  @override
  PropertyDetailsState createState() => PropertyDetailsState(property);
}

class PropertyDetailsState extends State<PropertyDetails> {
  Property property;
  PropertyDetailsState(this.property);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text("meshe")]
      ),
    );
  }
}
