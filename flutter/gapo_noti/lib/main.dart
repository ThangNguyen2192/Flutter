import 'package:flutter/material.dart';
import 'package:gapo_noti/search_page.dart';

import 'notification_page.dart';

void main() {
  runApp(const MyApp());
  //readJsonData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NotificationPage(),
      routes: routes,
    );
  }
}

NotificationPage notificationPage = const NotificationPage();
SearchPage searchPage = const SearchPage();
Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  "/notificationPage": (context) => notificationPage,
  "/searchPage": (context) => searchPage
};
