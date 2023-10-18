import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class MyProvider with ChangeNotifier {
  bool myVariable_Other = false;

  void updateVariableFromOtherFile(bool gt) {
    // Thực hiện logic cập nhật biến ở đây.
    myVariable_Other = gt; // Ví dụ: thay đổi giá trị biến
    notifyListeners(); // Thông báo cho các người tiêu dùng về thay đổi.
  }
}

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    final mystateMain = Provider.of<MyState>(context);
    final myStateOther = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Gia tri bien o Other: ${myStateOther.myVariable_Other}'),
            Text('Gia Tri bien o Main: ${mystateMain.myVariable_Main}'),
            ElevatedButton(
              onPressed: () {
                mystateMain.updateVariable("Toi la Thang Day");
                print(mystateMain.myVariable_Main);
              },
              child: const Text('Thay doi gia tri bien o main'),
            ),
          ],
        ),
      ),
    );
  }
}
