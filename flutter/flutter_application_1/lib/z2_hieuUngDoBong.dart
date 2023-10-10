import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyContainerPage(),
    );
  }
}

class MyContainerPage extends StatelessWidget {
  const MyContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container with Shadow'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Màu của bóng
                spreadRadius: 5, // Độ lan rộng của bóng
                blurRadius: 7, // Độ mờ của bóng
                offset: const Offset(0, 3), // Vị trí của bóng
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Container with Shadow',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
