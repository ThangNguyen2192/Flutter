import 'package:flutter/material.dart';

void main(List<String> args) {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 42, top: 51, right: 42),
              // width: 291,
              height: 163,
              color: const Color(0xFF9E3AEC),
            ),
          ],
        ),
      ),
    );
  }
}
