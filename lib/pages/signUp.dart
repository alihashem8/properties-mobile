import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/services/auth.service.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthService authService = AuthService();

  var properties = [];

  @override
  void initState() {
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Property Market"), backgroundColor: Colors.red[400]),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
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
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Enter Your Full Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
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
                  height: 50,
                  width: 250,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(20)),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: _handleSignUp,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 130,
                ),
              ],
            ),
          ),
        ));
  }

  void _handleSignUp() async {
    setState(() {});
    var data = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };
    print(data);
    await authService.signUp(data);
    Navigator.pop(
      context,
    );
  }
}
