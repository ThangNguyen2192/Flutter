import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
      ),
      body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[100],
                    child: const Text("He'd have you all unravel at the"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[200],
                    child: const Text('Heed not the rabble'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[300],
                    child: const Text('Sound of screams but the'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[400],
                    child: const Text('Who scream'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[500],
                    child: const Text('Revolution is coming...'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[600],
                    child: const Text('Revolution, they...'),
                  ),
                ],
              ),
            ),
          ],
          ),
      // body: GridView.count(
      //   primary: false,
      //   padding: const EdgeInsets.all(20),
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      //   crossAxisCount: 3,
      //   children: <Widget>[
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[100],
      //       child: const Text("He'd have you all unravel at the"),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[200],
      //       child: const Text('Heed not the rabble'),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[300],
      //       child: const Text('Sound of screams but the'),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[400],
      //       child: const Text('Who scream'),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[500],
      //       child: const Text('Revolution is coming...'),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[600],
      //       child: const Text('Revolution, they...'),
      //     ),
      //     const Text("1fddsfdsf"),
      //     const Text("2fddsfdsf"),
      //     const Text("3fddsfdsf"),
      //     const Text("4fddsfdsf"),
      //   ],
      // ),
    );
  }
}
