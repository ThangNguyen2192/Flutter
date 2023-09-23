import 'package:flutter/foundation.dart';
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
            body: const Stack(
              children: [
                Widget1(
                  text: '1',
                  color: Colors.red,
                  left: 0,
                  right: 150,
                  height: 150,
                ),
                Widget1(
                  text: '2',
                  color: Colors.amber,
                  top: 0,
                  right: 0,
                  bottom: 150,
                  width: 150,
                ),
                Widget1(
                  text: '3',
                  color: Colors.blue,
                  left: 150,
                  right: 0,
                  bottom: 0,
                  height: 150,
                ),
                Widget1(
                  text: '4',
                  color: Colors.green,
                  top: 150,
                  left: 0,
                  bottom: 0,
                  width: 150,
                ),
                Widget1(
                  text: '5',
                  color: Colors.purple,
                  top: 150,
                  left: 150,
                  right: 150,
                  bottom: 150,
                ),
              ],
            )));
  }
}

class Widget1 extends StatelessWidget {
  const Widget1(
      {super.key,
      this.left,
      this.right,
      this.top,
      this.bottom,
      this.width,
      this.height,
      required this.text,
      required this.color});
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final double? width;
  final double? height;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      bottom: bottom,
      top: top,
      child: Container(
        //width: double.infinity,
        height: height,
        width: width,
        color: color,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 50),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('color', color));
  }
}
