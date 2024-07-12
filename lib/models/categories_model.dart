class Category {
  String title;

  Category.fromJson(Map<String, dynamic> json) :
      title = json['title'];
}