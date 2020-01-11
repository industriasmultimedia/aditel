import 'dart:convert';
import 'package:http/http.dart' as http;


var sslhttp = 'https://';

// DOMINIO
var dominio = 'aditelgt.com';

var restapi = '/wp-json/wp/v2/';
var barra = sslhttp + dominio + restapi;
var aditelitems = 'ait-item?_embed';

var aditellocations = 'ait-locations';

final String items = barra + aditelitems;
final String locaciones = barra+aditellocations;


Future<List> wpaditel() async{
  final response = await http.get(items, headers: {"Accept":"application/json"});
  var converDatatoJson = jsonDecode(response.body);
  return converDatatoJson;
}

Future<List> locations() async{
  final response = await http.get(locaciones, headers: {"Accept":"application/json"});
  var converDatatoJson = jsonDecode(response.body);
  return converDatatoJson;
}

// Future<List> wpcategoria() async{
//   final response = await http.get(items, headers: {"Accept":"application/json"});
//   var converDatatoJson = jsonDecode(response.body);
//   return converDatatoJson;

// }