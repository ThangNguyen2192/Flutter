import 'dart:convert';
import 'package:flutter/services.dart';
import 'modal.dart';

Future<bool> readJsonData() async {
  // Đường dẫn đầy đủ của tệp .json
  String jsonPath = 'assets/json/noti.json';

  try {
    
    // Đọc nội dung từ tệp .json
    String jsonData = await rootBundle.loadString(jsonPath);

    // Xử lý dữ liệu JSON ở đây (ví dụ: giải mã JSON)
    Map<String, dynamic> data = json.decode(jsonData);

    // In ra dữ liệu
    datas = Datas.fromJson(data);

    await Future.delayed(Duration(seconds: 1));
    return true;
    //return Datas.fromJson(data);
  } catch (e) {
    // Xử lý lỗi nếu có
    throw Exception("Error load data");
  }
}

Datas datas = Datas();

String formatDateTime(DateTime dateTime, String format) {
  format = format.replaceAll("dd", dateTime.day.toString().padLeft(2, "0"));
  format = format.replaceAll("MM", dateTime.month.toString().padLeft(2, "0"));
  format = format.replaceAll("yyyy", dateTime.year.toString());
  format = format.replaceAll("yy", dateTime.year.toString().substring(2));

  format = format.replaceAll("hh", dateTime.hour.toString().padLeft(2, "0"));
  format = format.replaceAll("mm", dateTime.month.toString().padLeft(2, "0"));
  format = format.replaceAll("ss", dateTime.second.toString().padLeft(2, "0"));

  return format;
}
