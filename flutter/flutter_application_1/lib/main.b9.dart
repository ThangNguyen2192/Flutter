import 'package:flutter/material.dart';

void main() =>
    runApp(const MyApp()); // runApp để hiển thị lên 1 UI, đầu vào là 1 widget

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';

    return MaterialApp(
      // MaterialApp hoặc CupertinoApp: chỉ có duy nhất 1, mục đích để config các thông tin về app như theme, localization....
      title: appTitle,
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          labelMedium: TextStyle(color: Colors.blue, fontSize: 40),
        ),
      ),
      home: Scaffold(
        // nên có trong 1 màn, có 2 thành phần chính: appbar và body
        appBar: AppBar(
          // phần trên cùng, mặc định sẽ có nút back bên trái (leading)
          title: const Text(appTitle), // content của appbar
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                // onChanged: (value) {
                //   _user = value;
                // },
                style: const TextStyle(fontSize: 20),
                //controller: userController,
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                // onChanged: (value) {
                //   _pass = value;
                // },
                style: const TextStyle(fontSize: 20),
                //controller: passController,
                //obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                  //prefix: Icon(Icons.search),
                  suffixIcon: InkWell(
                    child: const Icon(Icons.visibility),
                    onTap: () {
                      // setState(() {
                      //   _obscureText = !_obscureText;
                      // });
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
                  onPressed: () {},
                  //onPressed: HienThiThongTin,
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
              const Text(''
                  // _thongtin,
                  // style: const TextStyle(fontSize: 20),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

const padding = EdgeInsets.symmetric(horizontal: 28, vertical: 16);

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: padding,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        Padding(
          padding: padding,
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
        ),
        Text(
          "111111",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          "222222",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          "333333",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }
}
