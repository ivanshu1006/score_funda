import 'package:http/http.dart' as http;

Future<http.Response> signUp(
    String name, String phoneNo, String password) async {
  var url = Uri.parse('http://restsf.nullplex.co.in/api/register');
  var params = {
    'name': name,
    'mobile': phoneNo,
    'password': password,
    'deviceid': '1234'
  };

  http.Response res = await http.post(url, body: params);
  print(res.body);
  return res;
}

Future<http.Response> signIn(String phoneNo, String password) async {
  var url = Uri.parse('http://restsf.nullplex.co.in/api/login');
  var params = {'mobile': phoneNo, 'password': password, 'deviceid': '1234'};
  return await http.post(url, body: params);
}

Future<http.Response> ValidateOtp(String mobile, String otp) async {
  var url = Uri.parse('http://restsf.nullplex.co.in/api/verifyOtp');
  var params = {'mobile': mobile, 'otp': otp};
  http.Response res = await http.post(url, body: params);
  print(res.body);
  return res;
}
