class IotModel{
  String credit1,user,pass;
  int pushbutton=0;

  IotModel(
    this.credit1,this.pushbutton,this.user,this.pass
  );

  IotModel.formMap(Map<dynamic,dynamic>map){
    credit1=map['credit'];
    pushbutton=map['pushbutton'];
    user=map['user'];
    pass=map['pass'];
    
  }

  Map<dynamic,dynamic> toMap(){
    final Map<dynamic,dynamic> map = Map<dynamic,dynamic>();
    map['credit']=credit1;
    map['pushbutton']=pushbutton;
    map['user']=user;
    map['pass']=pass;

    return map;
  }

}