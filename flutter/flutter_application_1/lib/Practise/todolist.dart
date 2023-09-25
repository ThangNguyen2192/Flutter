import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoClass> todoList = [
    TodoClass(id: '1', name: 'Đi làm'),
    TodoClass(id: '2', name: 'Đi chơi'),
    TodoClass(id: '3', name: 'Đi học'),
  ];

  TextEditingController textController = TextEditingController();

  void ThemMoi() {
    if (textController.text.isNotEmpty) {
      setState(() {
        todoList.add(TodoClass(
            id: DateTime.now().toString(), name: textController.text));
        textController.text = '';
      });
    }
  }

  void ThemTat() {
    if (textController.text.isNotEmpty) {
      setState(() {
        todoList.add(TodoClass(
            id: DateTime.now().toString(), name: textController.text));
        textController.text = '';
        Navigator.pop(context);
      });
    }
  }

  void Xoa(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "TodoList",
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                children: todoList
                    .map((e) => TodoWidget(
                          id: e.id,
                          name: e.name,
                          index: todoList.indexOf(e),
                          fnXoa: Xoa,
                        ))
                    .toList()),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(context);
            showModalBottomSheet(
              isScrollControlled: true, //quay ngang vẫn show được
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: MediaQuery.of(context)
                      .viewInsets, //Mở bàn phím lên mà k bị che mất đi text và nút
                  child: Container(
                    // height: 200,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        //--Quay ngang thì chuyển sang cuộn để k lỗi
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextField(
                              controller: textController,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                              decoration: const InputDecoration(
                                  labelText: 'Nhập thông tin:',
                                  border: OutlineInputBorder()),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: ThemMoi,
                                      child: const Text('Thêm + Mới')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: ThemTat,
                                      child: const Text('Thêm + Tắt')),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            size: 50,
          ),
        ));
  }
}

class TodoWidget extends StatelessWidget {
  const TodoWidget(
      {super.key,
      required this.id,
      required this.name,
      required this.index,
      required this.fnXoa});
  final String id;
  final String name;
  final int index;
  final Function fnXoa;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 50,
      decoration: BoxDecoration(
          color: (index % 2 == 0)
              ? const Color.fromARGB(255, 227, 225, 225)
              : const Color.fromARGB(255, 232, 186, 186),
          //color: const Color.fromARGB(255, 232, 186, 186),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
            InkWell(
                onTap: () async {
                  if (await confirm(context,
                      //title: const Text('Bạn có muốn xoá không?'),
                      content: const Text('Bạn có muốn xoá không?'))) {
                    //return print('pressedOK');
                    fnXoa(id);
                  }
                  // return print('pressedCancel');
                },
                child: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}

class TodoClass {
  final String name;
  final String id;

  TodoClass({required this.id, required this.name});
}
