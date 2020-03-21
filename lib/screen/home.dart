import 'package:flutter/material.dart';
import 'package:miniappflutter/screen/firstPage.dart';
import 'package:miniappflutter/screen/registorPage.dart';
import 'package:firebase_database/firebase_database.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   Widget showlogo(){
    return Image.asset('images/money.png',width: 200,);
  }

  Widget showText(){
    return Container(
      child: Text(
        'Welcome',
         style: TextStyle(
           fontSize:50.0,
           color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),
      ),
    );
  }

  Widget emailText(){
    return Container(
      width: 300.0,
      child: TextFormField(
        //controller: textEditController,
        decoration: InputDecoration(
          icon: Icon(Icons.people,
          size: 30.0,
          color: Colors.deepOrangeAccent,
          ),
          labelText: 'Username',
          hintText: 'your@email.com'
        ),
        style: TextStyle(
          fontSize:18.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
        ),
      ),
    );
  }
  
  Widget passText(){
    return Container(
      width: 300.0,
      child: TextFormField(
        obscureText: true,
        //controller: textEditController1,
        decoration: InputDecoration(
          icon: Icon(Icons.vpn_key,
          size : 30.0,
          color: Colors.deepOrangeAccent,
          ),
          labelText: 'Password',
          hintText: 'more 8 charactor'
        ),
        style: TextStyle(
          fontSize:18.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
        ),
      ),
    );
  }
  Widget buttonlogin(){
    return Container(
      width: 150.0,
      height: 50.0,
      child: RaisedButton.icon(
        color: Colors.deepOrangeAccent,
        icon: Icon(Icons.account_circle ,
        size: 30.0,
      ),
      label: Text('LOGIN',style: TextStyle(
           fontSize:15.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),),
      onPressed: (){
        var route = MaterialPageRoute(
            builder: (BuildContext context) => FirstPage()
          );
          Navigator.of(context).push(route);
      },
    ),
    );
  }
  Widget buttonrigis(){
    return Container(
      width: 150.0,
      height: 50.0,
      child: RaisedButton.icon(
        color: Colors.deepOrangeAccent,
        icon: Icon(Icons.person_add,
        size: 30.0,
      ),
      label: Text('RIGISTOR',style: TextStyle(
           fontSize:15.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),),
      onPressed: (){
        var route = MaterialPageRoute(
            builder: (BuildContext context) => RegistorPage()
          );
          Navigator.of(context).push(route);
      },
    ),
    );
  }

   Widget blocklogin(){
    return Container(
      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [Colors.lightBlue[400], Colors.tealAccent[400]])),
        child: Container(
          width: 350.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[showText(),emailText(),passText(),Text('\n'),button()],
          ),
          ),
            
    );
  }

  Widget button(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buttonlogin(),Text('  '),
        buttonrigis()
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/backg.jpg'),fit: BoxFit.fill)),
          child: Center(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showlogo(),
              blocklogin()
            ],
          ),),
        ),
        ),
    );
  }
}