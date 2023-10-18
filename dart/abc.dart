List<String> bt1(List<String> words) {
  Map<String, int> map = {
    "Q": 1,
    "W": 1,
    "E": 1,
    "R": 1,
    "T": 1,
    "Y": 1,
    "U": 1,
    "I": 1,
    "O": 1,
    "P": 1,
    "A": 2,
    "S": 2,
    "D": 2,
    "F": 2,
    "G": 2,
    "H": 2,
    "J": 2,
    "K": 2,
    "L": 2,
    "Z": 3,
    "X": 3,
    "C": 3,
    "V": 3,
    "B": 3,
    "N": 3,
    "M": 3,
  };
  List<String> kq = [];

  for (String word in words) {
    if (word.isEmpty) continue;
    print(word);

    // int hang = map[word[0].toLowerCase()]!;
    // // print(hang);
    // bool isok = true;
    // for (String char in word.split('')) {
    //   if (map[char.toLowerCase()] != hang) {
    //     isok = false;
    //     break;
    //   }
    // }
    // if (isok) kq.add(word);
  }

  return kq;
}

void main(List<String> args) {
  print(bt1(["Hello", "Alaska", "Dad", "Peace"]));
}

class HocSinh {
  String ten;
  int tuoi;
  String lop;
  String? soThich;
  String? taiNang;
  HocSinh({required this.ten, required this.tuoi, required this.lop});

  String _id = "";
  String get id {
    return _id;
  }

  set id(String id) {
    _id = id + "fdsfdsf";
  }
}
