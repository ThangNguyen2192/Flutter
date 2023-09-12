void main(List<String> args) {
  /*
Viết 1 chương trình:
Đầu vào là 1 mảng số tự nhiên từ 0 -> 100
Liệt kê ra toàn bộ các số lẻ
Liệt kê ra toàn bộ số chẵn
Kiểm tra xem 0 là số chẵn hay số lẻ
  */

  List<int> arr = <int>[];
  for (int i = 0; i <= 100; i++) {
    arr.add(i);
  }
  print('Mảng:\n$arr');

  List<int> arrchan=[...arr.where((e) => (e%2==0))];
  print('\nMảng số chẵn:\n$arrchan');

  List<int> arrle=[...arr.where((e) => (e%2==1))];
  print('\nMảng số lẻ:\n$arrle');

  for(int i=0;i<arr.length;i++)
  {
    if(arr[i]==0)
    {
      print('\n${arr[i]%2==0?'${arr[i]} là số chẵn':'${arr[i]} là số lẻ'}');

      break;
    }
  }
}
