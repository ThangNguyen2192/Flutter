import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Home Work',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Color _likeColor = Colors.black;
  void _setLikeColor() {
    setState(() {
      if (_likeColor == Colors.black) {
        _likeColor = Colors.red;
      } else {
        _likeColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
        flexibleSpace: const SizedBox(
          height: 50,
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Expanded(
              child: Image(
                  fit: BoxFit.cover,
                  // height: double.infinity,
                  // width: double.infinity,
                  image: NetworkImage(
                      "https://haycafe.vn/wp-content/uploads/2023/01/Hinh-anh-thien-nhien-dep-nhat.jpeg"))),
          Expanded(
            //flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _setLikeColor,
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                              ),
                              icon: Icon(
                                Icons.favorite,
                                color: _likeColor,
                              ), // Use the heart icon
                              label: const Text(
                                'Like',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                              ),
                              icon: const Icon(
                                Icons.comment,
                                color: Colors.black,
                              ), // Use the heart icon
                              label: const Text(
                                'Comment',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                              ),
                              icon: const Icon(
                                Icons.share,
                                color: Colors.black,
                              ), // Use the heart icon
                              label: const Text(
                                'Share',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        // color: Colors.purple,
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                    text: "current Counter is: ",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                TextSpan(
                                    text: _counter.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  height: 30,
                  color: Colors.blue,
                ),
                // ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(30), // Adjust the radius as needed
        ),
        backgroundColor: Colors.blue,
        onPressed: _incrementCounter,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
