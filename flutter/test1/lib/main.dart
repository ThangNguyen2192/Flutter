import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'other_file.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MyState()),
          ChangeNotifierProvider(create: (context) => MyProvider()),
        ],
        child: const MyApp(),
      ),
    );

class MyState with ChangeNotifier {
  String myVariable_Main = "Hello from Provider";

  void updateVariable(String newValue) {
    myVariable_Main = newValue;
    notifyListeners(); // Thông báo cho các widget lắng nghe thay đổi.
  }
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final myStateMain = Provider.of<MyState>(context);
    final myStateOther = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Gia tri bien o main: ${myStateMain.myVariable_Main}'),
            Text('Gia tri bien o other: ${myStateOther.myVariable_Other}'),
            ElevatedButton(
              onPressed: () {
                // Thay đổi giá trị ở tệp chính
                myStateMain.updateVariable("Updated Value");
              },
              child: const Text('Sua bien o main'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtherPage(),
                  ),
                );
              },
              child: const Text('Go to Other Page'),
            ),
            ElevatedButton(
              onPressed: () {
                 myStateOther.updateVariableFromOtherFile(true);
                print(myStateOther.myVariable_Other);
              },
              child: const Text('Sua bien o other'),
            ),
          ],
        ),
      ),
    );
  }
}
