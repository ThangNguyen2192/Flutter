import 'package:flutter/material.dart';
import 'dart:math';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Chess"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.blue,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8),
            itemCount: 64,
            itemBuilder: (context, index) {
              Color color = Colors.black;
              int hang = ((index + 1) / 8).ceil();

              //kiểm tra trường hợp hàng lẻ, index lẻ thì là Trắng
              //kiẻm tra hàng chẵn, index chẵn thì là Trắng
              if ((hang % 2 != 0 && index % 2 != 0) ||
                  (hang % 2 == 0 && index % 2 == 0)) {
                color = Colors.white;
              }
              return Container(
                color: color,
              );
            },
          ),
        ),
      ),
    );
  }
}
