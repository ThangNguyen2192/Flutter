import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

void main(List<String> args) {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const _Page1(),
      routes: {
        "/page1": (context) => const _Page1(),
        "/page2": (context) => const _Page2()
      },
    );
  }
}

class _Page1 extends StatelessWidget {
  const _Page1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/1.png"),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/page2");
              },
              child: const Text(
                "Page 1",
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  const _Page2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/page1");
          },
          child: const Text(
            "Page 222222222",
          ),
        ),
      ),
    );
  }
}


  // Navigator.of(context).push(
  //             MaterialPageRoute<void>(
  //               builder: (BuildContext context) => const _Page2(),
  //               settings: const RouteSettings(
  //                 arguments: "Argument"
  //               )
  //             ),
  //           );
