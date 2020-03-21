import 'package:flutter/material.dart';
import 'package:miniappflutter/screen/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      title: 'test1',
      debugShowCheckedModeBanner: false,
      home: Home(),
      
    );
  }
}