//import 'dart:html';
import 'dart:math';

void main(List<String> args) {
  // bt3([1, 2, 2, 1], [2, 2]);
  String s = '()[]{}([{}])(){}[]';
  String s1 = '([])';
  print(isValid(s));
  print(isValid(s1));
  //print(s.substring(0,1))
  // print(repeatedSubstringPattern(s));
}

bool isValid(String s) {
  /*
chạy vòng lặp while kiểm tra nếu chuỗi chứa () hoặc {} hoặc [] thì replace về trống
Kiểm tra nếu s còn lại là '' thì là true
  */
  while (s.isNotEmpty &&
      (s.contains("()") || s.contains("[]") || s.contains("{}"))) {
    s = s.replaceAll("()", "").replaceAll("{}", "").replaceAll("[]", "");
  }
  if (s.isEmpty)
    return true;
  else
    return false;
  // List<String> list = [];
  // for (int i = 0; i < s.length ~/ 2; i++) {
  //   list.add(s.substring(i * 2, i * 2 + 2));
  // }
  // // print(list);
  // // print(list.toSet());
  // Set set = list.toSet();
  // print(set);
  // set.remove("()");
  // set.remove("[]");
  // set.remove("{}");
  // print(set);
  // if (set.length == 0) return true;
  // return false;
}

bool repeatedSubstringPattern(String s) {
  //--Kiểm tra trường hợp nếu chuỗi s chỉ chứa 1 loại ký tự thì luôn đúng
  if (s.length > 1 && s.split('').toSet().length == 1) {
    return true;
  }

  //--duyệt theo dodai chuỗi con, có giá trị từ 2 chạy đến s.length ~/ 2
  for (int dodai = 2; dodai <= s.length ~/ 2; dodai++) {
    //--Kiểm tra nếu độ dài chuỗi s mà chia hết cho độ dài chuỗi con đang xử lý thì mới chạy
    if (s.length % dodai == 0) {
      List<String> list = []; //--Khai báo mảng để lưu các chuỗi con
      int sochuoi = s.length ~/ dodai; //--Tính ra số chuỗi con được cắt ra
      for (int i = 0; i < sochuoi; i++) {
        //--Duyệ qua số chuỗi con
        list.add(s.substring(i * dodai,
            i * dodai + dodai)); //--Cắt ra để lấy chuỗi con và đưa vào mảng
      }
      if (list.toSet().length ==
          1) //--Chuyển mảng chuỗi con sang set nếu set có đội dài bằng 1 thì là true và dừng lại
      {
        print(list.toSet());
        return true;
      }
    }
  }

  return false;
}

List<int> bt3(List<int> nums1, List<int> nums2) {
  List<int> kq = [];
  Set<int> set1 = nums1.toSet();
  Set<int> set2 = nums2.toSet();
  for (int element in set1) {
    if (set2.contains(element)) kq.add(element);
  }
  print(kq);

  Set<int> kq1 = set1.intersection(set2);
  print(kq1);
  return kq;
}

int bt2(List<int> candyType) {
  Set<int> set = candyType.toSet();
  if (set.length >= candyType.length ~/ 2)
    return candyType.length ~/ 2;
  else
    return set.length;
}

int countMatches(List<List<String>> items, String ruleKey, String ruleValue) {
  int dem = 0;
  for (int i = 0; i < items.length; i++) {
    switch (ruleKey) {
      //--Kiểm tra ruleKey
      case "type": // nếu là ruleKey = type thì kiểm tra vị trí thứ 0 của mảng con
        {
          if (items[i][0] == ruleValue) dem++;
          break;
        }
      case "color": // nếu là ruleKey = color thì kiểm tra vị trí thứ 1 của mảng con
        {
          if (items[i][1] == ruleValue) dem++;
          break;
        }
      case "name": // nếu là ruleKey = name thì kiểm tra vị trí thứ 2 của mảng con
        {
          if (items[i][2] == ruleValue) dem++;
          break;
        }
    }
  }
  print(dem);
  return dem;
}

List<String> sortPeople(List<String> names, List<int> heights) {
  for (int i = 0; i < names.length; i++) {
    //--Duyệt qua từng phần tử của names
    names[i] = heights[i].toString() +
        "_" +
        names[i]; //--Cộng thêm phần tử của heights vào names
  }
  names.sort((a, b) => (int.parse(b.split('_')[0]))
      .compareTo(int.parse(a.split('_')[0]))); //--Sắp xếp lại names
  for (int i = 0; i < names.length; i++) {
    names[i] = names[i].split('_')[1]; //--Loại bỏ đi heights trong names
  }
  //print(names);
  return names;
}

List<int> bt1(List<int> nums) {
  List<int> ans = [];
  for (var num in nums) {
    ans.add(nums[num]);
  }
  print(ans);
  return ans;
}

String findTheDifference(String s, String t) {
  // Tạo bản sao của chuỗi t
  List<String> tCopy = t.split('');
  for (String char in s.split('')) {
    // Loại bỏ các ký tự của chuỗi s khỏi bản sao của chuỗi t
    print(tCopy);
    tCopy.remove(char);
    print(tCopy);
  }
  // Chữ cái còn lại trong bản sao của chuỗi t chính là chữ cái đã được thêm vào
  String addedCharacter = tCopy[0];
  return addedCharacter;
}

class Solution3 {
  int numJewelsInStones(String jewels, String stones) {
    int dem = 0;
    for (int i = 0; i < stones.length; i++) {
      //--Duyệt qua từng ký tự trong stones
      if (jewels.contains(stones[i]))
        dem++; //--Nếu jewels chứa ký tự đang kiểm tra thì là đúng, đếm tăng lên 1
    }
    return dem;
  }
}

class Solution2 {
  int lengthOfLastWord(String s) {
    List<String> list = s.trim().split(" "); //--Cắt String thành List
    return list[list.length - 1].length; //--Lấy ra độ dài phần tử cuối cùng
  }
}

class Solution1 {
  String findTheDifference(String s, String t) {
    List<String> ls = s.split(''); //--Lấy ra mảng ký tự từ s
    List<String> lt = t.split(''); //--Lấy ra mảng ký tự từ t
    for (int i = 0; i < lt.length; i++) {
      //--Duyệt qua từng phẩn từ của mảng lt
      {
        if (!ls.contains(lt[i])) {
          //--Kiểm tra nếu mẳng ls không chứa phần tử đang kiẻm tra thì return
          return lt[i]; //--dứng lại luôn do đã tìm thấy ký tự được thêm vào
        } else {
          for (int j = 0; j < ls.length; j++) {
            //--Duyệt qua từng phần tử của ls
            if (ls[j] == lt[i]) {
              //--Nếu phần từ ls mà khớp với pầhn từ lt đang kiểm tra
              ls.remove(ls[j]); //--Xoá phấn tử trên ls
              lt[i] = ''; //--gán lại phần từ lt về trống
              break; //--dừng lại kiểm tra ls do có thể có nhiều ký giống nhau
            }
          }
        }
      }
    }

    return ls.join(''); //--Két quả phần tử còn lại là phần tử được thêm vào
  }
}

class Solution {
  bool backspaceCompare(String s, String t) {
    s = xoaDauCach(s); //--Gọi hàm để xoá đi các ký tự bị xoá
    t = xoaDauCach(t); //--Gọi hàm để xoá đi các ký tự bị xoá
    if (s == t)
      return true;
    else
      return false;
  }

  String xoaDauCach(String s) {
    List<String> list = s.split(''); //--Chuyển String sang List<String>
    for (int i = list.length - 1; i >= 0; i--) {
      //--Duyệt i từ cuối lên đầu
      if (s[i] == '#') {
        //--Kiểm tra nếu ký tự đang duyệt là #
        list[i] = ''; //--sửa thành ''
        for (int j = i - 1; j >= 0; j--) {
          //Duyệt từ vị trí liền trước vị trí i về đầu
          if (list[j] != '#' && list[j].isNotEmpty) {
            //Kiểm tra nếu ký tự không phải # và khác trống thì chính là ký tự bị xoá tương ứng
            list[j] = ''; //--Gán ký tự bị xoá về trống
            break; //--Dừng lại vòng lặp của j do đã tìm thấy ký tự bị xoá
          }
        }
      }
    }
    return list.join(); //--Chuyển từ List sang String
  }
}

String toLowerCase(String s) {
  String kq = "";

  for (int i = 0; i < s.length; i++) {
    if (s[i].codeUnitAt(0) < 97) {
      kq += String.fromCharCode(s[i].codeUnitAt(0) + 32);
    } else {
      kq += s[i];
    }
  }
  return kq;
}

String bt(String str, from, replace) {
  return str.replaceAll(from, replace);
}

List<String> reverseString(List<String> list) {
  int i = 0;
  int j = list.length - 1;
  while (i < j) {
    String gt = list[j];
    list[j] = list[i];
    list[i] = gt;
    i++;
    j--;
  }
  return list;
}
