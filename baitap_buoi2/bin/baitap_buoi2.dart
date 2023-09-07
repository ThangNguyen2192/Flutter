void main(List<String> arguments) {
  //Practise 1: String
  String str =
      " đây là kết quả của buổi học thứ 2 về dart: dart basics (phần 1)...";

  /// hãy viết code bằng tất cả các cách có thể để in ra:
  /// `Đây là kết quả buổi học thứ 2 về Dart: DART BASIC (phần 1)`
  /// gợi ý: sử dụng hàm subString()
  //Cach 1
  String str1 = str
      .trim()
      .replaceAll('đây', 'Đây')
      .replaceAll('dart basics', 'DART BASIC')
      .replaceAll('dart', 'Dart')
      .replaceAll('...', '');
  print(str1);

  //Cach 2
  String str2 = str
      .trim()
      .substring(0, str.indexOf('...') - 1)
      .replaceAll('đây', 'Đây')
      .replaceAll('dart basics', 'DART BASIC')
      .replaceAll('dart', 'Dart');
  print(str2);

  //Cach 3
  List arr1 = str.split(' ');
  String str3 =
      '${arr1[1].toString().substring(0, 1).toUpperCase()}${arr1[1].toString().substring(1, 3)} ${arr1[2]} ${arr1[3]} ${arr1[4]} ${arr1[5]} ${arr1[6]} ${arr1[7]} ${arr1[8]} ${arr1[9]} ${arr1[10]} ${arr1[11].toString().substring(0, 1).toUpperCase()}${arr1[11].toString().substring(1, 5)} ${arr1[12].toString().toUpperCase()} ${arr1[13].toString().substring(0, 5).toUpperCase()} ${arr1[14]} ${arr1[15].toString().substring(0, 2)}';
  print(str3);

//------------------------------------------------
//Practise 2.1: Các variables đã học
  List arr = [
    1,
    2,
    3,
    "đây",
    "kết",
    "là",
    true,
    false,
    {true: "buổi", 1: "học", 10.2: ":", false: "dart basics"},
    ['thứ', 'quả', 'về'],
    "(phần 1)",
    {"flutter": "dart"},
  ];

  /// Lấy data từ array trên và tạo ra 1 String với giá trị sau:
  /// Đây là kết quả buổi học thứ 2 về Dart: DART BASIC (phần 1)
  Map map1 = arr[8];
  Map map2 = arr[11];
  List<String> list1 = arr[9];

  String kq =
      '${arr[3].toString().substring(0, 1).toUpperCase()}${arr[3].toString().substring(1, 3)} ${arr[5]} ${arr[4]} ${list1[1]} ${map1[true]} ${map1[1]} ${list1[0]} ${arr[1]} ${list1[2]} ${map2.values.first.toString().substring(0, 1).toUpperCase()}${map2.values.first.toString().substring(1, 4)}${map1[10.2]} ${map1[false].toString().toUpperCase().substring(0, 10)} ${arr[10]}';

  print(kq);
  //print(list1);
  // print(map1);
  // print(map2);
  //print('abc'.substring(2, 3));
}
