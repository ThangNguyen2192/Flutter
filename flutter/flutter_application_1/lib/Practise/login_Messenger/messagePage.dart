import 'dart:ffi';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

void main() {
  LoadData();
  // print(messages.length);
  runApp(const MyApp());
}

List<Friend> friends = [];
List<Friend> friendsOnline = [];
List<Message> messages = [];
void LoadData() {
  if (friends.isNotEmpty) {
    return;
  }
  //print("v0");
  friends = [
    Friend(name: "friend 1", id: "1", pathImage: "assets/images/1.png"),
    Friend(name: "friend 2", id: "2", pathImage: "assets/images/2.png"),
    Friend(name: "friend 3", id: "3", pathImage: "assets/images/3.png"),
    Friend(name: "friend 4", id: "4", pathImage: "assets/images/4.png"),
    Friend(name: "friend 5", id: "5", pathImage: "assets/images/5.png"),
    Friend(name: "friend 6", id: "6", pathImage: "assets/images/6.png"),
    Friend(name: "friend 7", id: "7", pathImage: "assets/images/7.png"),
    Friend(name: "friend 8", id: "8", pathImage: "assets/images/8.png"),
    Friend(name: "friend 9", id: "9", pathImage: "assets/images/9.png"),
    Friend(name: "friend 10", id: "10", pathImage: "assets/images/10.png"),
    Friend(name: "friend 11", id: "11", pathImage: "assets/images/11.png"),
  ];
  friendsOnline = [...friends];

  messages = [
    Message(content: "Anh ơ đâu", friend: friends[0]),
    Message(content: "bye", friend: friends[1]),
    Message(content: "hi", friend: friends[2]),
    Message(content: "hello", friend: friends[3]),
    Message(content: "Anh đi chơi không", friend: friends[4]),
    Message(content: "Đi ăn đi anh", friend: friends[5]),
    Message(content: "Xem phim không anh", friend: friends[6]),
    Message(content: "Cho em làm quen nhé", friend: friends[7]),
    Message(content: "a", friend: friends[8]),
    Message(content: "b", friend: friends[9]),
    Message(content: "c", friend: friends[10]),
    // Message(content: "c", ),
  ];
  // print('v');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MessagePage(),
    );
  }
}

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  int _tabindex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.purple)),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: InkWell(
                                  onTap: () {},
                                  child: const Icon(Icons.search))),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 80,
                        child: ListViewFriend(friends: friendsOnline),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: ListViewMessage(
                              messages: messages, friends: friends),
                        ),
                      ),
                    ],
                  ),

                  // Nội dung cho Tab 2
                  const Center(child: Text('Tab 2 Content')),
                ],
              ),
            ),
            TabBar(
              onTap: (value) {
                // print("v");
                setState(() {
                  _tabindex = value;
                });
              },
              // indicator: BoxDecoration(),
              // indicatorColor: Colors.pink,
              indicator: const BoxDecoration(
                color: Color.fromARGB(255, 248, 244, 244),
              ),
              //isScrollable: true,
              tabs: [
                Tab(
                  //text: 'Tab 1',
                  icon: Icon(
                    Icons.message,
                    color: (_tabindex == 0) ? Colors.purple : Colors.black,
                  ),
                ),
                Tab(
                  // text: 'Tab 2',
                  icon: Icon(
                    Icons.settings,
                    color: (_tabindex == 1) ? Colors.purple : Colors.black,
                  ),
                ),
              ],
              isScrollable: false,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // backgroundColor: Colors.amber,
          onPressed: () {
            // print('v');
            setState(() {
              if (friendsOnline.isNotEmpty) {
                friendsOnline.remove(friendsOnline[0]);
              }
              //   print('v');
            });
          },
          child: const Icon(
            Icons.delete_forever,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}

class ListViewMessage extends StatelessWidget {
  const ListViewMessage(
      {super.key, required this.messages, required this.friends});
  final List<Message> messages;
  final List<Friend> friends;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        return SizedBox(
          height: 70,
          // color: Colors.amber,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 70,
                // height: 60,
                decoration: const BoxDecoration(
                  // border: Border.all(color: Colors.black),
                  //color: Colors.pink,
                  shape: BoxShape.circle,
                ),

                child: ClipOval(
                    child: Image(
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          messages[index].friend.pathImage,
                        ))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                    '${messages[index].friend.name}\n${messages[index].content}'),
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
      itemCount: messages.length,
    );
  }
}

class ListViewFriend extends StatelessWidget {
  const ListViewFriend({
    super.key,
    required this.friends,
  });

  final List<Friend> friends;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Container(
            width: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.amber,
                border: Border.all(color: Colors.black)),
            child: ClipOval(
              child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(friends[index].pathImage)),
            ),
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: friends.length);
  }
}

class Friend {
  final String name;
  final String id;
  final String pathImage;
  Friend({required this.name, required this.id, required this.pathImage});
}

class Message {
  final String content;
  // final String idfriend;
  final Friend friend;

  Message({required this.content, required this.friend});
}
