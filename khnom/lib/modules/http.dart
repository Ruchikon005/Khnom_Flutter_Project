  
import 'dart:convert';

import "package:http/http.dart" as http;

class RequestResult
{
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
const DOMAIN = "172.31.208.1:3001";

// ignore: non_constant_identifier_names
Future<RequestResult> http_get(String route, [dynamic data]) async
{
  var dataStr = jsonEncode(data);
  var url = Uri.parse("$PROTOCOL://$DOMAIN/$route?data=$dataStr");
  var result = await http.get(url);
  return RequestResult(true, jsonDecode(result.body));
}
// ignore: non_constant_identifier_names
Future<RequestResult> http_post(String route, [dynamic data]) async
{
  var url = Uri.parse("$PROTOCOL://$DOMAIN/$route?");
  var dataStr = jsonEncode(data);
  var result = await http.post(url, body: dataStr, headers:{"Content-Type":"application/json"});
  return RequestResult(true, jsonDecode(result.body));
}