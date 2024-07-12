import 'dart:convert';

import '../models/categories_model.dart';
import 'package:http/http.dart' as http;

Future<Category> createCategory(title) async {
  final response = await http.post(
    Uri.parse('http://192.168.3.221:3000/categories/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title
      }),
  );
  print(response.body);

  return Category.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}

/*
Future<Category> getAllCategories() async {
  final response = await http.get(
    Uri.parse('http://192.168.3.221:3000/categories/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
*/
/*  final List body = json.decode(response.body);
  return body.map((e) => Post.fromJson(e)).toList();*//*

  final List body = json.decode(response.body);
  return body.map((e) => Category.fromJson(e)).toList();
}*/

Future<List<Category>> getAllCategories() async {
  var url = Uri.parse('http://192.168.3.221:3000/categories/');
  final response = await http.get(url, headers: {"Content-Type": "application/json"});
  final List body = json.decode(response.body);
  return body.map((e) => Category.fromJson(e)).toList();
}