import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://192.168.100.64:8080/login/authenticate'; // For Android emulator
  // static const String baseUrl = 'http://127.0.0.1:8080/login/authenticate'; // For iOS simulator

  Future<bool> login(String username, String password) async {
    var url = Uri.parse(baseUrl);
    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );
      if (response.statusCode == 200) {
        print('Login successful');
        return true;
      } else {
        print('Login failed: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }
}