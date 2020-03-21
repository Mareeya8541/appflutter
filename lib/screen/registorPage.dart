import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miniappflutter/screen/home.dart';
import 'package:firebase_database/firebase_database.dart';

class RegistorPage extends StatefulWidget {
  @override
  _RegistorPageState createState() => _RegistorPageState();
}

class _RegistorPageState extends State<RegistorPage> {

  var firstName = new TextEditingController();
  var lastName = new TextEditingController();
  var tell = new TextEditingController();
  var userName = new TextEditingController();
  var pass = new TextEditingController();
   
  // final formKey=GlobalKey<FormState>();
  // String firstString,lastString,userString,passString;

  // Widget uploadButton(BuildContext context){
  //   return IconButton(icon: Icon(Icons.cloud_upload),
  //    onPressed:(){
  //      if(formKey.currentState.validate()){
  //        formKey.currentState.save();
  //      }
  //    }
  //    );
  // }
  

  Widget showlogo(){
    return Image.asset('images/money.png',width: 170,);
  }

   Widget firstname(){
    return Container(
      width: 300.0,
      child: TextFormField(
        controller: firstName,
        decoration: InputDecoration(
          labelText: 'FirstName',
          hintText: 'Your Firstname'
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

  Widget lastname(){
    return Container(
      width: 300.0,
      child: TextFormField(
        controller: lastName,
        decoration: InputDecoration(
          labelText: 'LastName',
          hintText: 'Your Lastname'
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

  Widget mytell(){
    return Container(
      width: 300.0,
      child: TextFormField(
        controller: tell,
        decoration: InputDecoration(
          labelText: 'Tellephone ',
          hintText: 'Number only'
        ),inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        maxLines: null,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize:18.0,
           //color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
        ),
      ),
    );
  }

  Widget username(){
    return Container(
      width: 300.0,
      child: TextFormField(
        controller: userName,
        decoration: InputDecoration(
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

  Widget password(){
    return Container(
      width: 300.0,
      child: TextFormField(
        obscureText: true,
        controller: pass,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password'
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

   Widget blocklogin(){
    return Container(
      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [Colors.lightBlue[400], Colors.tealAccent[400]])),
        child: Container(
          width: 400,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              firstname(),lastname(),mytell(),username(),password(),Text('\n'),buttonregis(),
            ],
          ),
          ),
            
    );
  }

  Widget buttonregis(){
    return Container(
      width: 300.0,
      height: 60.0,
      child: RaisedButton.icon(
        color: Colors.deepOrangeAccent,
        icon: Icon(Icons.person_add,
        size: 30.0,
      ),
      label: Text('Confirm Registration'
      ,style: TextStyle(
           fontSize:18.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),),
      onPressed: (){
        var route = MaterialPageRoute(
            builder: (BuildContext context) => Home()
          );
          Navigator.of(context).push(route);
      },
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registor',
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
             showlogo(),
             blocklogin(),
            ],
          ),),
      ),
    );
  }
}