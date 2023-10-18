//void main(List<String> args) {
// List<String> str = [];
// Map<String, String> map = {"a": "1"};
// map.addAll({"b": "2"});

// Action a =Action();
// print(a.name);
// ActionGo go=ActionGo();
// print(go.go);
// }
void main(List<String> args) {
  Person<Action> personAction = Person(action: Action());
  Person<ActionGo> personGo = Person(action: ActionGo());
  Person<ActionPaint> personPaint = Person(action: ActionPaint());

  print("action -> ${personAction.action.name}"); // action is Action
  print("actionGo -> ${personGo.action.go}"); // action is ActionGo
  print("actionPaint -> ${personPaint.action.paint}"); // action is ActionPaint
}

//1. Tạo class cha Action:
class Action {
  String get name => "ActionName";
}

//2. Tạo 2 class con extend `Action`:
class ActionGo extends Action {
  String get go => "antionGo";
}

class ActionPaint extends Action {
  String get paint => "actionPaint";
}

//3. Tạo class Person với Generic T. Chú ý `T extends Action`
//tức bất cứ class nào extends Action đều thỏa mãn
class Person<T extends Action> {
  final T action;

  const Person({required this.action});
  void test() {
    List<T> actions = [];
    Map<String, T> map = {"key": action};
  }
}
