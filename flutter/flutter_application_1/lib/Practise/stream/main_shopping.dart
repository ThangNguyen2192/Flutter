


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'shopping.dart';

void main(List<String> args) {
  
  runApp(MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (context) => ShoppingProvider()),
      ChangeNotifierProvider(create: (context) => CartProvider()),
    ],
    child: const MyApp(),
  ));
  
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