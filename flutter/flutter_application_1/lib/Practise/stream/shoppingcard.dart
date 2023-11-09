import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

ValueNotifier<List<Item>> card = ValueNotifier<List<Item>>([]);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              Stack(
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 60,
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
