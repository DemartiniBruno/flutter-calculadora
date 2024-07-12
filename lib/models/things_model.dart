import 'dart:ffi';

class Thing {

  String? name;
  String? value;
  int? categoryId;

  Thing.fromJson(Map<String, dynamic> json) :

        name = json['name'],
        value = json['aproximate_value'],
        categoryId = json['category_id'];

}