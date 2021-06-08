import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
          title: Text("Property Market"), backgroundColor: Colors.red[400]),
      body: SingleChildScrollView(child: Column(children: [
        Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                property.image != null
                    ? (Image.network(property.image))
                    : Image.network(
                        'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.red[200],
                              blurRadius: 5,
                              offset: new Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                        child: Center(
                          child: property.listingTypeId == 0
                              ? Text("For Sale")
                              : Text('For Rent'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(children: [
                      Text(
                        "Number Of Rooms",
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(property.roomsNumber.toString()),
                    ])),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  height: 1.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.black, boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ]),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(children: [
                      Text("Property Description"),
                      Expanded(
                        child: Container(),
                      ),
                      Text(property.description)
                    ])),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  height: 1.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.black, boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ]),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(children: [
                      Text("Location"),
                      Expanded(
                        child: Container(),
                      ),
                      Text(property.locationDescription)
                    ])),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  height: 1.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.black, boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ]),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      children: [
                        Text("Price"),
                        Expanded(
                          child: Container(),
                        ),
                        property.showPrice
                            ? Text(property.price.toString() + " \$ ")
                            : Text('Contact us for price'),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  height: 1.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.black, boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: [
                      Text("Contact Info"),
                      Expanded(
                        child: Container(),
                      ),
                      Text(property.contactInfo),
                    ],
                  ),
                )
              ],
            )),
      ]),
    ));
  }
}
