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
          title: const Text('Pull to Reset GridView'),
        ),
        body: const PullToResetDemo(),
      ),
    );
  }
}

class PullToResetDemo extends StatefulWidget {
  const PullToResetDemo({super.key});

  @override
  _PullToResetDemoState createState() => _PullToResetDemoState();
}

class _PullToResetDemoState extends State<PullToResetDemo> {
  List<String> items = List.generate(30, (index) => 'Item $index');
  bool _resetting = false;

  Future<void> _resetData() async {
    // Simulate resetting data by adding a delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _resetting = false;
      print("v");
      items = List.generate(30, (index) => 'Item $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _resetting = true;
        });
        await _resetData();
      },
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns here
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}
