
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellPage extends StatefulWidget {
  SellPage({Key key}) : super(key: key);

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  bool showPrice;
  bool isRent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      showPrice = false;
      isRent = false;
    });
  }
  final picker = ImagePicker();
  File _image;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null){
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Contact Info",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '"Enter Phone Number Or Email"',
                  ),
                )
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Decription",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: '"description"'),
                )
              ]),
              Container(
                margin:EdgeInsets.fromLTRB(0, 20, 0, 10),
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Location",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: '"location"'),
                )
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Room Number",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '"Number of Rooms"'),
                )
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: '"Price in \$"'),
                )
              ]),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: new OutlineButton(
                    child: new Text("Add images"),
                    borderSide: BorderSide(
                        color: Colors.red[400],
                        style: BorderStyle.solid,
                        width: 2),
                    onPressed: getImage,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.red[400],
                  onPressed: () {},
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
}
