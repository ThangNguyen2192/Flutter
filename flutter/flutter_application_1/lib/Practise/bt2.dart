import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyFlexibleDemo(),
    );
  }
}

class MyFlexibleDemo extends StatelessWidget {
  const MyFlexibleDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible Demo'),
      ),
      body: const Column(
        children: [
          NewWidget(name: "Lẻ", num: 5),
          NewWidget(name: "Hoà CL", num: 3),
          NewWidget(name: "Chẵn", num: 2),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key, required this.name, required this.num});
  final String name;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.black,
      ))),
      height: 50,
      child: Row(
        children: [
          SizedBox(
              width: 80,
              // color: Colors.blue,
              child: Text(
                name,
                style: const TextStyle(fontSize: 20),
              )),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: num,
                  child: Container(
                    height: 17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.pink,
                    ),
                  ),
                ),
                Flexible(
                    flex: 5 - num,
                    child: Container(height: 17, color: Colors.white)),
              ],
            ),
          ),
          Container(
              alignment: Alignment.center,
              width: 80,
              // color: Colors.blue,
              child: Text(
                "$num Lần",
                style: const TextStyle(fontSize: 20),
              )),
        ],
        // children: [
        //   Flexible(
        //       flex: 50, child: Container(color: Colors.red.shade100)),
        //   Flexible(flex: 0, child: Container(color: Colors.yellow)),
        // ],
      ),
    );
  }
}
