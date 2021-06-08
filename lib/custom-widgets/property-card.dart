import 'package:flutter/material.dart';
import 'package:test_flutter/models/property.dart';
import 'package:test_flutter/pages/propertyDetails.dart';

// ignore: must_be_immutable
class PropertyCard extends StatelessWidget {
  Property property;

  PropertyCard(this.property);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      margin: EdgeInsets.all(5),
      child: Card(
        shape: RoundedRectangleBorder(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: property.image != null
                    ? AspectRatio(
                        aspectRatio: 3 / 4,
                        child: Image.network(property.image),
                      )
                    : AspectRatio(
                        aspectRatio: 3 / 4,
                        child: Image.network(
                          'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        ),
                      ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 40, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.locationDescription +"",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: property.showPrice == 1
                            ? Text(property.price.toString() + " \$ ")
                            : Text('Contact us for price'))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 40,
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.red[400],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PropertyDetails(property)),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            size: 12,
                          ),
                          label: Text(
                            "Show More",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
