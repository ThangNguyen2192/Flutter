import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

TextTheme textTheme = const TextTheme(
  displayLarge: TextStyle(fontSize: 24), // Customize headline1 font size
  displayMedium: TextStyle(fontSize: 20), // Customize headline2 font size
  bodyLarge: TextStyle(fontSize: 50), // Customize bodyText1 font size
  bodyMedium: TextStyle(fontSize: 20), // Customize bodyText2 font size
);

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.blue, // Màu chủ đạo trong theme sáng
  // accentColor: Colors.green, // Màu sắc phụ
  brightness: Brightness.light, // Chế độ sáng
  fontFamily: 'Roboto', // Font chữ
  textTheme: textTheme,
  // Các thuộc tính khác
);

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.deepPurple, // Màu chủ đạo trong theme tối
  //accentColor: Colors.amber, // Màu sắc phụ
  brightness: Brightness.dark, // Chế độ tối
  fontFamily: 'Roboto', // Font chữ
  textTheme: textTheme,
  // Các thuộc tính khác
);

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false; // Ban đầu sử dụng theme sáng

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme; // Đảo ngược theme
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = isDarkTheme ? darkTheme : lightTheme;

    return MaterialApp(
      theme: theme, // Sử dụng theme tương ứng
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Light/Dark Theme Switcher'),
          actions: [
            IconButton(
              icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode),
              onPressed: toggleTheme,
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Welcome to Custom Themes!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   ThemeData them1 = ThemeData();
//   ThemeData currentTheme = ThemeData.light(); // Chọn theme mặc định (sáng)

//   void toggleTheme() {
//     setState(() {
//       if (currentTheme == ThemeData.light()) {
//         currentTheme = ThemeData.dark(); // Chuyển sang theme tối
//       } else {
//         currentTheme = ThemeData.light(); // Chuyển sang theme sáng
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: currentTheme, // Sử dụng theme hiện tại
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Light/Dark Theme Switcher'),
//           actions: [
//             IconButton(
//               icon:
//                   const Icon(Icons.brightness_6), // Biểu tượng chuyển đổi theme
//               onPressed: toggleTheme, // Gọi hàm thay đổi theme khi nhấn
//             ),
//           ],
//         ),
//         body: const Center(
//           child: Text(
//             'Welcome to Flutter Themes!',
//             style: TextStyle(fontSize: 24),
//           ),
//         ),
//       ),
//     );
//   }
// }
