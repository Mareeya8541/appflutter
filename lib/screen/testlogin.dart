import 'package:flutter/material.dart';
import 'package:miniappflutter/screen/firstPage.dart';
import 'package:miniappflutter/screen/iot_model.dart';
import 'package:firebase_database/firebase_database.dart';

class Testlogin extends StatefulWidget {
  final String valueFromRigisPage;
  final String valueFromRigisPage1;
  Testlogin({Key key,this.valueFromRigisPage,this.valueFromRigisPage1});
  @override
  _TestloginState createState() => _TestloginState();
}

class _TestloginState extends State<Testlogin> {
 IotModel iotModel;
 String user="",pass="",bottoncheck;
 int bottoncheckInt;

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
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('bc');
     Map<dynamic,dynamic> map = Map();
     map['user']=user;
     map['pass']=pass;
     await databaseReference.set(map).then((response){
       print('Edit Success');
     });
  
  }

  Widget showText(){
    readData();
    return Container(
      child: Text(
        user,
         style: TextStyle(
           fontSize:50.0,
           color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),
      ),
    );
  }

  Widget showpass(){
    readData();
    return Container(
      child: Text(
        pass,
         style: TextStyle(
           fontSize:50.0,
           color:Colors.deepOrange,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),
      ),
    );
  }


  Widget myemail(){
    return Text("Email: ${widget.valueFromRigisPage}");
  }
  Widget mypass(){
    return Text("Password: ${widget.valueFromRigisPage1}");
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



  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginTest'),
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/backg.jpg'))),
          child: Center(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              myemail(),mypass(),showText(),showpass(),
            ],
          ),),
      ),
    );
  }
}