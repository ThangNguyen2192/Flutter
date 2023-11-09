import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Modal Bottom Sheet Example'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'This is the bottom sheet content',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text('Open Bottom Sheet'),
          ),
        ),
      ),
    );
  }
}
