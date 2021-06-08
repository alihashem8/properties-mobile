import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService{
  signUp(data) async {
    var url = Uri.parse('https://prop-back.000webhostapp.com/api/auth/register');

    var response = await http.post(url, body: data);
    print(response);
    return response;
  }
  

  login(data) async {
    
    var url = Uri.parse('https://prop-back.000webhostapp.com/api/auth/login');
    var response = await http.post(url, body: data);
    print(response.statusCode);
        var object = jsonDecode(response.body);
        print(object["token"]);
    return object["token"];
    
  }
}