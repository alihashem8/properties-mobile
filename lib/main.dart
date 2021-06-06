// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test_flutter/pages/buy-rent.dart';
import 'package:test_flutter/pages/login.dart';
import 'package:test_flutter/pages/profile.dart';
import 'package:test_flutter/pages/sell.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedTabIndex = 0;

  List _pages = [
    BuyRentPage(),
    SellPage(),
    LoginPage(),
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
          title: Text("Appartments Selling"), backgroundColor: Colors.red[400]),
      body: Center(child: _pages[_selectedTabIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Buy/Rent")),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), title: Text("Sell")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Profile")),
        ],
      ),
    );
  }
}
