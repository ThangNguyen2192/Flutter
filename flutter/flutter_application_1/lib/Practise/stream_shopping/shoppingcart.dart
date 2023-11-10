import 'dart:async';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: shoppingPage,
      routes: routes,
    );
  }
}

ShoppingPage shoppingPage = const ShoppingPage();
CartPage cartPage = const CartPage();
// Map<String,Widget Function(Bui)>
Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  "/shoppingPage": (context) => shoppingPage,
  "/cartPage": (context) => cartPage,
};

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

ValueNotifier<List<Item>> card = ValueNotifier<List<Item>>([]);

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    streamController.stream.listen(
      (data) {
        //print("cd");
        if (map.value.containsKey((data as Item))) {
          map.value[data] = (map.value[data]! + 1);
          // print("v1");
        } else {
          map.value.addAll({data: 1});
          //print("v2");
        }
      },
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/cartPage");
                    },
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 60,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: AnimatedBuilder(
                        animation: card,
                        builder: (BuildContext context, Widget? child) {
                          return Text(
                            card.value.length.toString(),
                            style: const TextStyle(fontSize: 14),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.pink,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          List<Item> list = [...card.value];
                          list.add(items[index]);
                          card.value = list;
                          streamController.add(items[index]);
                          // print(card.value.length);
                        },
                        child: const Icon(
                          Icons.add_circle,
                          color: Colors.green,
                          size: 50,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        items[index].name.toString(),
                        style: const TextStyle(fontSize: 30),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
      //appBar: ,
    );
  }
}

//List<Item> card = [];

List<Item> items =
    List.generate(20, (index) => Item(id: index, name: index.toString()));

class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});
}

StreamController streamController = StreamController<Item>.broadcast();
// Map<Item, int> map = <Item, int>{};
ValueNotifier<Map<Item, int>> map = ValueNotifier<Map<Item, int>>({});

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(
        animation: map,
        builder: (BuildContext context, Widget? child) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: map.value.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.yellow,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          List<Item> list = [...card.value];
                          list.removeWhere((element) =>
                              element == map.value.keys.toList()[index]);

                          card.value = list;
                          // setState(() {
                          //print(map.value.length);
                          //map.value.remove(map.value.keys.toList()[index]);
                          Map<Item, int> map1 = map.value;
                          map1.remove(map1.keys.toList()[index]);
                         // print(map1.length);
                          map.value = {};
                          map.value = map1;
                          // Map<Item, int> map = map.value;

                          // });

                          // streamController.add(items[index]);
                          // print(card.value.length);
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        map.value.keys.toList()[index].name.toString(),
                        style: const TextStyle(fontSize: 30),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
