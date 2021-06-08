import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/pages/signUp.dart';
import 'package:test_flutter/services/auth.service.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  var isLoggedIn;
  LoginPage(this.isLoggedIn);
  @override
  _LoginDemoState createState() => _LoginDemoState(isLoggedIn);
}

class _LoginDemoState extends State<LoginPage> {
  var isLoggedIn;
  AuthService authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  _LoginDemoState(this.isLoggedIn);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              // height: 50,
              // width: 250,
              decoration: BoxDecoration(
                  // color: Colors.red[400],
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
            InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignUpPage())),
              child: Text('New User? Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin() async {
    setState(() {});
    var data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    print(data);
    await authService.login(data);
    var token = await authService.login(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    isLoggedIn = true;
  }
}
