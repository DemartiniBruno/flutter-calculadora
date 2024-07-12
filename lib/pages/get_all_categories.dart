import 'package:flutter/material.dart';
import '../models/categories_model.dart';
import '../services/categories_services.dart';

class GetAllCategories extends StatefulWidget {
  const GetAllCategories({super.key});

  @override
  State<StatefulWidget> createState() => _getAllCategories();
}

class _getAllCategories extends State<GetAllCategories> {
  Future<List<Category>>? _futureCategories;

  @override
  void initState() {
    super.initState();
    _futureCategories = getAllCategories();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Things'),
      ),
      body: FutureBuilder<List<Category>>(
        future: _futureCategories,
        builder: (context, snapshot){
          if(snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text('${snapshot.data?[index].id}: '),
                      Text('${snapshot.data?[index].title}'),
                    ],
                  );
/*                return Row(
                  children: [
                    Text('${snapshot.data?[index].name}'),
                    Text('${snapshot.data?[index].aproximate_value}'),
                  ],
                );*/
                }
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );

    /*return Scaffold(
        appBar: AppBar(
          title: Text('GetAllCategories'),
        ),
        body: Center(
          child: Container(
            color: Colors.red,
            child: FutureBuilder<List<Category>?>(
              future: _futureCategories,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    color: Colors.amberAccent,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.green,
                            child: Center(
                                child: TextButton(
                                    onPressed: (){},
                                    child: Text('${snapshot.data?[index].title}')
                                ),
                            ),
                        );
                      },
                    ),
                  );
                }

                /// handles others as you did on question
                else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ));*/
  }
}
