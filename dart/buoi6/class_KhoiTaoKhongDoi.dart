void main(List<String> args) {
  final s = Singleton();
  final s1 = Singleton();
  final s2 = Singleton.instance;

  print("s -> ${s.hashCode}");
  print("s1 -> ${s1.hashCode}");
  print("s2 -> ${s2.hashCode}");
  print("s.hashCode == s1.hashCode -> ${s.hashCode == s1.hashCode}");
  print("s.hashCode == s2.hashCode -> ${s.hashCode == s2.hashCode}");
}

class Singleton {
  static final Singleton instance = Singleton._();

  Singleton._();

  factory Singleton() => instance;
}
