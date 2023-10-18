
import 'dart:math';

abstract class BuildAndroid {}

abstract class BuildIos {}

abstract class BuildWeb {}

abstract class BuildDesktopApp {}

class LopHoc implements BuildAndroid, BuildDesktopApp, BuildIos, BuildWeb {
  final String ten;
  final int soluong;
  int _soBuoiHoc=0;

  LopHoc({required this.ten, required this.soluong});

  int get getSoBuoiHoc => _soBuoiHoc;

  set setSoBuoiHoc(int value) {
    if (value < 10) {
      throw Exception("Số buổi học không thể nhỏ hơn 10 buổi");

    } else
      _soBuoiHoc = value;
    //_soBuoiHoc = value;
  }
  void Set1(int sobuoi,List<LopHoc> arrLopHoc)
  {
    
  }
  
  //LopHoc({required this.ten, required this.soluong});

  

}

void main(List<String> args) {


  LopHoc flutter = LopHoc(ten: 'Flutter', soluong: 11);
  LopHoc android = LopHoc(ten: 'android', soluong: 12);
  LopHoc ios = LopHoc(ten: 'ios', soluong: 13);
  LopHoc web = LopHoc(ten: 'web', soluong: 14);

  flutter.setSoBuoiHoc=10;
  print(flutter.getSoBuoiHoc);
  // flutter.Set1(50);
  print(flutter.getSoBuoiHoc);

  // functionTest(() => test('chay ham test'));
  // var ret1 = functionTestCallBack((abc) => ham1(123));
  // print(ret1);
}

void test(String test) {
  print('Đây là hàm test params test: $test');
}

int ham1(int a) {
  return a;
}

String functionTestCallBack(int Function(String) callbak) {
  int result = callbak.call('');
  print('Kết quả thực thi Function: $result');
  return result.toString();
}

void functionTest(Function function) {
  function.call();
}
