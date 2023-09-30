import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  List<Container> createItems(int num) {
    List<Container> list = [];
    for (int i = 0; i < num; i++) {
      Container container = Container(
        color: (i % 2 == 0) ? Colors.blue : Colors.yellow,
        height: 100,
        alignment: Alignment.center,
        child: Text(
          i.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      );
      list.add(container);
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: createItems(1000),
        ),
      ),
    );
  }
}
