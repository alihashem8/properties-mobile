import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/services/properties.service.dart';

class SellPage extends StatefulWidget {
  SellPage({Key key}) : super(key: key);

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  PropertiesServices propertiesServices = new PropertiesServices();
  bool showPrice;
  bool isRent;
  String contactInfo;
  String description;
  String locationDescription;
  int roomsNumber;
  var isLoggedIn;

  TextEditingController contactInfoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationDescriptionController = TextEditingController();
  TextEditingController roomsNumberController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  checkToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var token = sp.getString("token");
    if (token != null) {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setState(() {
      showPrice = false;
      isRent = false;
      isLoggedIn = true;
    });
    checkToken();
  }

  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
        ? Center(
            child: Text("You Need To Log In"),
          )
        : SingleChildScrollView(
            child: Container(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact Info",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                          ),
                          TextField(
                            controller: contactInfoController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '"Enter Phone Number Or Email"',
                            ),
                          )
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                          ),
                          TextField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '"description"'),
                          )
                        ]),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("SELL"),
                          CupertinoSwitch(
                            value: isRent,
                            onChanged: (value) {
                              setState(() {
                                isRent = value;
                              });
                            },
                          ),
                          Text("RENT"),
                        ],
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                          ),
                          TextField(
                            controller: locationDescriptionController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '"location"'),
                          )
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Room Number",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                          ),
                          TextField(
                            controller: roomsNumberController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '"Number of Rooms"'),
                          )
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              "Show Price?",
                              style: TextStyle(fontSize: 20),
                            ),
                            Checkbox(
                              value: this.showPrice,
                              onChanged: (bool value) {
                                setState(() {
                                  this.showPrice = value;
                                });
                              },
                            ),
                          ]),
                          Container(
                            margin: EdgeInsets.all(5),
                          ),
                          TextField(
                            controller: priceController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '"Price in \$"'),
                          )
                        ]),
                   // Container(
                     //   margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        // ignore: deprecated_member_use
                       // child: new OutlineButton(
                         // child: new Text("Add images"),
                          //borderSide: BorderSide(
                            //  color: Colors.red[400],
                              //style: BorderStyle.solid,
                              //width: 2),
                          //onPressed: getImage,
                          //shape: new RoundedRectangleBorder(
                           //   borderRadius: new BorderRadius.circular(30.0)),
                        //)),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: FloatingActionButton.extended(
                        backgroundColor: Colors.red[400],
                        onPressed: storeProperty,
                        icon: Icon(
                          Icons.add,
                          size: 15,
                        ),
                        label: Text(
                          "Place an AD",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Future<void> storeProperty() async {
    var data = {
      'description': descriptionController.text,
      'price': priceController.text,
      'contactInfo': contactInfoController.text,
      'locationDescription': locationDescriptionController.text,
      'roomsNumber': roomsNumberController.text,
      'showPrice': showPrice ? '1' : '0',
      'listingTypeId': isRent ? '1' : '0'
    };

    await propertiesServices.store(data);
  }
}
