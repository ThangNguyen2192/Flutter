import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';

class ResponsiveUiConfig {
  static final ResponsiveUiConfig _instance = ResponsiveUiConfig._();

  ResponsiveUiConfig._();

  factory ResponsiveUiConfig() => _instance;

  static const double _defaultWidth = 375;
  static const double _defaultHeight = 812;

  late MediaQueryData _mediaQueryData;
  double? _screenWidth;
  double? _screenHeight;

  bool _isInitialized = false;
  double get defaultWidth => _defaultWidth;
  double get defaultHeight => _defaultHeight;

  double get screenWidth => _screenWidth ?? _defaultWidth;

  double get screenHeight => _screenHeight ?? _defaultHeight;

  // hàm để khởi tạo dữ liệu, lấy kích thước width, height theo context hiện tại
  // nên tính lại nếu màn hình có hỗ trợ xoay
  void initialize(BuildContext context) {
    /// comment tạm lại để test khi tự resize kích thước màn hình
    // if (isInitialized) {
    //   return;
    // }

    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;

    // print('_defaultWidth $_defaultWidth');
    // print('screenWidth $_defaultWidth');

    _isInitialized = true;
  }

  // 375x812: Viewport trên iphone 11 Pro (lấy làm cơ bản)
  // https://yesviz.com/iphones.php
  double setWidth(num value) {
    //print(' v ${screenWidth * (value / _defaultWidth)}');
    return screenWidth * (value / _defaultWidth);
  }

  double setHeight(num value) => screenHeight * (value / _defaultHeight);
}

/// Viết 1 cái extension, gọi cho dễ
extension ResponsiveUiExt on num {
  double get w => ResponsiveUiConfig().setWidth(this);

  double get h => ResponsiveUiConfig().setHeight(this);
}

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _BaseWidget(),
    );
  }
}

class _BaseWidget extends StatelessWidget {
  _BaseWidget();

  final ValueNotifier<int> randomNumber = ValueNotifier<int>(10);
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    ResponsiveUiConfig().initialize(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo responsive layout"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.red,
        child: Center(
          child: Container(
            width: 150.w,
            height: 150.h,
            color: Colors.green,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  "Current width is: ${150.w.floor()} \nCurrent height is: ${150.h.floor()} ",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// Mỗi lần thay đổi giá trị của `randomNumber`,
          /// `ValueListenableBuilder` chứa `valueListenable` sẽ gọi tới hàm `builder`
          randomNumber.value = random.nextInt(100);
        },
        child: ValueListenableBuilder(
          /// **anh em ngâm thêm về `ValueListenableBuilder` nhé!!!**
          builder: (BuildContext context, value, Widget? child) {
            log("build new value: $value "); // dùng hàm log sẽ in được string dài hơn print
            return Text("${randomNumber.value}");
          },
          valueListenable: randomNumber,
        ),
      ),
    );
  }
}
