void main(List<String> args) {
  final phones = <String>['Nokia', 'Xiaomi', 'iPhone'];
  print(phones);
  print(
      '${identityHashCode(phones[0])} - ${identityHashCode(phones[1])} - ${identityHashCode(phones[2])}');
  // viết code ở đây, đổi vị trí Xiaomi và iPhone
  doiViTri([...phones], 1, 2);
  doiViTri1([...phones], 1, 2);
  doiViTri2([...phones], 1, 2);
}

void doiViTri(List<String> phones, int index1, int index2) {
  var temp = phones[index1];
  phones[index1] = phones[index2];
  phones[index2] = temp;
  print('Cách 1:\n$phones');
  print(
      '${identityHashCode(phones[0])} - ${identityHashCode(phones[1])} - ${identityHashCode(phones[2])}');
}

void doiViTri1(List<String> phones, int index1, int index2) {
  phones[index1] = phones[index1] + phones[index2];
  phones[index2] = phones[index1]
      .substring(0, phones[index1].length - phones[index2].length);
  phones[index1] = phones[index1].substring(phones[index2].length);
  print('Cách 2:\n$phones');
  print(
      '${identityHashCode(phones[0])} - ${identityHashCode(phones[1])} - ${identityHashCode(phones[2])}');
}

void doiViTri2(List<String> phones, int index1, int index2) {
  List<int> arrhashcode = [...phones.map((e) => identityHashCode(e))];

  arrhashcode[index1] = arrhashcode[index1] ^ arrhashcode[index2];
  arrhashcode[index2] = arrhashcode[index1] ^ arrhashcode[index2];
  arrhashcode[index1] = arrhashcode[index1] ^ arrhashcode[index2];

  List arrnew = [];
  for (var element in arrhashcode) {
    for (int i = 0; i < phones.length; i++) {
      if (identityHashCode(phones[i]) == element) {
        arrnew.add(phones[i]);
        phones.remove(phones[i]);
        break;
      }
    }
  }
  print('Cách 3:\n$arrnew');
  print(arrhashcode);
}
