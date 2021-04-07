import 'package:http/http.dart' as http;
// import 'dart:io';
import 'dart:async';


class ApiProvider {
  ApiProvider();

  var endPoint = '172.19.175.153:3001' ;

  Future<http.Response> doLogin(String name, String email ,String password) async {
    var _url = Uri.http(endPoint,"/register");
    var body = {
      "Username" : name,
      "Email" : email,
      "password" : password
    };

    return http.post(_url,body: body);
  }
  
}