void main(List<String> arguments) {
  print('abc');
  functionTest(() => test('function call function'));

  var ret = functionTestCallBack(parseStringFromInt);
  print(ret);
  var ret1 = functionTestCallBack((intstr) => parseStringFromInt('12345'));
  print(ret1);

  var ret3 =
      functionTestCallBack1(test, (intstr) => parseStringFromInt('fdfdfdfd'));
  print(ret3);

  functionWithOptionalParam();
  functionWithOptionalParam(b: 'bien b', a: 'bien a');

  functionPositionalParam('a', 5);
  List<DayOfWeeks> dayOfWeeks = DayOfWeeks.values;
  for (var element in dayOfWeeks) {
    print('day is: ${element.getName()}');
  }

  for (var e in dayOfWeeks) {
    print('day is: ${e.getName()}');
  }

  String? snull;
  snull = 'abc';
  List<String> list1 = snull.split('') ?? [];

  List<String> list2 = snull.split('');
}

void test(String test) {
  print('Đây là hàm test params test: $test');
}

int parseStringFromInt(String number) => int.tryParse(number) ?? -1;

void functionTest(Function function) {
  function.call();
}

String functionTestCallBack(int Function(String) callbak) {
  int result = callbak.call("");
  return 'Kết quả thực thi Function: $result';
}

String functionTestCallBack1(Function function, int Function(String) callbak) {
  int result = callbak.call("");
  return 'Kết quả thực thi Function: $result';
}

void functionWithOptionalParam({String a = 'a', String b = 'b'}) {
  print('params a=$a,b=$b');
}

void functionPositionalParam(String a, int k,
    [String b = '', String c = '', String d = '', int e = 0]) {
  print('a=$a,b=$b,c=$c,d=$d,k=$k,e=$e');
}

enum DayOfWeeks {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

extension DayOfWeeksExt on DayOfWeeks {
  String getName() {
    switch (this) {
      case DayOfWeeks.Monday:
        return "Thứ 2";
      case DayOfWeeks.Tuesday:
        return "Thứ 3";
      case DayOfWeeks.Wednesday:
        return "Thứ 4";
      case DayOfWeeks.Thursday:
        return "Thứ 5";
      case DayOfWeeks.Friday:
        return "Thứ 6";
      case DayOfWeeks.Saturday:
        return "Thứ 7";
      case DayOfWeeks.Sunday:
        return "Chủ nhật";
      default:
        return "Không xác định";
    }
  }
}
