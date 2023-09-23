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
          title: const Text('Row Column'),
        ),
        body: const SingleChildScrollView(
            child: Column(
          children: [
            NewWidget(),
            NewWidget(),
          ],
        )
            //child: NewWidget(),
            ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 500,
            color: Colors.pink,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                    flex: 3, //--ty so voi cac thang con lai
                    child: Container(
                      color: Colors.yellow,
                    )),
                const Spacer(),
                Flexible(
                    child: Container(
                  color: Colors.green,
                ))
              ],
            )),
        Container(
          height: 100,
          color: const Color.fromARGB(255, 200, 189, 193),
          child: const Row(
            children: [
              Icon(Icons.favorite),
              Expanded(
                child: Text(
                  'A long text',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Text('today'),
            ],
          ),
        ),
        Container(
          height: 100,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.ac_unit),
              const Text(
                'Test Row',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: 50,
                color: Colors.blue,
              ),
              Container(
                width: 50,
                color: Colors.green,
              )
            ],
          ),
        )
      ],
    );
  }
}
