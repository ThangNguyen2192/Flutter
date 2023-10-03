import 'package:flutter/material.dart';
import 'package:flutter_application_1/Practise/login_Messenger/loginPage.dart';
import 'package:flutter_application_1/Practise/login_Messenger/messagePage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

const LoginPage loginPage = LoginPage();
const MessagePage messagePage = MessagePage();
Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  "/loginPage": (context) => loginPage,
  "/messagePage": (context) => messagePage,
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: loginPage, routes: routes);
  }
}
