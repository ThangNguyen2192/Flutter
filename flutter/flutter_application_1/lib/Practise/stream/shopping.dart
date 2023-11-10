import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class ShoppingProvider with ChangeNotifier {
  GlobalKey cartKey = GlobalKey();
  void addItem(Item item) {
   
    List<Item> list = [...valueNotifier.value];
    list.add(item);
    valueNotifier.value = list;
     streamController.add(item);
  }

  void removeItem(Item item) {
    List<Item> list = [...valueNotifier.value];
    list.removeWhere((element) => element == item);
    valueNotifier.value = list;
  }

  // @override
  // notifyListeners();
}

//List<Item> cart = [];

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

ValueNotifier<List<Item>> valueNotifier = ValueNotifier<List<Item>>([]);

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final shoppingProvider = Provider.of<ShoppingProvider>(context);

    streamController.stream.listen(
      (data) {
        cartProvider.udpateCart(data);
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
                        animation: valueNotifier,
                        builder: (BuildContext context, Widget? child) {
                          return Text(
                            valueNotifier.value.length.toString(),
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
                          
                         
                           shoppingProvider.addItem(items[index]);
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