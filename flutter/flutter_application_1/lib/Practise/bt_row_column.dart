import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      border: Border.all(
        color: Colors.black,
      ),
      color: const Color.fromARGB(255, 219, 225, 230),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BT Row Column'),
        ),
        body: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 30,
                          left: 20,
                          right: 20), //-ngancach voi ben ngoai
                      height: 30,
                      decoration: boxDecoration,
                      child: const Center(
                          child: Text(
                        'Straberry Pavlova',
                        style: TextStyle(fontSize: 24),
                      )),
                      //child: Text(''),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            top: 10,
                            left: 20,
                            right: 20), //-ngancach voi ben ngoai
                        decoration: boxDecoration,
                        child: const Center(
                          child: Text(
                            'Pavlova is a meringue-based dessert named after the Russian ballerine Anna Pavlova.'
                            '\nPavlova featues a crisp crust and soft, light inside, topped with fruit and whipped cream.',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        )
                        //color: const Color.fromARGB(255, 219, 225, 230),
                        ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 20), //-ngancach voi ben ngoai
                      //height: 50,
                      decoration: boxDecoration,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(children: [
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                          ]),
                          Text('170 Reviews'),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 20), //-ngancach voi ben ngoai
                      //height: 50,
                      //color: const Color.fromARGB(255, 219, 225, 230),
                      decoration: boxDecoration,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.access_alarm),
                              Text('PREP:'),
                              Text('25 min')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.access_alarm),
                              Text('COOK:'),
                              Text('1 hr')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.access_alarm),
                              Text('FEEDS:'),
                              Text('4-6')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),

            Expanded(
              flex: 2,
              child: Container(
                color: Colors.yellow,
                child: const Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://haycafe.vn/wp-content/uploads/2023/01/Hinh-anh-thien-nhien-dep-nhat.jpeg")),
              ),
              // child: Image(
              //     fit: BoxFit.fill,
              //     image: NetworkImage(
              //         "https://haycafe.vn/wp-content/uploads/2023/01/Hinh-anh-thien-nhien-dep-nhat.jpeg")),
            ),
            // const Image(
            //     fit: BoxFit.fill,
            //     image: NetworkImage(
            //         "https://haycafe.vn/wp-content/uploads/2023/01/Hinh-anh-thien-nhien-dep-nhat.jpeg")),
          ],
        ),
      ),
    );
  }
}
