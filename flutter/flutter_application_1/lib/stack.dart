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
          appBar: AppBar(
            title: const Text('Stack'),
          ),
          body: const MyStack()),
    );
  }
}

class MyStack extends StatelessWidget {
  const MyStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 190,
          color: Colors.yellow,
        ),
        Container(
          width: 279,
          height: 140,
          color: Colors.pink,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
        const Icon(
          Icons.link,
          size: 40,
        ),
        Center(
          child: Container(
            color: Colors.red,
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 100,
              height: 100,
              // color: Colors.green,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.black), //them boder
                borderRadius: const BorderRadius.all(
                    Radius.circular(20)), // bo 4 góc 20px
                color: Colors.green,
              ),
            ),
          ),
        )
      ],
    );
  }
}
