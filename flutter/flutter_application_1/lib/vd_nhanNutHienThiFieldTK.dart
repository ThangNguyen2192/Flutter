import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchAppBarDemo(),
    );
  }
}

class SearchAppBarDemo extends StatefulWidget {
  const SearchAppBarDemo({super.key});

  @override
  _SearchAppBarDemoState createState() => _SearchAppBarDemoState();
}

class _SearchAppBarDemoState extends State<SearchAppBarDemo> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !_isSearching
          ? AppBar(
              title: const Text("Search App Bar Demo"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                ),
              ],
            )
          : AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                    _searchController.clear();
                  });
                },
              ),
              title: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  // Thực hiện tìm kiếm tại đây dựa trên giá trị của trường nhập văn bản
                  // Ví dụ: Tìm kiếm trong danh sách dữ liệu và cập nhật giao diện người dùng
                },
              ),
            ),
      // appBar: _isSearching ? _buildSearchAppBar() : _buildAppBar(),
      body: const Center(
        child: Text("Main Content"),
      ),
    );
  }
}
