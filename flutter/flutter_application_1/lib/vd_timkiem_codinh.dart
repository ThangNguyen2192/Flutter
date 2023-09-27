import 'package:flutter/material.dart';

void main() {
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Tìm kiếm cố định'),
            floating: false, // Để SliverAppBar không thay đổi khi cuộn
            pinned: false, // Để SliverAppBar cố định ở trên cùng
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Điều hướng đến trang tìm kiếm hoặc thực hiện tìm kiếm tại đây
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Mục số $index'),
                );
              },
              childCount: 20, // Số lượng mục trong danh sách mẫu
            ),
          ),
        ],
      ),
    );
  }
}
