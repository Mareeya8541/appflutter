import 'package:flutter/material.dart';
import 'package:miniappflutter/screen/firstPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:miniappflutter/screen/iot_model.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   IotModel iotModel;
   var myemail = new TextEditingController();
  var mypass = new TextEditingController();
  String user="",pass="",credit1;
  int pushbutton;
 FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

 void initState() {
    super.initState();
    readData();
    
  }

   Future <void> readData() async {
    print('Read Data Work');
    DatabaseReference databaseReference = firebaseDatabase.reference().child('bc');
    await databaseReference.once().then((DataSnapshot dataSnapshot){
      print('data=>${dataSnapshot.value.toString()}');//ทุกอย่างใน document ถูกอ่านหมดเลย
      iotModel=IotModel.formMap(dataSnapshot.value);
      user=iotModel.user;
      pass=iotModel.pass;
      credit1=iotModel.credit1;
      pushbutton=iotModel.pushbutton;
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('bc');
     Map<dynamic,dynamic> map = Map();
     map['user']=user;
     map['pass']=pass;
     map['credit']=credit1;
     map['pushbutton']=pushbutton;
     await databaseReference.set(map).then((response){
       print('Edit Success');
     });
  
  }

   Widget showlogo(){
    return Image.asset('images/money.png',width: 200,);
  }

  Widget showText(){
    return Container(
      child: Text(
        'Battery Charger',
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
        controller: myemail,
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
        controller: mypass,
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

   generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
 }

  // Widget buttonlogin(){
  //   return Container(
  //     width: 150.0,
  //     height: 50.0,
  //     child: RaisedButton.icon(
  //       color: Colors.deepOrangeAccent,
  //       icon: Icon(Icons.account_circle ,
  //       size: 30.0,
  //     ),
  //     label: Text('LOGIN',style: TextStyle(
  //          fontSize:15.0,
  //          color:Colors.black,
  //          fontWeight:FontWeight.bold,
  //          fontFamily: 'Righteous-Regular'
  //     ),),
  //     onPressed: (){
  //       var route = MaterialPageRoute(
  //           builder: (BuildContext context) => FirstPage()
  //         );
  //         Navigator.of(context).push(route);
  //     },
  //   ),
  //   );
  // }
  Widget buttonlogin(){
    readData();
    return Container(
      width: 300.0,
      height: 50.0,
      child: RaisedButton.icon(
        color: Colors.deepOrangeAccent,
        icon: Icon(Icons.account_circle,
        size: 30.0,
      ),
      label: Text('LOGIN',style: TextStyle(
           fontSize:15.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),),
      onPressed: (){if(generateMd5(mypass.text)==pass&&myemail.text==user){
        var route = MaterialPageRoute(
            builder: (BuildContext context) => FirstPage(
              // valueFromRigisPage: myemail.text,
              // valueFromRigisPage1: generateMd5(mypass.text),

            )
          );
          Navigator.of(context).push(route);
      }editDatabase();},
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
          width: 450.0,
          padding: EdgeInsets.all(16.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[showText(),emailText(),passText(),Text('\n'),buttonlogin()],
          ),
          ),
            
    );
  }

  // Widget button(){
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: <Widget>[
  //       buttonlogin(),Text('  '),
  //       buttonrigis()
  //     ],
  //   );
  // }
  
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
              blocklogin(),
            ],
          ),),
        ),
        ),
    );
  }
}