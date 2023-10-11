import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int count = 6;
bool showImage = false;

List<String> listulr = [
  "https://haycafe.vn/wp-content/uploads/2023/01/Hinh-anh-thien-nhien-dep-nhat.jpeg",
  "https://haycafe.vn/wp-content/uploads/2022/04/Hinh-anh-dong-vat-de-thuong-Tho-va-Meo-800x500.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/04/Hinh-anh-dong-vat-de-thuong-cute-800x500.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/04/Hinh-anh-dong-vat-de-thuong-gia-dinh-chim-canh-cut-800x533.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/04/Hinh-anh-dong-vat-de-thuong-cute-2-chu-Tho-800x500.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/04/Hinh-anh-dong-vat-de-thuong-2-chu-meo-con-800x500.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/03/Lang-hoa-Sa-Dec-800x535.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/03/anh-danh-lam-thang-canh-Lang-hoa-Sa-Dec-800x450.jpg",
];

List<String> list1 = ["", "", "", "", "", ""];
final ValueNotifier<List<String>> items = ValueNotifier<List<String>>(list1);
final ValueNotifier<bool> _isLoadingMore = ValueNotifier<bool>(false);

class _MyAppState extends State<MyApp> {
  bool _isRefresh = false;
  void _refresh() {
    _isLoadingMore.value = false;
    _isRefresh = true;
    // setState(() {
    list1 = ["", "", "", "", "", ""];
    items.value = list1;
    //});
  }

  Future<void> _loadMoreData() async {
    if (_isRefresh) {
      _isRefresh = false;
    } else {
      // setState(() {
      _isLoadingMore.value = true;
      //});

      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        list1.addAll(List.generate(6, (index) => ""));
        items.value = list1;
      });

      _isLoadingMore.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Card"),
          actions: [
            InkWell(
                onTap: () {
                  _refresh();
                },
                child: const Icon(Icons.refresh))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: () async {
              // print("abc");
              _refresh();
            },
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification) {
                  _loadMoreData();
                }

                return false;
              },
              child: ValueListenableBuilder(
                valueListenable: items,
                builder: (BuildContext context, value, Widget? child) {
                  return ValueListenableBuilder(
                    valueListenable: _isLoadingMore,
                    builder: (BuildContext context, value, Widget? child) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: (_isLoadingMore.value)
                            ? items.value.length + 1
                            : items.value.length,
                        itemBuilder: (context, index) {
                          if (index < items.value.length) {
                            return Card(index: index);
                          } else if (_isLoadingMore.value) {
                            return const CircularProgressIndicator();
                          }
                          return null;
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  Card({super.key, required this.index});
  int index;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: (items.value[widget.index].isEmpty)
          ? InkWell(
              onTap: () {
                setState(() {
                  items.value[widget.index] =
                      listulr[Random().nextInt(listulr.length)];
                  //showImage = true;
                });
              },
              child: const Icon(
                Icons.question_mark,
                size: 30,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(20),
              // clipBehavior: Clip.antiAlias,
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(items.value[widget.index]))),
    );
  }
}
