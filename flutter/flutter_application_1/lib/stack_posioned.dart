import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text(
                "Stacked Squares",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
            body: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 150,
                  child: Container(
                    //width: double.infinity,
                    height: 150,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 150,
                  right: 0,
                  child: Container(
                    width: 150,
                    //height: 50,
                    color: Colors.amber,
                    child: const Center(
                      child: Text("2",
                          style: TextStyle(color: Colors.white, fontSize: 50)),
                    ),
                  ),
                ),
                Positioned(
                  //top: 0,
                  left: 150,
                  bottom: 0,
                  right: 0,

                  child: Container(
                    //width: 150,
                    height: 150,
                    color: Colors.blue,
                    child: const Center(
                      child: Text("3",
                          style: TextStyle(color: Colors.white, fontSize: 50)),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: 150,
                    //height: 50,
                    color: Colors.green,
                    child: const Center(
                      child: Text("4",
                          style: TextStyle(color: Colors.white, fontSize: 50)),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 150,
                  right: 150,
                  bottom: 150,
                  child: Container(
                    //width: 150,
                    //height: 50,
                    color: Colors.purple,
                    child: const Center(
                      child: Text("5",
                          style: TextStyle(color: Colors.white, fontSize: 50)),
                    ),
                  ),
                ),
              ],
            )));
  }
}
