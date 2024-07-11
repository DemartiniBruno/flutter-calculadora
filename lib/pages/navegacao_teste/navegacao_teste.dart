import 'package:flutter/material.dart';

class NavegacaoTeste extends StatefulWidget {
  const NavegacaoTeste({super.key, required this.nomeBotao});

  final String nomeBotao;

  @override
  State<StatefulWidget> createState() => _NavegacaoTeste();
}

class _NavegacaoTeste extends State<NavegacaoTeste>{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.nomeBotao),
        ),
        body: Center(
          child: Text(
            widget.nomeBotao
          ),
        ),
      ),
    );
  }
}
