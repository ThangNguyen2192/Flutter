import 'package:flutter/material.dart';

class HocVien {
  final String userName;
  final String message;

  HocVien(this.userName, this.message);
}

void main(List<String> args) {
  runApp( MaterialApp(home: MyWidget()));
}

class MyWidget extends StatelessWidget {
   MyWidget({super.key});

  final List<HocVien> data = [
    HocVien('Hoc vien 1', 'Last message'),
    HocVien('Hoc vien 22222', 'Last message')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        physics: const ClampingScrollPhysics(),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "item: ${data[index].userName}",
                style: const TextStyle(fontSize: 20),
              ),
            );
          },
          separatorBuilder: (_, index) {
            return const Divider(
              thickness: 5,
            );
          },
          itemCount: data.length),
    );
  }
}
