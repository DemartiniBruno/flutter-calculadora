import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculadora/pages/things/things.dart';

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
        title: const Text('Create a new Thing'),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: _nameThing
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number, // -> define o tipo de declado que vai abrir
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly // -> bloqueia para não aceitar letras
                ],
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: _valueThing,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: (){
                    if(_nameThing.text.isEmpty || _valueThing.text.isEmpty){
                      /*
                      * Adicionar validações
                      * */
                      print('Adicionar validações');
                    } else {
                      setState(() async {
                        await createThing(_nameThing.text, _valueThing.text);
                        _nameThing.clear();
                        _valueThing.clear();
                        Navigator.pop(context, true);
                      });
                    }
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