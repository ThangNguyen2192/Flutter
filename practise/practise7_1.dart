import 'dart:math';

void main(List<String> args) {
  //1. diagrams
  HocVien A = HocVien(ten: 'A');
  HocVien B = HocVien(ten: 'B');
  HocVien C = HocVien(ten: 'C');
  HocVien D = HocVien(ten: 'D');
  HocVien E = HocVien(ten: 'E');
  HocVien F = HocVien(ten: 'F');

  Build buildAndroid = Build(ten: 'Android');
  Build buildIos = Build(ten: 'ios');
  Build buildWeb = Build(ten: 'web');
  Build buildDesktopApp = Build(ten: 'DesktopApp');

  LopHoc flutter = LopHoc(
      ten: 'Flutter',
      soluong: 11,
      arrBuild: [buildAndroid, buildIos, buildWeb, buildDesktopApp]);
  flutter.arrHocVien = [A, B];
  LopHoc android =
      LopHoc(ten: 'android', soluong: 12, arrBuild: [buildAndroid]);
  android.arrHocVien = [B, C, D];
  LopHoc ios = LopHoc(ten: 'ios', soluong: 13, arrBuild: [buildIos]);
  ios.arrHocVien = [D, E, F];
  LopHoc web = LopHoc(ten: 'web', soluong: 14, arrBuild: [buildWeb]);
  web.arrHocVien = [F];

  //--2. Tính toán số học viên thiếu
  print(
      'Số lượng học viên thiếu của lớp ${flutter.ten} là: ${flutter.remainMembers()}');
  print(
      'Số lượng học viên thiếu của lớp ${android.ten} là: ${android.remainMembers()}');
  print(
      'Số lượng học viên thiếu của lớp ${ios.ten} là: ${ios.remainMembers()}');
  print(
      'Số lượng học viên thiếu của lớp ${web.ten} là: ${web.remainMembers()}');

  //--3. Khởi tạo học viên

  List<HocVien> arrKhoiTaoFultter = flutter.Optional();
  print('Danh sách học viên khởi tạo của lớp ${flutter.ten}: ${[
    ...arrKhoiTaoFultter.map((e) => e.ten)
  ]}');
  List<HocVien> arrKhoiTaoandroid = android.Optional();
  print('Danh sách học viên khởi tạo của lớp ${android.ten}: ${[
    ...arrKhoiTaoandroid.map((e) => e.ten)
  ]}');
  List<HocVien> arrKhoiTaoios = ios.Optional();
  print('Danh sách học viên khởi tạo của lớp ${ios.ten}: ${[
    ...arrKhoiTaoios.map((e) => e.ten)
  ]}');
  List<HocVien> arrKhoiTaoweb = web.Optional();
  print('Danh sách học viên khởi tạo của lớp ${web.ten}: ${[
    ...arrKhoiTaoweb.map((e) => e.ten)
  ]}');

  //flutter.setSoBuoiHoc=10;
  //print(flutter.getSoBuoiHoc);
}

class Build {
  final String ten;
  Build({required this.ten});
}

class LopHoc {
  final String ten;
  final int soluong;
  final List<Build> arrBuild;
  List<HocVien> arrHocVien = [];

  LopHoc({required this.ten, required this.soluong, required this.arrBuild});

  ///Tính số lượng học viên thiếu
  int remainMembers() {
    int slthieu = this.soluong - this.arrHocVien.length;
    if (slthieu < 0) slthieu = 0;
    return slthieu;
  }

  ///Khởi tạo toàn bộ học viên thiếu
  List<HocVien> Optional() {
    List<HocVien> arrNew = [...this.arrHocVien];

    //--Loại bỏ đi các tên đã có ở trong lớp
    String charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for (var e in arrNew) {
      charset = charset.replaceAll(e.ten, '');
    }

    //--Lấy ra số lượng thiếu của lớp
    int slthieu = this.remainMembers();

    //Duyệt qua số lượng các học viên thiếu để thêm vào
    for (int i = 0; i < slthieu; i++) {
      int randomIndex = Random().nextInt(charset.length);
      String randomChar = charset[randomIndex];
      charset = charset.replaceAll(randomChar, '');
      arrNew.add(HocVien(ten: randomChar));
    }
    // print('Danh sách học viên khởi tạo của lớp ${this.ten}: ${[
    //   ...arrNew.map((e) => e.ten)
    // ]}');
    return arrNew;
  }
}

class HocVien {
  final String ten;
  //final List<LopHoc> arrLopHoc;

  HocVien({required this.ten});
}
