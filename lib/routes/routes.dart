import 'package:flutter/material.dart';
import 'package:todo_bloc_firebase/constants/constants.dart';
import 'package:todo_bloc_firebase/template/add_data_screen.dart';
import 'package:todo_bloc_firebase/template/view_data_screen.dart';

class AppRoutes{
  static Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case kViewData:return MaterialPageRoute(
          builder:(_)=>  const ViewDataScreen()
      );
      case kAddData:return MaterialPageRoute(
        builder: (_)=>  AddDataScreen()
      );
      default: return null;
    }
  }
}