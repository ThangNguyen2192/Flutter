void main(List<String> arguments) {
  int a = 10;
  a *= 2;
  print('a => $a');
  print(a++);
  print(++a);
  print(a);
  int a1 = a ~/ 2;
  print(a1);
  print(a % 3);
  
  bool b = true;
  print('ket qua la: ${b ? 'b==true' : 'b==false'}');
  print('kq la: ${b == true ? 'true' : 'false'}');

  int count = 10;
  for (var i = 0; i < count; i++) {
    if (count == 10) {
      count = 0;
    }
    print(i);
  }
  List ints = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  for (int i in ints) {
    print(i);
  }
  int a2 = 10;
  try {
    a2 = int.parse('abc');
  } catch (ex, s) {
    print(ex);
    print(s);
  }
}
