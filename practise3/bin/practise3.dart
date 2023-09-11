void main(List<String> arguments) {
  //1. Khai báo toàn bộ các kiểu dữ liệu: Non-Nullable Types và Nullable Types, dynamic, var

  String str1 = '';
  String? str2;
  int int1 = 0;
  int? int2;
  double double1 = 0.0;
  double? double2;
  bool bool1 = false;
  bool? bool2;
  List arr1 = ['a', 'b', 'c'];
  List? arr2;
  Map map1 = {'1': 'a', '2': 'b', null: null};
  Map? map2;

  dynamic dynamic1 = 0;
  var intvar = 0;
  var stringvar = '';
  var doublevar = 10.5;
  var boolvar = false;
  var mapvar = {'1': 'a', '2': 'b', null: null};
  var arrvar = ['a', 'b', 'c'];

  //2. Có sử dụng các từ khoá static, final, late const.
  const String strconst = 'strconst';
  final String strfinal = 'strfinal';
  late String strlate;

  //3. Viết 1 hàm tính giai thừa của 6
  int so = 6;
  print('Gia thừ của $so là ${tinhGiaiThua(so: so)}');
  tinhGiaiThua(so: 5);

  //4. Viết các hàm chuyển đổi qua lại giữa string, int, double
  stringToint(str: '123.456');
  stringTodouble(str: '123.456');
  intTostring(a: 123);
  intTodouble(a: 123);
  doubleTostring(a: 100.1);
  doubleToint(a: 100.1);
}

double tinhGiaiThua({int so = 1, double kq = 1}) {
  if (so > 1) {
    kq = kq * so;
    kq = tinhGiaiThua(so: so - 1, kq: kq);
  }
  return kq;
}

int? stringToint({String str = ''}) {
  int? kq = int.tryParse(str);
  print('Kết quả hàm stringToint: $kq');
  return kq;
}

double? stringTodouble({String str = ''}) {
  double? kq = double.tryParse(str);
  print('Kết quả hàm stringTodouble: $kq');
  return kq;
}

String intTostring({int a = 0}) {
  String kq = a.toString();
  print('Kết quả hàm intTostring: $kq');
  return kq;
}

double intTodouble({int a = 0}) {
  double kq = a.toDouble();
  print('Kết quả hàm intTodouble: $kq');
  return kq;
}

String doubleTostring({double a = 0}) {
  String kq = a.toString();
  print('Kết quả hàm doubleTostring: $kq');
  return kq;
}

int doubleToint({double a = 0}) {
  int kq = a.toInt();
  print('Kết quả hàm doubleToint: $kq');
  return kq;
}
