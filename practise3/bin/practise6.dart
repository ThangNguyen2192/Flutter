void main(List<String> args) {
  /*
Viết 1 chương trình:
In ra màn hình toàn bộ số nguyên tố của 1 số n cho trước.

  */
  inSoNguyenTo(100);
}

void inSoNguyenTo(int n) {
  List<int> arr = <int>[];
  for (int i = 0; i <= n; i++) {
    if (kiemTraSoNguyenTo(i)) {
      arr.add(i);
    }
  }

  print('Danh sách các số nguyên tố:\n$arr');
}

bool kiemTraSoNguyenTo(int so) {
  if (so <= 1) {
    // 0 và 1 không phải số nguyên tố
    return false;
  } else if (so == 2) // 2 là số nguyên tố
  {
    return true;
  } else if (so % 2 == 0) // nếu là số chẵn thì không phải là số nguyên tố
  {
    return false;
  } else {
    for (int i = 2; i <= so ~/ 2; i++) //Còn lại kiểm tra
    {
      if (so % i == 0) {
        return false;
      }
    }
    return true;
  }
}
