//import 'dart:svg';

// void main(List<String> args) {
//   //1. diagrams
//   HocVien A = HocVien(ten: 'A');
//   HocVien B = HocVien(ten: 'B');
//   HocVien C = HocVien(ten: 'C');
//   HocVien D = HocVien(ten: 'D');
//   HocVien E = HocVien(ten: 'E');
//   HocVien F = HocVien(ten: 'F');

//   Build buildAndroid=Build(ten: 'Android');
//   Build buildIos=Build(ten: 'ios');
//   Build buildWeb=Build(ten: 'web');
//   Build buildDesktopApp=Build(ten: 'DesktopApp');

//   LopHoc flutter = LopHoc(ten: 'Flutter', soluong: 11,arrBuild: [buildAndroid,buildIos,buildWeb,buildDesktopApp]);
//   flutter.arrHocVien = [A, B];
//   LopHoc android = LopHoc(ten: 'android', soluong: 12,arrBuild: [buildAndroid]);
//   android.arrHocVien = [B, C, D];
//   LopHoc ios = LopHoc(ten: 'ios', soluong: 13,arrBuild: [buildIos]);
//   ios.arrHocVien = [D, E, F];
//   LopHoc web = LopHoc(ten: 'web', soluong: 14,arrBuild: [buildWeb]);
//   web.arrHocVien = [F];

//   //--2. Tính toán số học viên thiếu
//   print(
//       'Số lượng học viên thiếu của lớp ${flutter.ten} là: ${flutter.remainMembers()}');
//   print(
//       'Số lượng học viên thiếu của lớp ${android.ten} là: ${android.remainMembers()}');
//   print(
//       'Số lượng học viên thiếu của lớp ${ios.ten} là: ${ios.remainMembers()}');
//   print(
//       'Số lượng học viên thiếu của lớp ${web.ten} là: ${web.remainMembers()}');

//   //--3. Khởi tạo học viên

//   List<HocVien> arrKhoiTaoFultter = flutter.Optional();
//   print('Danh sách học viên khởi tạo của lớp ${flutter.ten}: ${[
//     ...arrKhoiTaoFultter.map((e) => e.ten)
//   ]}');
//   List<HocVien> arrKhoiTaoandroid = android.Optional();
//   print('Danh sách học viên khởi tạo của lớp ${android.ten}: ${[
//     ...arrKhoiTaoandroid.map((e) => e.ten)
//   ]}');
//   List<HocVien> arrKhoiTaoios = ios.Optional();
//   print('Danh sách học viên khởi tạo của lớp ${ios.ten}: ${[
//     ...arrKhoiTaoios.map((e) => e.ten)
//   ]}');
//   List<HocVien> arrKhoiTaoweb = web.Optional();
//   print('Danh sách học viên khởi tạo của lớp ${web.ten}: ${[
//     ...arrKhoiTaoweb.map((e) => e.ten)
//   ]}');

//   //flutter.setSoBuoiHoc=10;
//   //print(flutter.getSoBuoiHoc);
// }

void test(String test) {
  print('Đây là hàm test params test: $test');
}

void functionTest(Function function) {
  function.call();
}

void main(List<String> args) {
  functionTest(() => test('abcd'));
//flutter.capnhat(10, () => funCapNhat(flutter.getSoBuoiHoc,ios));

  flutter.capnhat(12, () => flutter1(flutter));

  print(flutter.getSoBuoiHoc);
  print(android.getSoBuoiHoc);
  print(ios.getSoBuoiHoc);
  print(web.getSoBuoiHoc);


android.capnhat(18, () => flutter1(android));
  print(flutter.getSoBuoiHoc);
  print(android.getSoBuoiHoc);
  print(ios.getSoBuoiHoc);
  print(web.getSoBuoiHoc);
}

// int expresion1()
// {
//   return "a";
// }

void funCapNhat(int sobuoi, LopHoc ios) {
  ios.setSoBuoiHoc = sobuoi + 5;
  //ios.
  //print('a');
}

LopHoc flutter = LopHoc(ten: 'Flutter', soluong: 11, arrBuild: []);
LopHoc ios = LopHoc(ten: 'Flutter', soluong: 11, arrBuild: []);
LopHoc web = LopHoc(ten: 'web', soluong: 11, arrBuild: []);
LopHoc android = LopHoc(ten: 'web', soluong: 11, arrBuild: []);

// Số buổi học không thể nhỏ hơn 10 buổi.
// Số buổi học của Android luôn luôn nhiều hơn Flutter 5 buổi.
// Số buổi học của ios luôn luôn nhiều android 3 buổi.
// Số buổi học của Web luôn luôn ít hơn flutter 2 buổi.
void flutter1(LopHoc lop) {
 
  if (lop == flutter) {
    android.setSoBuoiHoc = lop.getSoBuoiHoc + 5;
    ios.setSoBuoiHoc = lop.getSoBuoiHoc + 8;
    web.setSoBuoiHoc = lop.getSoBuoiHoc - 2;
  }
  else if(lop==android)
  {
    flutter.setSoBuoiHoc = lop.getSoBuoiHoc - 5;
    ios.setSoBuoiHoc = lop.getSoBuoiHoc + 3;
    web.setSoBuoiHoc = lop.getSoBuoiHoc - 7;
  }
  else if(lop==web)
  {
    flutter.setSoBuoiHoc = lop.getSoBuoiHoc -8;
    android.setSoBuoiHoc = lop.getSoBuoiHoc -5;
    web.setSoBuoiHoc = lop.getSoBuoiHoc - 10;
  }
  else if(lop==ios)
  {
    flutter.setSoBuoiHoc = lop.getSoBuoiHoc + 2;
    android.setSoBuoiHoc = lop.getSoBuoiHoc + 7;
    ios.setSoBuoiHoc = lop.getSoBuoiHoc +10;
  }
}


class LopHoc {
  final String ten;
  final int soluong;
  final List<Build> arrBuild;
  int _soBuoiHoc = 0;
  List<HocVien> arrHocVien = [];

  LopHoc({required this.ten, required this.soluong, required this.arrBuild});

  int get getSoBuoiHoc => _soBuoiHoc;

  set setSoBuoiHoc(int value) {
    if (value < 10) {
      throw Exception("Số buổi học ${this.ten} không thể nhỏ hơn 10 buổi");
    } else
      _soBuoiHoc = value;
    //_soBuoiHoc = value;
  }

  void capnhat(int so, Function func) {
    this.setSoBuoiHoc = so;
    func.call();
  }
}

class HocVien {
  final String ten;
  //final List<LopHoc> arrLopHoc;

  HocVien({required this.ten});
}

class Build {
  final String ten;
  Build({required this.ten});
}
