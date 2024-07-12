import 'dart:ffi';

class Thing {
  int? id;
  String? name;
  String? value;
  int? categoryId;

  Thing.fromJson(Map<String, dynamic> json) :

        id = json['id'],
        name = json['name'],
        value = json['aproximate_value'],
        categoryId = json['category_id'];

}