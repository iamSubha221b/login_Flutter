import 'package:flutter/material.dart';
import 'package:login_stateful/src/login_bloc/blocs/bloc.dart';


class Provider extends InheritedWidget{


  final bloc = Bloc();
  final blocforotherwidget = Bloc();


  Provider({Key key , Widget child}) : super(key : key,child : child);
  bool updateShouldNotify(_) => true;


  static Bloc of(context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
   // return (context.dependOnInheritedWidgetOfExactType(aspect: Provider) as Provider).bloc;
  }




}

