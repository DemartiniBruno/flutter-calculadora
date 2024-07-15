import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculadora/services/categories_services.dart';
import 'package:flutter_calculadora/services/things_services.dart';
import '../../models/things_model.dart';
import '../../models/categories_model.dart';

class DetailThing extends StatefulWidget{
  DetailThing({super.key, required this.thingId });

  final thingId;

  @override
  State<StatefulWidget> createState() => _detailThingState();
}

class _detailThingState extends State<DetailThing>{

  Future<Thing>? _futureThing;
  /*Future<List<Category>>? _futureCategories;*/
  TextEditingController _nome = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureThing = getOneThing(widget.thingId);
    /*_futureCategories = getAllCategories();*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailThing'),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: _futureThing,
              builder: (context, snapshot){
              if(snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                _nome.text = '${snapshot.data!.name}';
                return Column(
                  children: [
                    Text('${snapshot.data!.id}'),
                    TextField(
                      controller: _nome,
                    )
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
              }
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: (){
                    if(_nome.text.isEmpty){
                    } else {
                      setState(() async {
                        await deleteThing(widget.thingId);
                        Navigator.pop(context, true);
                      });
                    }
                  },
                  child: Icon(Icons.delete)
              ),
              ElevatedButton(
                  onPressed: (){
                    if(_nome.text.isEmpty){
                    } else {
                      setState(() async {
                        await updateThing(_nome.text, widget.thingId);
                        Navigator.pop(context, true);
                      });
                    }
                  },
                  child: Icon(Icons.save)
              ),
            ],
          )
        ],
      ),
    );
  }
}