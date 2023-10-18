void main(List<String> args) {
  // Mercenary mer = Mercenary(
  //     name: 'thang', age: 31, gun: Gun(name: 'AK', numberOfBullets: 20));
  // print(mer);
  // mer.shot();
  SinhVien sv = SinhVien();
  // print(sv.getAge);
  // sv.setAge = 32;
  // print(sv.getAge);
  Child c1 = Child(age: 23, gun: Gun(name: ' ak'));
  print(c1 is Child);
  print(c1 is Parent);
  print(c1.name);
  c1.test();

  Parent p1 = Parent(age: 20);
  p1.test();
  Parent p2 = Child(age: 20, gun: Gun(name: ' cd'));
  p2.test();

  Person per1 = Person(name: 'a', age: 23);

  Person per2 = Person.fromMock();
  print(per2.name);
  Person per3 = Person.fromMock1(50);
  print(per2.age);
}

class Person {
  // class
  final String name; // 1 properties trong class
  final int age;
  const Person({required this.name, required this.age});
  factory Person.fromMock() {
    return const Person(name: "David", age: 20);
  }

  factory Person.fromMock1(int age) {
    return Person(name: "David", age: age);
  }
}

class Parent {
  final String name = 'Parent';
  final int age;

  const Parent({required this.age});

  void test() {
    print('Run Parent');
  }
}

class Child extends Parent {
  @override
  String get name => "Child"; //--Thua ke thuoc tinh cua cha nhung co sua lai
  final Gun gun;

  const Child({required super.age, required this.gun});
  void shot() {}
  @override
  void test() {
    print('Run Child');
    super.test();
  }
}

class SinhVien {
  int _age = 10;
  int get getAge => _age;
  set setAge(int age) {
    if (age >= 0 && age <= 100) _age = age;
  }
}

// class Mercenary {
//   final String name;
//   final int age;
//   final Gun gun;
//   const Mercenary({required this.name, required this.age, required this.gun});
//   void shot() {
//     print(name + gun.name);
//   }
// }

class Gun {
  final String name;
  final int numberOfBullets;
  const Gun({required this.name, this.numberOfBullets = 0});
}
