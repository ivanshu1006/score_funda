import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> signUp(String name, String phoneNo, String password) async {
  var url = Uri.parse('http://restsf.nullplex.co.in/api/register');
  var params = {
    'name': name,
    'mobile': phoneNo,
    'password': password,
    'deviceid': '1234'
  };
  var response = await http.post(url, body: params);

  // print the response status code and body
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<void> signIn(String phoneNo, String password) async {
  var url = Uri.parse('http://restsf.nullplex.co.in/api/login');
  var params = {'mobile': phoneNo, 'password': password, 'deviceid': '1234'};
  var response = await http.post(url, body: params);

  // print the response status code and body
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future<void> ValidateOtp(String mobile, String otp) async {
  var url = Uri.parse('http://restsf.nullplex.co.in/api/register');
  var params = {'mobile': mobile, 'otp': otp};
  var response = await http.post(url, body: params);

  // print the response status code and body
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
