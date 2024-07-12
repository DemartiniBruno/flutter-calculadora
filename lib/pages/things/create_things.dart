import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/things_services.dart';

class CreateThing extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CreateThing();
}

class _CreateThing extends State<CreateThing>{
  TextEditingController _nameThing = TextEditingController();
  TextEditingController _valueThing = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Create a new Thing'),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: _nameThing
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: _valueThing,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: (){
                    print(_nameThing.text);
                    print(_valueThing.text);
                    setState(() {
                      createThing(_nameThing.text, _valueThing.text);
                      _nameThing.clear();
                      _valueThing.clear();
                    });
                  },
                  child: Text('Cadastrar')
              ),
            ],
          ),
        ),
      ),
    );
  }

}