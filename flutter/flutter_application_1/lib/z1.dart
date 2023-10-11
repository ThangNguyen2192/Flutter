import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 100.0,
              floating: true,
              // pinned: false,
              //snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Search App'),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 50, // Số lượng phần tử danh sách
              ),
            ),
          ],
        ),
      ),
    );
  }
}
