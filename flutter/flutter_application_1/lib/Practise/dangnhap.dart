import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String _thongtin = "Tên đăng nhập và mật khẩu là:";
  String _user = "";
  String _pass = "";
  bool _obscureText = true;
  void HienThiThongTin() {
    setState(() {
      _thongtin = "Tên đăng nhập và mật khẩu là:"
          "\n    Username: $_user"
          "\n    Password: $_pass";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          labelMedium: TextStyle(color: Colors.blue, fontSize: 20),
        ),
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primaryColor: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  _user = value;
                },
                style: const TextStyle(fontSize: 20),
                controller: userController,
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  _pass = value;
                },
                style: const TextStyle(fontSize: 20),
                controller: passController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                  //prefix: Icon(Icons.search),
                  suffixIcon: InkWell(
                    child: const Icon(Icons.visibility),
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: HienThiThongTin,
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor),
                  ),
                  child: const Text(
                    "Đăng nhập",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                _thongtin,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
