import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2, // Số lượng tab
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text('Messenger'),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    // Nội dung cho Tab 1
                    Container(
                      // color: Colors.amber[50],
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3, color: Colors.purple)),
                            child: const TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search)),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            // color: Colors.amber,
                            height: 80,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return Container(
                                    width: 80,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        // color: Colors.amber,
                                        border:
                                            Border.all(color: Colors.black)),
                                  );
                                },
                                separatorBuilder: (_, index) {
                                  return const SizedBox(
                                    width: 10,
                                  );
                                },
                                itemCount: 10),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              //color: Colors.amber,
                              //height: 100,
                              child: ListView.separated(
                                  itemBuilder: (_, index) {
                                    return SizedBox(
                                      height: 70,
                                      // color: Colors.amber,
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            width: 70,
                                            // height: 60,
                                            decoration: const BoxDecoration(
                                                color: Colors.pink,
                                                shape: BoxShape.circle),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: const Text(
                                                'Thang\nBan dang lam gi do'),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: 10),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Nội dung cho Tab 2
                    const Center(child: Text('Tab 2 Content')),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: const TabBar(
                  tabs: [
                    Tab(
                      text: 'Tab 1',
                      icon: Icon(
                        Icons.message,
                        color: Colors.purple,
                      ),
                    ),
                    Tab(
                      text: 'Tab 2',
                      icon: Icon(
                        Icons.message,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Friend {
  final String name;
  final String id;
  final String image;
  Friend({required this.name, required this.id, required this.image});
}

class Message
{
  final String content;
  final Friend friend;

  Message({required this.content, required this.friend});
}
