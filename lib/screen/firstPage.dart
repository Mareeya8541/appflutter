import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:miniappflutter/screen/iot_model.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  IotModel iotModel;
  int a=1,door1Int,fiveminute,tenminute,creditint,fifteenminute,twentyminute,pushbutton;
  String door1,credit1="Please to Refresh",fivemin="5 Baht \n5 minutes",tenmin="10 Baht \n10 minutes",fifteenmin="15 Baht \n15 minutes",
  twentymin="20 Baht \n20 minutes";
  String user="",pass="";

  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  @override
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
      credit1=iotModel.credit1;
      pushbutton=iotModel.pushbutton;
      user=iotModel.user;
      pass=iotModel.pass;
    });
   
  }


  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('bc');
     Map<dynamic,dynamic> map = Map();
     map['credit']=credit1;
     map['pushbutton']=pushbutton;
     map['user']=user;
     map['pass']=pass;
     await databaseReference.set(map).then((response){
       print('Edit Success');
     });
  
  }

  Widget showcredit(){
  
    return Text(credit1.toString(),style: TextStyle(fontSize:30.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
           ),);
  }
  Widget credit(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[coin(),
        Text('\t\t\t'),
        showcredit()
      ],
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
      label: Text('Refresh',style: TextStyle(
           fontSize:15.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),),
      onPressed: (){
        var route = MaterialPageRoute(
            builder: (BuildContext context) => FirstPage(
            )
          );
          Navigator.of(context).push(route);
      },
    ),
    );
  }

  Widget bottonDoor1(){
    return Container(
      padding: new EdgeInsets.all(16.0),
      child: SizedBox(
        height: 60,
        width: 60,
        child:  RaisedButton.icon(
          color: Colors.teal[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
          ),
          onPressed: (){
            setState(() {
              door1Int=door1Int;
              if(door1Int==0){
                door1Int=1;
                //door1="";
                credit1=iotModel.credit1;
              }
              else {
                door1Int=0;
               // door1="";
                credit1=iotModel.credit1;
              }
              //print('$door1Int');
              readData();
             
            });
          },
          icon: Icon(Icons.refresh),
          label: Text(''),
          ),
      ),
    );
  }

  Widget botton5baht(){
    return Container(
      padding: new EdgeInsets.all(16.0),
      child: SizedBox(
        height: 100,
        width: 250,
        child:  RaisedButton.icon(
          color: Colors.green[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          onPressed: (){
            setState(() {
              fiveminute=fiveminute;
              if(fiveminute==0){
                //fiveminute=1;
               // fivemin="5 Baht \n10 minutes";
                //credit1=iotModel.credit1;
                readData();
                creditint =int.parse(credit1)-5;
                if(creditint<0){
                  creditint=0;
                }
                credit1=(creditint).toString();
                pushbutton=5;
              }
              else {
               fiveminute=0;
               //fivemin="5 Baht \n10 minutes";
                //credit1=iotModel.credit1;
                readData();
                creditint =int.parse(credit1)-5;
                if(creditint<0){
                  creditint=0;
                }
                credit1=(creditint).toString();
                pushbutton=5;

              }
              print('$fiveminute');
              editDatabase();
              readData();
             
            });
          },
          icon: Icon(Icons.money_off),
          label: Text('$fivemin',style: TextStyle(
           fontSize:20.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),),
          ),
      ),
    );
  }

  Widget botton10baht(){
    return Container(
      padding: new EdgeInsets.all(16.0),
      child: SizedBox(
        height: 100,
        width: 250,
        child:  RaisedButton.icon(
          color: Colors.green[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          onPressed: (){
            setState(() {
              tenminute=tenminute;
              if(tenminute==0){
                //fiveminute=1;
               // fivemin="5 Baht \n10 minutes";
               // credit1=iotModel.credit1;
                readData();
                creditint =int.parse(credit1)-10;
                if(creditint<0){
                  creditint=0;
                }
                credit1=(creditint).toString();
                pushbutton=10;
              }
              else {
               tenminute=0;
               //fivemin="5 Baht \n10 minutes";
                //credit1=iotModel.credit1;
                readData();
                creditint =int.parse(credit1)-10;
                if(creditint<0){
                  creditint=0;
                }
                credit1=(creditint).toString();
                pushbutton=10;
              }
              print('$tenminute');
              editDatabase();
              //readData();
             
            });
          },
          icon: Icon(Icons.money_off),
          label: Text('$tenmin',style: TextStyle(
           fontSize:20.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),),
          ),
      ),
    );
  }

  Widget cutcoin(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[botton5baht(),
        Text('\t'),
        botton10baht()
      ],
    );
  }

  Widget botton15baht(){
    return Container(
      padding: new EdgeInsets.all(16.0),
      child: SizedBox(
        height: 100,
        width: 250,
        child:  RaisedButton.icon(
          color: Colors.blue[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          onPressed: (){
            setState(() {
              fifteenminute=fifteenminute;
              if(fifteenminute==0){
                //fiveminute=1;
               // fivemin="5 Baht \n10 minutes";
               // credit1=iotModel.credit1;
                readData();
                creditint =int.parse(credit1)-15;
                if(creditint<0){
                  creditint=0;
                }
                credit1=(creditint).toString();
                pushbutton=15;
              }
              else {
               fifteenminute=0;
               //fivemin="5 Baht \n10 minutes";
                //credit1=iotModel.credit1;
                readData();
                creditint =int.parse(credit1)-15;
                if(creditint<0){
                  creditint=0;
                }
                credit1=(creditint).toString();
                pushbutton=15;
              }
              print('$fifteenminute');
              editDatabase();
              //readData();
             
            });
          },
          icon: Icon(Icons.money_off),
          label: Text('$fifteenmin',style: TextStyle(
           fontSize:20.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),),
          ),
      ),
    );
  }

  Widget botton20baht(){
    return Container(
      padding: new EdgeInsets.all(16.0),
      child: SizedBox(
        height: 100,
        width: 250,
        child:  RaisedButton.icon(
          color: Colors.blue[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          onPressed: (){
            setState(() {
              twentyminute=twentyminute;
              if(twentyminute==0){
                //fiveminute=1;
               // fivemin="5 Baht \n10 minutes";
               // credit1=iotModel.credit1;
                readData();
                creditint =int.parse(credit1)-20;
                if(creditint<0){
                  creditint=0;
                }
                credit1=(creditint).toString();
                pushbutton=20;
              }
              else {
               twentyminute=0;
               //fivemin="5 Baht \n10 minutes";
                //credit1=iotModel.credit1;
                readData();
                creditint =int.parse(credit1)-20;
                if(creditint<0){
                  creditint=0;
                }
                credit1=(creditint).toString();
                pushbutton=20;
              }
              print('$twentyminute');
              editDatabase();
              //readData();
             
            });
          },
          icon: Icon(Icons.money_off),
          label: Text('$twentymin',style: TextStyle(
           fontSize:20.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Righteous-Regular'
      ),),
          ),
      ),
    );
  }

  Widget cutcoin1(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[botton15baht(),
        Text('\t'),
        botton20baht()
      ],
    );
  }


  Widget coin(){
    return Image.asset('images/coin.png',width: 30,);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battery Charger',
         style: TextStyle(
           fontSize:35.0,
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontFamily: 'Lobster-Regular'
      ),
        ),actions: <Widget>[bottonDoor1()],
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/backg.jpg'),fit:BoxFit.cover )),
          child: Center(child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('',style: TextStyle(
           fontSize:40.0)),
             credit(),
             Text('',style: TextStyle(
           fontSize:40.0)),
           cutcoin(),cutcoin1()
            ],
          ),),
      ),
    );
  }
}