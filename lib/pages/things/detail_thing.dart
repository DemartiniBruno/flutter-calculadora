import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculadora/services/things_services.dart';
import '../../models/things_model.dart';

class DetailThing extends StatefulWidget{
  DetailThing({super.key, required this.categoryId });

  final categoryId;

  @override
  State<StatefulWidget> createState() => _detailThingState();
}

class _detailThingState extends State<DetailThing>{

  Future<Thing>? _futureThing;


  @override
  void initState() {
    _futureThing = getOneThing(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailThing'),
      ),
      body: FutureBuilder(
          future: _futureThing,
          builder: (context, snapshot){
          if(snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            return Text('${snapshot.data!.name}');
          } else {
            return CircularProgressIndicator();
          }
          }
      ),
    );
  }
}