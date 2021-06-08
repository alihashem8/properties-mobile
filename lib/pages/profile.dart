import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/models/user.dart';
import 'package:test_flutter/pages/signUp.dart';
import 'package:test_flutter/services/auth.service.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  var isLoggedIn;

  AuthService authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User user = User(
      name: "aa",
      createdAt: new DateTime.now(),
      email: "aa",
      id: 11,
      phoneNumber: 11,
      updatedAt: new DateTime.now());

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoggedIn = false;
      checkToken();
    });
    checkToken();
  }

  checkToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var token = sp.getString("token");
    if (token == null) {
      setState(() {
        isLoggedIn = false;
      });
    } else {
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    setState(() {
      isLoggedIn = false;
    });
  }

  void _handleLogin() async {
    var data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    print(data);
    var token = await authService.login(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoggedIn
        ? SingleChildScrollView(
            child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.network(
                          'https://th.bing.com/th/id/R01929300efb541e17fd9d6e0a2dbc288?rik=AAClV4AFnNA97g&pid=ImgRaw')),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              // ignore: deprecated_member_use
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(20)),
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: _handleLogin,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpPage())),
                child: Text('New User? Create Account'),
              ),
            ],
          ))
        : Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(children: [
                      Expanded(
                          child: Image.network(
                        'https://th.bing.com/th/id/OIP.1HYV4hTGQvMV2vYeEf3FdgHaHa?pid=ImgDet&rs=1',
                        width: 100,
                        height: 100,
                      ))
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(
                      "Name: " + user.name,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(
                      "Email: " + user.email,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You joined at " + user.createdAt.toString(),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.red[400],
                          borderRadius: BorderRadius.circular(20)),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: logout,
                        child: Text(
                          'Log Out',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
