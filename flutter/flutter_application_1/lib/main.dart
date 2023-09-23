import 'package:flutter/material.dart';

void main() {
  runApp(const TestScaffold());
}

class TestScaffold extends StatelessWidget {
  const TestScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          leading: const BackButton(),
          title: const Text("AppBar1234"),
          actions: [
            TextButton(
                onPressed: () {
                  print('onAction');
                },
                child: const Icon(
                  Icons.access_alarm,
                  size: 32,
                  color: Colors.greenAccent,
                )
                // const Text("Action", style: TextStyle(color: Colors.black)))
                )
          ],
        ),
        body: Center(
          child: Container(
            width: 1000,
            height: 1000,
            color: Colors.teal,
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
                child: const Center(
                  child: Text(
                    'Inside Container shape circle',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          // child: Image(
          //   image: NetworkImage(
          //       'https://haycafe.vn/wp-content/uploads/2023/01/Hinh-anh-thien-nhien-dep-nhat.jpeg'),
          //   height: 300,
          // ),
          // child: Icon(
          //   Icons.accessibility_new_sharp,
          //   color: Colors.pink,
          //   size: 80,
          // ),
          // child: Text(
          //   "body",
          //   style: TextStyle(fontSize: 40, color: Colors.blue),
          // ),
        ),
      ),
    );
  }
}
