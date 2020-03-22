import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class IotModel{
  String credit1;

  IotModel(
    this.credit1
  );

  IotModel.formMap(Map<dynamic,dynamic>map){
    credit1=map['credit'];
    
  }

  Map<dynamic,dynamic> toMap(){
    final Map<dynamic,dynamic> map = Map<dynamic,dynamic>();
    map['credit']=credit1;

    return map;
  }

}