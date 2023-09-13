void main(List<String> arguments) {
  String s = 'Hello world abc';
  String s1 = "Hello world";
  String s2 = '''f''';

  print(s);
  print(s1);
  print(s2);
  //Tach ky tu
  List<String> splittedStrs = s.split(' ');
  print("splittedStrs ->$splittedStrs");
  //Kiem tra chuoi co chua ky tu khong
  bool hasWordStr = s.contains('world');
  print('hasWordStr ->$hasWordStr');

  print(s.toLowerCase());
  print(s.toUpperCase());

  int indexOf = s.indexOf('llo');
  print("indexOf $indexOf");

  print(s.startsWith('h'));
  print(s.startsWith('H'));
  print(s.replaceAll('world', 'thang'));
  print(s.trim());

  int a = 10;
  int b = -10;
  print('a=$a');
  print('b=$b');
  double c = 10.5;
  double d = -10;
  print('c=$c');
  print(c.toInt());
  print(a + b + c + d);
  print((a + b + c + d).toInt());

  String aStr = a.toString();
  String cStr = c.toString();
  print(aStr);
  print(cStr);
  print(a.toDouble());

  print(int.parse('10'));
  print(double.parse('10'));

  print(int.tryParse('10'));
  print(int.tryParse('10a'));
  List strs = ["a", 'b', 'c'];
  print(strs);
  List<String> strs1 = <String>['1', '2', '3'];
  print(strs1);
  strs.add('d');
  print(strs);
  print(strs..add("d"));

  print('truoc remove $strs');
  strs.remove('d');
  print('Sau remove $strs');

  print('gia tri mang la: ${strs..add('a')}');
  print('dfsdfs \' " \$ \\ ');

  print('addAll${strs..addAll(strs1)}');

  strs = ['0', '1', '2', '3', '4', '5'];
  print('sublist${strs.sublist(2, 6)}');

  print(strs[5]);

  Map map = {"key": "value", 'key1': 'value1'};
  print("map $map");

  Map<String, String> map1 = <String, String>{};
  map1["key"] = "value";
  map1['key2'] = 'value2';
  print('Map1 $map1');

  Map<String, String> map2 = Map.from(map1);
  map2['key2'] = 'value2old';
  print('map2 $map2');
  print('key from map1 ${map1.keys.first}');
  print('value from map1 ${map1.values.first}');

  print('addAll${map2..addAll(map1)}');

  const con1 = 10;
  final fin1 = 10;
  late String str1;
}
