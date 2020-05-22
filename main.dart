import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "SUPERHEROES",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.yellow
        ),
        body: new Container(
          child: new Center(
              child: new FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('json_assets/superheroes.json'),
                  builder: (context, snapshot) {
                    var jsonData = json.decode(snapshot.data.toString());
                    return new ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return new Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            jsonData[index]["img"]))),
                              ),
                              new Text(""),
                              new Text("SuperHeroe: " +
                                  jsonData[index]["superheroe"]),
                              new Text(""),
                              new Text("Nombre: " +
                                  jsonData[index]["identidad_secreta"]),
                              new Text(""),
                              new Text("Edad: " + jsonData[index]["edad"]),
                              new Text(""),
                              new Text("Altura: " + jsonData[index]["altura"]),
                              new Text(""),
                              new Text("Genero: " + jsonData[index]["genero"]),
                              new Text(""),
                              new Text("Descripcion: " +
                                  jsonData[index]["descripcion"]),
                              new Text(""),
                            ],
                          ),
                        );
                      },
                      itemCount: jsonData == null ? 0 : jsonData.length,
                    );
                  })),
        ));
  }
}