void main(List<String> args) {
  int a = 10;
  print(a.add(1));
  print(a.subtract(2));
  print(a.divide(3));
  print(a.multiple(4));

  print(a.add(0));
}

/*
Thêm các phương thức add(), subtract, divide, multiple tương ứng với 4 phép tính: cộng, trừ, nhân, chia
4 phương thức này đều báo lỗi nếu truyền vào số <= 0
*/
extension NumExtensions on num {
  num add(int so) {
    if (so <= 0) {
      throw Exception("Số phải >=0");
    }
    return this + so;
  }

  num subtract(int so) {
    if (so <= 0) {
      throw Exception("Số phải >=0");
    }
    return this - so;
  }

  num divide(int so) {
    if (so <= 0) {
      throw Exception("Số phải >=0");
    }
    return this / so;
  }

  num multiple(int so) {
    if (so <= 0) {
      throw Exception("Số phải >=0");
    }
    return this * so;
  }
}
