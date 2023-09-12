void main(List<String> args) {
  final phones = <String>['Nokia', 'Xiaomi', 'iPhone'];
  final hashcode = <int>[
    identityHashCode(phones[0]),
    identityHashCode(phones[1]),
    identityHashCode(phones[2])
  ];

  print(phones);
  print(hashcode);
  swapWithoutTemp(hashcode, 1, 2);
  print(hashcode);

  // viết code ở đây, đổi vị trí Xiaomi và iPhone

  // print(phones);
  // print(
  //     '${identityHashCode(phones[0])} - ${identityHashCode(phones[1])} - ${identityHashCode(phones[2])}');

  //   List<int> numbers = [1, 2, 3, 4, 5];

  // // Swap the elements at positions 1 and 3 without a temporary variable
  // swapWithoutTemp(numbers, 1, 3);

  // print(numbers); // Output: [1, 4, 3, 2, 5]
}

void swapWithoutTemp(List<int> list, int index1, int index2) {
  if (index1 == index2) {
    return; // No need to swap if indices are the same
  }

  list[index1] = list[index1] ^ list[index2];
  list[index2] = list[index1] ^ list[index2];
  list[index1] = list[index1] ^ list[index2];
}
