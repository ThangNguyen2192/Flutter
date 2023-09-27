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
  int _maxindex = 0;

  TextEditingController textController = TextEditingController();
  TextEditingController textSearch = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onIconClick() {
    // Request focus on the TextField when the icon is clicked
    FocusScope.of(context).requestFocus(_focusNode);
  }

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

  bool _isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: !_isSearching
            ? AppBar(
                backgroundColor: Colors.blue,
                title: const Text(
                  "TodoList",
                  style: TextStyle(fontSize: 30),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        _isSearching = true;
                        setState(() {});
                        _onIconClick;
                      },
                      icon: const Icon(Icons.search))
                ],
              )
            : AppBar(
                backgroundColor: Colors.blue,
                leading: IconButton(
                    onPressed: () {
                      _isSearching = false;
                      textSearch.clear();
                      setState(() {});
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
                title: SizedBox(
                  height: 40,
                  //margin: const EdgeInsets.all(20),
                  // height: 46,
                  child: Focus(
                    focusNode: _focusNode,
                    child: TextField(
                      textAlignVertical: TextAlignVertical
                          .bottom, // Center vertically Căn cho chữ luôn ở giữa dòng theo chiều đứng
                      controller: textSearch,
                      style: const TextStyle(fontSize: 18),
                      // textAlign: TextAlign.left,
                      // textAlign: TextAlign.mid,
                      decoration: const InputDecoration(
                        // icon: Icon(Icons.search),
                        prefixIcon: Icon(Icons.search),
                        // prefixIconColor: Colors.black,
                        hintText: "Tìm kiếm",

                        filled: true,
                        fillColor: Color.fromARGB(255, 223, 206, 206),
                        // labelText: "Tìm kiếm",
                        //labelStyle: TextStyle(color: Colors.black),
                        // border: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide: BorderSide.none
                            // borderSide:
                            //borderSide: BorderSide(),
                            ),
                        // contentPadding: EdgeInsets.all(10),
                        //enabledBorder: OutlineInputBorder.none,
                        // focusedBorder: OutlineInputBorder(
                        //     //borderSide: BorderSide(color: Colors.black),
                        //     ),
                      ),
                      onChanged: (value) {
                        _maxindex = 0;
                        setState(() {});
                      },
                      onEditingComplete: () {
                        print("v");
                      },
                      onSubmitted: (value) {
                        print("su");
                      },
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        textSearch.clear();
                        setState(() {});
                      },
                      icon: const Icon(Icons.clear))
                ],
                // title: const Text(
                //   "TodoList1",
                //   style: TextStyle(fontSize: 30),
                // ),
              ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                children: todoList
                    .where((e) => (e.name
                            .toLowerCase()
                            .contains(textSearch.text.toLowerCase()) ||
                        (_maxindex > 0 && todoList.indexOf(e) >= _maxindex)))
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
            _maxindex = todoList.length;
            print(_maxindex);
            //print(context);
            showModalBottomSheet(
              // backgroundColor: Colors.yellow,
              shape: const BeveledRectangleBorder(
                  // borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
              isScrollControlled: true, //quay ngang vẫn show được
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: MediaQuery.of(context)
                      .viewInsets, //Mở bàn phím lên mà k bị che mất đi text và nút
                  child: Container(
                    decoration: const BoxDecoration(
                        // color: Colors.white,
                        // borderRadius: BorderRadius.all(Radius.circular(20)),
                        // borderRadius: BorderRadius.all(
                        //     Radius.circular(20)), // bo 4 góc 20px
                        ),
                    // height: 200,

                    child: Padding(
                      padding: const EdgeInsets.all(20),
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
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
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
