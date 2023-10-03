import 'dart:io';

import 'package:http/http.dart' as http ;
Future<bool> validateImage(String imageUrl) async {
  try {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      return checkIfImage(response.headers['content-type'].toString());
    } else {
      print('Image not found or failed to load.');
      return false;
    }
  } catch (e) {
    print('Error validating image: $e');
    return false;
  }
}

bool checkIfImage(String param) {
  if (param == 'image/jpeg' || param == 'image/png' || param == 'image/gif') {
    return true;
  }
  return false;
}

void main(List<String> args) async {
  const imageUrl =
      "https://inkythuatso.com/uploads/images/2022/03/hinh-anh-avatar-dep-cho-con-gai-dai-dien-30-14-15-58.jpg";
  final isValidImage = await validateImage(imageUrl);

  if (isValidImage) {
    print('Image is valid and exists.');
  } else {
    print('Image is not valid or does not exist.');
  }
}
