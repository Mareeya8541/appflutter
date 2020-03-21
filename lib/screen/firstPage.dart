import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battery Charger',
         style: TextStyle(
           fontSize:30.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Lobster-Regular'
      ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/backg.jpg'),fit:BoxFit.cover )),
          child: Center(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
             
            ],
          ),),
      ),
    );
  }
}