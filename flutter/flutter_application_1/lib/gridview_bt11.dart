import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'Xulykichthuocgiaodien.dart';

void main(List<String> args) {
  runApp(const MyHomePage());
}

TextTheme textTheme = const TextTheme(
  displayLarge: TextStyle(fontSize: 24), // Customize headline1 font size
  displayMedium: TextStyle(fontSize: 20), // Customize headline2 font size
  bodyLarge: TextStyle(fontSize: 20), // Customize bodyText1 font size
  bodyMedium: TextStyle(fontSize: 16), // Customize bodyText2 font size
);
AppBarTheme appBarTheme = const AppBarTheme(
  titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
);
BorderRadius borderRadius = BorderRadius.circular(20);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20), // Đặt bán kính của bo góc
  ),
);
ThemeData lightTheme = ThemeData(
  primaryColor: Colors.blue, // Màu chủ đạo trong theme sáng
  brightness: Brightness.light, // Chế độ sáng
  fontFamily: 'Roboto', // Font chữ
  textTheme: textTheme,
  appBarTheme: appBarTheme,
  inputDecorationTheme: inputDecorationTheme,

  // Các thuộc tính khác
);

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.deepPurple, // Màu chủ đạo trong theme tối
  //accentColor: Colors.amber, // Màu sắc phụ
  brightness: Brightness.dark, // Chế độ tối
  fontFamily: 'Roboto', // Font chữ
  textTheme: textTheme,
  appBarTheme: appBarTheme,
  inputDecorationTheme: inputDecorationTheme,
  // Các thuộc tính khác
);

bool isDarkTheme = false;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme; // Đảo ngược theme
    });
  }

  List<Widget> items = List.generate(
    6,
    (index) => Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: borderRadius,
        ),
        child: const Icon(Icons.question_mark)),
  );

  void reset() {
    //setState(() {
    items = List.generate(
      6,
      (index) => Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: const Icon(Icons.question_mark)),
    );
    // });
  }

  bool showImage = true;
  bool _loading = false;

  Future<void> _loadMoreData() async {
    await Future.delayed(const Duration(seconds: 0));
    setState(() {
      // print("v1");
      _loading = false;
      items.addAll(List.generate(
        6,
        (index) => Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Icon(Icons.question_mark)),
      ));
      // print(items.length);
    });
  }

  ResponsiveUiConfig responsiveUiConfig = ResponsiveUiConfig();
  final double _defaultWidth = ResponsiveUiConfig().screenWidth;
  @override
  Widget build(BuildContext context) {
    responsiveUiConfig.initialize(context);
    return MaterialApp(
      theme: isDarkTheme ? darkTheme : lightTheme,
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "abcd",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            actions: [
              IconButton(
                icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode),
                onPressed: toggleTheme,
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      reset();
                    });
                  },
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          2 * (responsiveUiConfig.screenWidth ~/ _defaultWidth),
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: items.length + 1,
                    itemBuilder: (context, index) {
                      if (index < items.length) {
                        // print("v0");
                        return GestureDetector(
                          onTap: () {
                            // print(showImage);
                            setState(() {
                              items[index] = Container(
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/images/1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            });
                          },
                          child: items[index],
                        );
                      } else if (_loading) {
                        print("v2");
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        print("v3 ${items.length}");
                        _loading = true;
                        _loadMoreData();
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    // print(responsiveUiConfig.screenWidth);
                    // print(_defaultWidth);
                    // setState(() {
                    //   reset();
                    // });
                  },
                  child: const Text("reset"))
            ],
          )),
    );
  }
}
