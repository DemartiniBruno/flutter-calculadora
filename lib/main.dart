import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculadora/pages/navegacao_teste/navegacao_teste.dart';
import 'package:flutter_calculadora/pages/post_teste.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Calculadora(title: 'teste2'),
    );
  }
}

/*class Pavlova extends StatelessWidget{
  const Pavlova({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('teste')
      ),
      body: Container(
        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SizedBox(
                width: 200,
                child: TextField(

                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      TextButton(
                        onPressed: (){},
                        child: Text('9')
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text('9')
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text('9')
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: (){},
                        child: Text('9')
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text('9')
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text('9')
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: (){},
                        child: Text('9')
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text('9')
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text('9')
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}*/

class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.title});
    final String title;

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {

  TextEditingController valorOperacaoController = TextEditingController();
  
  int _valorAtual = 0;
  String _valorDigitado = '';
  int _valorOperacao = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('teste')
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SizedBox(
                width: 200,
                child: Text(
                  textAlign: TextAlign.end,
                  '$_valorDigitado'
                ),
                ),
              ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorDigitado+='1';
                            });
                          },
                          child: Text('1')
                      ),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorDigitado+='4';
                            });
                          },
                          child: Text('4')
                      ),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorDigitado+='7';
                            });
                          },
                          child: Text('7')
                      ),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorDigitado+='0';
                            });
                          },
                          child: Text('0')
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorDigitado+='2';
                            });
                          },
                          child: Text('2')
                      ),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorDigitado+='5';
                            });
                          },
                          child: Text('5')
                      ),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorDigitado+='8';
                            });
                          },
                          child: Text('8')
                      ),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorOperacao+= int.parse(_valorDigitado);
                              print(_valorOperacao);
                              _valorDigitado='';
                            });
                          },
                          child: Text('+')
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorDigitado+='3';
                            });
                          },
                          child: Text('3')
                      ),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorDigitado+='6';
                            });
                          },
                          child: Text('6')
                      ),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorDigitado+='9';
                            });
                          },
                          child: Text('9')
                      ),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              _valorOperacao+= int.parse(_valorDigitado);
                              _valorDigitado= '$_valorOperacao';
                              _valorOperacao = 0;
                            });
                          },
                          child: Text('=')
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: (){
                        setState(() {
                          _valorDigitado = '';
                          _valorOperacao = 0;
                        });
                      },
                      child: Text('cc')
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NavegacaoTeste(nomeBotao: 'Nomeado',))
                      );
                    },
                    child: Text('Nav'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PostTeste())
                      );
                    },
                    child: Text('Post'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}