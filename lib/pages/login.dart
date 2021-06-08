
import 'package:flutter/material.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/pages/buy-rent.dart';
import 'package:test_flutter/pages/signUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(controller: emailController,
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
              child: TextField(controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            FlatButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.red[400], fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed:_handleLogin ,
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
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignUpPage())),
              child: Text('New User? Create Account'),
            ),
          ],
        ),
      ),
    );
  }
  void _handleLogin() async{
    setState(() {
      
    });
    var data ={
      'email' : emailController.text,
      'password' : passwordController.text,
    };
print(data);
  // SharedPreferences prefs = await SharedPreferences.getInstance();

// SharedPreferences sp = await SharedPreferences.getInstance();
  }
}
