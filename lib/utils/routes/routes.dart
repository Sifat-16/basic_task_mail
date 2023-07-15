
import 'package:basic_task_mail/presentation/views/message_page.dart';
import 'package:basic_task_mail/presentation/views/sign_in_page.dart';
import 'package:basic_task_mail/presentation/views/signup_page.dart';
import 'package:basic_task_mail/utils/routes/route_names.dart';
import 'package:flutter/material.dart';


class Routes{
  static Route<dynamic> generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case RouteNames.sign_up:
        return MaterialPageRoute(builder: (_)=> SignUpPage());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_)=> SignInPage());
      case RouteNames.message:
        return MaterialPageRoute(builder: (_)=> MessagePage());
      default:
        return MaterialPageRoute(builder: (_)=>const Scaffold(
          body: Center(
            child: Text("No Page Available"),
          ),
        ));
    }
  }
}