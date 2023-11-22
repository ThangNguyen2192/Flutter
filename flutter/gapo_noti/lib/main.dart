import 'package:flutter/material.dart';

import 'page/loaddata_page.dart';
import 'page/notification_page.dart';
import 'page/search_page.dart';

void main() {
  runApp(const MyApp());
  //readJsonData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loadDataPage,
      routes: routes,
    );
  }
}

LoadDataPage loadDataPage = const LoadDataPage();
NotificationPage notificationPage = const NotificationPage();
SearchPage searchPage = const SearchPage();
Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  "/loadDataPage": (context) => loadDataPage,
  "/notificationPage": (context) => notificationPage,
  "/searchPage": (context) => searchPage
};
