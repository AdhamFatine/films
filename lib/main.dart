import 'package:films/AddFilm.dart';
import 'package:films/Home.dart';
import 'package:flutter/material.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Films',
      home: Home(),
      routes: {
        "addfilm":(context)=>AddFilm()
      },
    );
  }
}

