void main(List<String> arguments) {
  //Practise 1: String
  String str =
      " đây là kết quả của buổi học thứ 2 về dart: dart basics (phần 1)...";

  /// hãy viết code bằng tất cả các cách có thể để in ra:
  /// `Đây là kết quả buổi học thứ 2 về Dart: DART BASIC (phần 1)`
  /// gợi ý: sử dụng hàm subString()
  //Cach 1
  print('Bài 1');
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

  print('\nBài 2');
  print(kq);
  //print(list1);
  // print(map1);
  // print(map2);
  //print('abc'.substring(2, 3));

  //---------------------------------------
  print('\nBài 2.1');
  //Practise 2.1: Các variables đã học
  /*Ví dụ dưới đây có 3 lỗi. Hãy tìm và sửa hết 3 lỗi này. Nhớ đọc ví dụ về ... nhé mọi người.*/
  var arrs = ["-1", "1", "2", "0", "3", "4", "5", "6", "7"];
  Map<dynamic, List<String?>?>? sMap = {
    1: [null],
    2: [],
    3: ["x", "y", "z"]
  };
  Map<dynamic, List<dynamic>?>? map = {
    "first": ["a", "b", "c", "d"]
  };
  map.addAll(sMap);

  //List<int> arrsToInt = arrs.map((e) => int.parse(e)).toList();
  print(
      'Lỗi 1 int.parse(e) do arrs có chứa phần tử null không phải là kiểu String nên bị lỗi');
  List<int> arrsToInt = arrs.map((e) => int.parse(e)).toList();
  //print(arrsToInt);
  map["second"] = arrsToInt;
  // map["third"] = sMap.values.last.sublist(1);
  print(
      'Lỗi 2 do sMap đang khai báo cho phép value null nên sublist cần thêm kiểm tra khác null');
  map["third"] = sMap.values.last?.sublist(1);
  /*Ví dụ về ...
  Cách sử dụng: [...Iterable]
  Khi sử dụng ... sẽ lấy toàn bộ phần tử của Iterable add vào trong []
  ví dụ:
  var a = [1,2,3];
  var b = [4,5,6];
  var result = [...a, ...b] // sẽ cho ra result = [1,2,3,4,5,6]*/
  map["fourth"] = [
    ...arrs.map((e) => int.parse(e)).where((e) => e % 2 == 1),
    ...arrs.where((e) => e == null),
    ...?sMap[3]?.sublist(0, 2)
  ];

  print(
      'Lỗi 3 do sMap đang khai báo cho phép value null nên sublist cần thêm kiểm tra khác null ');

  print(map);
}
