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
          title: const Text('Pull to Load GridView'),
        ),
        body: const PullToLoadDemo(),
      ),
    );
  }
}

class PullToLoadDemo extends StatefulWidget {
  const PullToLoadDemo({super.key});

  @override
  _PullToLoadDemoState createState() => _PullToLoadDemoState();
}

class _PullToLoadDemoState extends State<PullToLoadDemo> {
  List<String> items = List.generate(20, (index) => 'Item $index');
  bool _loading = false;

  Future<void> _loadMoreData() async {
    // Simulate loading more data by adding a delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _loading = false;
      items.addAll(List.generate(20, (index) => 'Item ${items.length}'));
    });
  }

  Future<void> _onRefresh() async {
    // Simulate refreshing by adding a delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      items.clear();
      items = List.generate(20, (index) => 'Item $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns here
        ),
        itemCount: items.length + 1, // Add 1 to display the loading indicator
        itemBuilder: (context, index) {
          if (index < items.length) {
            return Card(
              child: Center(
                child: Text(items[index]),
              ),
            );
          } else if (_loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            _loading = true;
             _loadMoreData();
           

            return const SizedBox();
          }
        },
      ),
    );
  }
}
