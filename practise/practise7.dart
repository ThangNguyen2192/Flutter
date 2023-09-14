import 'dart:math';

void main(List<String> args) {
  //1. diagrams
  LopHoc flutter = LopHoc(ten: 'Flutter', soluong: 11);
  LopHoc android = LopHoc(ten: 'android', soluong: 12);
  LopHoc ios = LopHoc(ten: 'ios', soluong: 13);
  LopHoc web = LopHoc(ten: 'web', soluong: 14);

  List<HocVien> arrHocVien = [];
  arrHocVien.add(HocVien(ten: 'A', arrLopHoc: [flutter]));
  arrHocVien.add(HocVien(ten: 'B', arrLopHoc: [flutter, android]));
  arrHocVien.add(HocVien(ten: 'C', arrLopHoc: [android]));
  arrHocVien.add(HocVien(ten: 'D', arrLopHoc: [android, ios]));
  arrHocVien.add(HocVien(ten: 'E', arrLopHoc: [ios]));
  arrHocVien.add(HocVien(ten: 'F', arrLopHoc: [ios, web]));

  //--2. Tính toán số học viên thiếu
  print(
      'Số lượng học viên thiếu của lớp ${flutter.ten} là: ${flutter.remainMembers(arrHocVien)}');
  print(
      'Số lượng học viên thiếu của lớp ${android.ten} là: ${android.remainMembers(arrHocVien)}');
  print(
      'Số lượng học viên thiếu của lớp ${ios.ten} là: ${ios.remainMembers(arrHocVien)}');
  print(
      'Số lượng học viên thiếu của lớp ${web.ten} là: ${web.remainMembers(arrHocVien)}');

  //--3. Khởi tạo học viên

  List<HocVien> arrKhoiTaoFultter = flutter.Optional(arrHocVien);
  print('Danh sách học viên khởi tạo của lớp ${flutter.ten}: ${[
    ...arrKhoiTaoFultter.map((e) => e.ten)
  ]}');
  List<HocVien> arrKhoiTaoandroid = android.Optional(arrHocVien);
  print('Danh sách học viên khởi tạo của lớp ${android.ten}: ${[
    ...arrKhoiTaoandroid.map((e) => e.ten)
  ]}');
  List<HocVien> arrKhoiTaoios = ios.Optional(arrHocVien);
  print('Danh sách học viên khởi tạo của lớp ${ios.ten}: ${[
    ...arrKhoiTaoios.map((e) => e.ten)
  ]}');
  List<HocVien> arrKhoiTaoweb = web.Optional(arrHocVien);
  print('Danh sách học viên khởi tạo của lớp ${web.ten}: ${[
    ...arrKhoiTaoweb.map((e) => e.ten)
  ]}');
}

abstract class BuildAndroid {}

abstract class BuildIos {}

abstract class BuildWeb {}

abstract class BuildDesktopApp {}

class LopHoc implements BuildAndroid, BuildDesktopApp, BuildIos, BuildWeb {
  final String ten;
  final int soluong;
  LopHoc({required this.ten, required this.soluong});

  ///Tính số lượng học viên thiếu
  int remainMembers(List<HocVien> arrHocVien) {
    //--Lấy ra các học viên của lớp đang xử lý trong danh sách các học viên truyền vào
    List<HocVien> arrHocVienCuaLop = [
      ...arrHocVien.where((e) => e.arrLopHoc.contains(this))
    ];

    int slthieu = this.soluong - arrHocVienCuaLop.length;
    //print('Số lượng học viên thiếu của lớp ${this.ten} là: $slthieu');
    return slthieu;
  }

  ///Khởi tạo toàn bộ học viên thiếu
  List<HocVien> Optional(List<HocVien> arrHocVien) {
    List<HocVien> arrNew = [
      ...arrHocVien.where((e) => e.arrLopHoc.contains(this))
    ];

    //--Loại bỏ đi các tên đã có ở trong lớp
    String charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for (var e in arrNew) {
      charset = charset.replaceAll(e.ten, '');
    }

    //--Lấy ra số lượng thiếu của lớp
    int slthieu = this.remainMembers(arrHocVien);

    //Duyệt qua số lượng các học viên thiếu để thêm vào
    for (int i = 0; i < slthieu; i++) {
      int randomIndex = Random().nextInt(charset.length);
      String randomChar = charset[randomIndex];
      charset = charset.replaceAll(randomChar, '');

      HocVien hvthem = HocVien(
          ten: randomChar,
          arrLopHoc: [LopHoc(ten: this.ten, soluong: this.soluong)]);

      arrNew.add(hvthem);
    }
    // print('Danh sách học viên khởi tạo của lớp ${this.ten}: ${[
    //   ...arrNew.map((e) => e.ten)
    // ]}');
    return arrNew;
  }
}

class HocVien {
  final String ten;
  final List<LopHoc> arrLopHoc;

  HocVien({required this.ten, required this.arrLopHoc});
}
