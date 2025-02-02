import 'dart:convert';
import '../models/things_model.dart';
import 'package:http/http.dart' as http;

/*
* Get all things
* */
Future<List<Thing>> getAllThings() async {
  var url = Uri.parse('http://192.168.3.221:3000/things/');
  final response = await http.get(url, headers: {'Content-Type': 'application/json'});
  final List body = json.decode(response.body);
  return body.map((e) => Thing.fromJson(e)).toList();
}

/*
* Get one thing
* */
Future<Thing> getOneThing(thingId) async{
  var url = Uri.parse('http://192.168.3.221:3000/things/$thingId');
  final response = await http.get(url, headers: {'Content-Type': 'application/json'});
  return Thing.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}

/*
* Create new thing
* */
Future<Thing> createThing(name, value) async{
  var url = Uri.parse('http://192.168.3.221:3000/things/');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(<String, dynamic>{
      'name': name,
      'aproximate_value': value,
      'category_id': 1,
    }),
  );
  return Thing.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}

/*
* Update tings
* */
Future<Thing> updateThing(name, id) async{
  var url = Uri.parse('http://192.168.3.221:3000/things/$id');
  final response = await http.patch(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(<String, dynamic>{
      'name': name,
    }),
  );
  return Thing.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}

/*
* Delete thing
* */
Future<Thing> deleteThing(id) async{
  var url = Uri.parse('http://192.168.3.221:3000/things/$id');
  final response = await http.delete(
    url,
    headers: {'Content-Type': 'application/json'}
  );
  return Thing.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}