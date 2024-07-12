import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculadora/services/categories_services.dart';
import '../models/categories_model.dart';

class PostTeste extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _postTeste();

}

class _postTeste extends State<PostTeste>{
  Future<Category>? _futureCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PostTeste'),),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: (){
                setState(() {
                  createCategory('TesteApi FInal');
                });
              },
              child: Text('Post'))
        ],
      ),
    );
  }

}