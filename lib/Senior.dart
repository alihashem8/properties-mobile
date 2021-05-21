import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedTabIndex = 0;

  List _pages = [
    Text("Home"),
    Text("Buy"),
    Text("Sell"),
  ];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Appartments edit Selling"), backgroundColor: Colors.red[400]),
      body: Center(child: _pages[_selectedTabIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), title: Text("Buy")),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), title: Text("Sell")),
        ],
      ),
    );
  }
}
class Users extends StatelessWidget{
  Users users;
  Users(this.users);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(margin: EdgeInsets.all(5),
      child: Card(shape: RoundedRectangleBorder(),),)
    );
  }    
}
