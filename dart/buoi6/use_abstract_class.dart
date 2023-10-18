void main(List<String> args) {}

class Person {}

class Artist extends Person implements Sketching {
  @override
  void sketching() {
    print("test");
  }
}

class Engineer extends Person implements Sketching, Reading {
  @override
  void sketching() {
    print("test");
  }
}

class Doctor extends Person implements Reading, Excercise {}

class Athlete extends Person {}

class Boxer extends Athlete implements Excercise, Boxing {}

abstract class Sketching {
  void sketching() {
    print("test");
  }
}

abstract class Reading {}

abstract class Excercise {}

abstract class Boxing {}
