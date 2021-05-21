import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Profile"),
    );
  }
}