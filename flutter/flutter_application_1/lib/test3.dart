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
          title: const Text('Positioned Widget Example'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
            ),
            Positioned(
              top: 10, // Distance from the top
              left: 0, // Distance from the left
              child: Container(
                color: Colors.red,
                width: 100,
                height: double.maxFinite,
              ),
            ),
            Positioned(
              bottom: 20, // Distance from the bottom
              right: 40, // Distance from the right
              child: Container(
                color: Colors.green,
                width: 120,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
