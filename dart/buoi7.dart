void main(List<String> args) {
  //print(bt1(5));
  //print(bt1(3));
  print(kiemTraSoNguyen(1));
  print(kiemTraSoNguyen(16));
  print(kiemTraSoNguyen(17));
}

bool kiemTraSoNguyen(int num) {
  for (int i = 1; i <= num; i++) {
    if (i * i == num) {
      return true;
    } else if (i * i > num) {
      return false;
    }
  }
  return false;
}

bool Explantion(int n) {
  for (int i = 1; i * i >= 0 && i * i <= n; i++) {
    if (i * i == n) {
      return true;
    }
  }

  return false;
}

List<String> bt1(int n) {
  List<String> arr = [];
  for (int i = 1; i <= n; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      arr.add('FizzBuzz');
    } else if (i % 3 == 0) {
      arr.add('Fizz');
    } else if (i % 5 == 0) {
      arr.add('Buzz');
    } else {
      arr.add(i.toString());
    }
  }
  return arr;
}
