import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final ValueNotifier<int> counter = ValueNotifier<int>(0);
  final ValueNotifier<List<Item>> items = ValueNotifier<List<Item>>(
      [const Item(), const Item(), const Item(), const Item()]);
  final bool _isRefresh = false;
  Future<void> _loadMoreData() async {
    print("_loadMoreData");
    // Simulate loading more data by adding a delay
    // await Future.delayed(const Duration(seconds: 2));
    // if (_isRefresh) {
    //   _isRefresh = false;
    // } else {
    //   setState(() {
    //     print("_loadMoreData");
    //     items.value.addAll(List.generate(2, (index) {
    //       return const Item();
    //     }));
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ValueNotifier Example'),
        ),
        body: Center(
          child: ValueListenableBuilder<List<Item>>(
            valueListenable: items,
            builder: (context, value, child) {
              return RefreshIndicator(
                onRefresh: () async {
                  //setState(() {
                  // print("v1");
                  //items.value.addAll([const Item(), const Item()]);
                  // });
                },
                child: NotificationListener(
                  onNotification: (notification) {
                    if (notification is ScrollEndNotification) {
                      

                      // return true;
                       _loadMoreData;
                    }
                    return false;
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemCount: items.value.length,
                        itemBuilder: (context, index) {
                          print('${DateTime.now()}     $index');
                          return items.value[index];
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.pink, child: const Text("abc"));
  }
}
