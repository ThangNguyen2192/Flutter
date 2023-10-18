void main(List<String> args) {
  //int a=1;
  //print(int.tryParse('239537672423884969653287101'));
  print(bt2(11248));
  // print(bt4('239537672423884969653287101'));
}

String bt4(String num) {
  if (int.tryParse(num) == null) {
    print('input phải là chuỗi kiểu số nguyên');
    return "";
  } else {
    //Kiểm tra từ ký tự cuối lên, nếu ký tự kiểm tra là số lẻ thì số lẻ lớn nhất là từ ký tự đầu đến ký tự đang kiểm tra
    for (int i = num.length - 1; i >= 0; i--) {
      if (int.parse(num[i]) % 2 != 0) {
        return num.substring(0, i + 1);
      }
    }
  }
  return "";
}

String bt3(String num) {
  if (int.tryParse(num) == null) {
    print('input phải là chuỗi kiểu số nguyên');
    return "";
  } else if (int.tryParse(num)! % 2 != 0) {
    return num;
  } else {
    int soLeLonNhat = -1;
    for (int i = 0; i < num.length; i++) {
      String char = num[i];
      String str1 = num.substring(i + 1, num.length);
      int so = int.parse(char);
      if (so % 2 != 0 && so > soLeLonNhat) soLeLonNhat = so;
      if (str1.length > 0) {
        //String str2 = '';
        for (int k = 0; k < str1.length; k++) {
          int so = int.parse('$char${str1.substring(0, k + 1)}');
          // print(so);
          if (so % 2 != 0 && so > soLeLonNhat) soLeLonNhat = so;
        }
      }
      if (soLeLonNhat != -1)
        return soLeLonNhat.toString();
      else
        return "";
    }
  }
  return "";
}

int bt2(int num) {
  int dem = 0;
  String chuoi = num.toString();
  for (int i = 0; i < chuoi.length; i++) {
    int val = int.parse(chuoi[i]);
    if (num % val == 0) dem++;
  }

  return dem;
}

bool kiemTraLuyThua(int num) {
  if (num <= 0) //-- Nếu num<=0 thì không phải
  {
    return false;
  } else if (num == 1) {
    //--Nếu num==1 thì luôn đúng
    return true;
  } else {
    while (num % 4 == 0) {
      //--Thực hiện vòng lăp kiểm tra nếu num%4==0 thì gán num=num/4
      num = num ~/ 4;
      print(num);
    }

    if (num == 1) {
      //--Nếu num==1 thì là đúng
      return true;
    } else {
      return false;
    }
  }

  return false;
}
