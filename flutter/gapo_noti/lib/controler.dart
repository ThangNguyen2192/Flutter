import 'dart:convert';
import 'package:flutter/services.dart';
import 'modal.dart';

Future<Datas> readJsonData() async {
  // Đường dẫn đầy đủ của tệp .json
  String jsonPath = 'assets/json/noti.json';

  try {
    // Đọc nội dung từ tệp .json
    String jsonData = await rootBundle.loadString(jsonPath);

    // Xử lý dữ liệu JSON ở đây (ví dụ: giải mã JSON)
    Map<String, dynamic> data = json.decode(jsonData);

    // In ra dữ liệu
    return Datas.fromJson(data);
  } catch (e) {
    // Xử lý lỗi nếu có
    throw Exception("Error load data");
  }
}

Datas datas = Datas();