import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shopping.dart';

class CartProvider with ChangeNotifier {
  GlobalKey cartKey = GlobalKey();
  void udpateCart(Item item) {
    //print("v");
    if (cart.keys.toList().contains(item)) {
      cart[item] = (cart[item]! + 1);
    } else {
      cart.addAll({item: 1});
    }
    cartNotifier.value = cart;
  }

  void removeCart(Item item) {
    shoppingProvider!.removeItem(item);

    cart.remove(item);
    cartNotifier.value = {};
    cartNotifier.value = cart;
  }

  // @override
  // notifyListeners();
}

//Map<int,int> abc = Map<int,int>{};
Map<Item, int> cart = <Item, int>{};

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

CartProvider? cartProvider;
ShoppingProvider? shoppingProvider;
ValueNotifier<Map<Item, int>> cartNotifier = ValueNotifier<Map<Item, int>>({});

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    shoppingProvider = Provider.of<ShoppingProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(
        animation: cartNotifier,
        builder: (BuildContext context, Widget? child) {
          return GridView.builder(
            // key: cartProvider.cartKey,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: cart.length,
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

                          cartProvider!.removeCart(cart.keys.toList()[index]);
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
                        cart.keys.toList()[index].name.toString(),
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Text("Số lượng: ${cart.values.toList()[index]}"))
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
