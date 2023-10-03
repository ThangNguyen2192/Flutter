import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyTabBarDemo(),
    );
  }
}

class MyTabBarDemo extends StatelessWidget {
  const MyTabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Demo'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Tab 1 Content'),
            ),
            Center(
              child: Text('Tab 2 Content'),
            ),
          ],
        ),
      ),
    );
  }
}
