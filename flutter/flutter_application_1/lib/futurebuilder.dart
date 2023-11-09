import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Future Builder"),
        ),
        body: Center(
          child: FutureBuilder(
            future: testDelay(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.active) {
                return const Text("....");
              } else {
                if (snapshot.hasData) {
                  return Text("Success: ${snapshot.data}");
                } else {
                  return Text("Error: ${snapshot.data}");
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Future testDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    return "ok";
  }
}
