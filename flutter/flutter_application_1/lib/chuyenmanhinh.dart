import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Màn hình 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Chuyển từ màn hình 1 đến màn hình 2
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          },
          child: const Text('Chuyển đến Màn hình 2'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Màn hình 2'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Quay lại màn hình trước đó (Màn hình 1)
                Navigator.pop(context);
              },
              child: const Text('Quay lại Màn hình 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // Chuyển sang màn hình 3
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const ThirdScreen(),
                  ),
                );
              },
              child: const Text('Chuyển sang Màn hình 3'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Màn hình 3'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Quay lại màn hình trước đó (Màn hình 1)
            Navigator.pop(context);
          },
          child: const Text('Quay lại Màn hình 2'),
        ),
      ),
    );
  }
}
