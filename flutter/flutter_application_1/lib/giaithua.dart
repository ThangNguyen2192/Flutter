import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Test',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      //   useMaterial3: true,
      // ),
      home: MyHomePage(
        tittle: "Practise",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.tittle});
  final String tittle;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _numberInputIsValid = true;
  final TextEditingController _textFieldInputGiaiThua = TextEditingController();
  final TextEditingController _textFieldOutputGiaiThua =
      TextEditingController();

  late int inputGiaiThua, outputGiaiThua;
  void tinhGiaiThua() {
    // print(_numberInputIsValid);
    if (_numberInputIsValid) {
      double kq = 1;
      if (int.tryParse(_textFieldInputGiaiThua.text) != null) {
        int num = int.parse(_textFieldInputGiaiThua.text);
        for (int i = num; i >= 1; i--) {
          kq *= i;
          // print(i);
        }
        //print(kq);
        _textFieldOutputGiaiThua.text = kq.toStringAsFixed(0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tittle),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.grey,
                        child: TextField(
                          controller: _textFieldInputGiaiThua,
                          style: const TextStyle(fontSize: 30),
                          decoration: InputDecoration(
                            labelText: 'Nhập vào số nguyên',
                            errorText: _numberInputIsValid
                                ? null
                                : 'Vui lòng nhập vào số nguyên!',
                            errorStyle: const TextStyle(fontSize: 30),
                            border: InputBorder.none,
                          ),
                          // onSubmitted: (val) => Fluttertoast.showToast(
                          //     msg: 'You entered: ${int.parse(val)}'),
                          onTap: () {
                            _textFieldInputGiaiThua.selection = TextSelection(
                              baseOffset: 0,
                              extentOffset: _textFieldInputGiaiThua.text.length,
                            );
                          },
                          onChanged: (String val) {
                            final v = int.tryParse(val);
                            //debugPrint('parsed value = $v');
                            if (v == null) {
                              if (val != '') {
                                setState(() => _numberInputIsValid = false);
                              } else {
                                setState(() => _numberInputIsValid = true);
                              }
                            } else {
                              setState(() => _numberInputIsValid = true);
                            }
                          },
                        ),
                      )),
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue)),
                          onPressed: tinhGiaiThua,
                          child: const Text(
                            'Tính giai thừa',
                            style: TextStyle(color: Colors.white),
                          ))
                      //ElevatedButton(onPressed: () {}, child: const Icon(Icons.add))
                    ],
                  ),
                  TextField(
                    controller: _textFieldOutputGiaiThua,
                    style: const TextStyle(fontSize: 30),
                    decoration: const InputDecoration(labelText: 'Kết quả:'),
                  ),
                  Container(
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FF),
                      border: Border.all(color: const Color(0xFF1F41BB)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.only(left: 20),
                    child: const TextField(
                      //controller: controller,
                      //textAlign: TextAlign.right,
                      textAlignVertical: TextAlignVertical
                          .bottom, // Center vertically Căn cho chữ luôn ở giữa dòng theo chiều đứng
                      decoration: InputDecoration(
                        hintText: 'fdsfds',
                        //labelText: 'sbvf',
                        hintStyle: TextStyle(fontSize: 16),
                        errorText: "loi",
                        errorStyle: TextStyle(),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}
