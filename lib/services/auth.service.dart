import 'package:http/http.dart' as http;

class AuthService{
  signUp(data) async {
    var url = Uri.parse('http://localhost:8000/api/auth/register');

    var response = await http.post(url, body: data);
    print(response);
    return response;
  }
  

  login(data) async {
    
    var url = Uri.parse('http://localhost:8000/api/auth/login');
    var response = await http.post(url, body: data);
    print(response);
    return response;
  }
}