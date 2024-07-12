import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NavegacaoTeste extends StatefulWidget {
  const NavegacaoTeste({super.key, required this.nomeBotao});

  final String nomeBotao;

  @override
  State<StatefulWidget> createState() => _NavegacaoTeste();
}

class _NavegacaoTeste extends State<NavegacaoTeste>{
  late Future<Album> futureAlbum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum=fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.nomeBotao),
        ),
/*        body: Center(
          child: Text(
            widget.nomeBotao
          ),*/
          body: FutureBuilder(
            future: futureAlbum,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError){
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            }
          ),
        ),
      );
  }
}

/*
*
*
*
* */

class Album {
  final int id;
  final String title;

  const Album({
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
      } =>
        Album(
          id: id,
          title: title,
        ),
       _ => throw const FormatException('Failed to load album.'),
    };
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(
        Uri.parse('http://192.168.3.221:3000/categories/1'),
        headers: {
          HttpHeaders.authorizationHeader: '',
        }
      );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


/*
*
*
* */