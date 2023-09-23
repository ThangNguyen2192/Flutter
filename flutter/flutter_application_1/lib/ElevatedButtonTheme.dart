import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor:
                Colors.blue, // Set the default text color for ElevatedButtons
            elevation: 5, // Set the default elevation
            // You can set more properties here like padding, textStyle, etc.
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ElevatedButtonTheme Example'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {},
                  child: const Text('ElevatedButton 1'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ElevatedButton 2'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
