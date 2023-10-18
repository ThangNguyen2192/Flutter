class Person {}

class Artist extends Person with Sketching {
  @override
  void sketching() {
    print("override sketching");
  }
}

class Engineer extends Person with Sketching, Reading {}

class Doctor extends Person with Reading, Excercise {}

class Athlete extends Person {}

class Boxer extends Athlete with Excercise, Boxing {}

mixin Sketching {
  void sketching() {
    print("test");
  }
}
mixin Reading {}
mixin Excercise {}
mixin Boxing {}

void main(List<String> args) {
  Engineer a = Engineer()..sketching(); //--.. để gọi lại về chính Engineer
}


//-- mixin on
class Person1 {
 final String name;
 Person1({required this.name});
}

class Mercenary extends Person1 with PersonAction {
 Mercenary({required name}) : super(name:name);
}

mixin PersonAction on Person1 {
 late int age;
 void action (){ print ("action from PersonAction");}
}
