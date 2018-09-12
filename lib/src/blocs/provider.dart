// DEPENDENCIES
import 'package:flutter/material.dart';
// DEV LIBS
import 'blocs.dart';

class Provider extends InheritedWidget{
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  final bloc = Bloc();

  Provider({Key key, Widget child}):super(key:key, child:child );

  static Bloc of (context){
    // calls up the parent chain from the widget context //
    return(context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}