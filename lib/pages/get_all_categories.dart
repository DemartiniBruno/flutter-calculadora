import 'package:flutter/material.dart';
import '../models/categories_model.dart';
import '../services/categories_services.dart';

class GetAllCategories extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _getAllCategories();

}

class _getAllCategories extends State<GetAllCategories>{
  Future<List<Category>>? _futureCategories;

  @override
  void initState() {
    _futureCategories = getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetAllCategories'),
      ),
      body: FutureBuilder<List<Category>?>(
        future: _futureCategories,
        builder: (context, snapshot) {
        if (snapshot.hasData &&
        snapshot.connectionState == ConnectionState.done) {
        return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
        return Text('${snapshot.data?[index].title}');
        },
        );
        }

    /// handles others as you did on question
    else {
    return CircularProgressIndicator();
    }
    },





      /*FutureBuilder(
        future: _futureCategories,
        builder: (context, snapshot){
          if(snapshot.hasData){
            ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Text('${snapshot.data?[index]}');
              }
            );
            //return Text('${snapshot.data!}');
          } else if (snapshot.hasError){
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),*/
      /*body: FutureBuilder(
        future: _futureCategories,
        builder: (context, snapshot){
          return Container(
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Text('${snapshot.data!}');
              }
            ),
          );
        },
      ),*/
      )
    );
  }
}