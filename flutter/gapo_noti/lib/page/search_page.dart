import 'package:flutter/material.dart';
import '../controler.dart';
import '../modal.dart';
import '../view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ValueNotifier<List<Data>> searchData = ValueNotifier<List<Data>>([]);
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void onChanged(String str) {
    List<Data> list1 = [
      ...datas.listData!.where(
        (element) {
          String text = element.message!.text.toString();
          String textKhongDau = element.message!.textKhongDau.toString();
          for (var s in str.split(" ")) {
            if (!text.toLowerCase().contains(s.toLowerCase()) &&
                !textKhongDau.toLowerCase().contains(s.toLowerCase())) {
              return false;
            }
          }

          return true;
        },
      )
    ];
    searchData.value = list1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: searchData,
        builder: (BuildContext context, Widget? child) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/notificationPage");
                  },
                  child: const Icon(
                    Icons.clear,
                    size: 36,
                  ),
                ),
                title: SizedBox(
                  // alignment: Alignment.center,
                  height: 50,
                  child: Center(
                    child: TextField(
                      controller: _textController,
                      onChanged:(value) => onChanged(value),
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 223, 206, 206),
                          prefixIcon: const Icon(Icons.search),
                          //  fillColor: Colors.grey,
                          suffixIcon: InkWell(
                            onTap: () {
                              searchData.value = [];
                              _textController.text = "";
                            },
                            child: const Icon(Icons.clear),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          )),
                    ),
                  ),
                ),
              ),
              Notifications(listdata: searchData.value)
            ],
          );
        },
      ),
    );
  }
}
