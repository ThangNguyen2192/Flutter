import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey itemKey = GlobalKey();
  final ScrollController scrollController = ScrollController();

  bool isItemVisible = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (itemKey.currentContext != null) {
        final RenderBox renderBox =
            itemKey.currentContext?.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);
        final screenHeight = MediaQuery.of(context).size.height;

        // Kiểm tra xem widget đã nằm trong viewport hay chưa
        if (position.dy >= 0 && position.dy < screenHeight) {
          setState(() {
            isItemVisible = true;
          });
        } else {
          setState(() {
            isItemVisible = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            const SliverAppBar(
              title: Text('Check Visibility Example'),
              floating: true,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    key: index == 15 ? itemKey : null,
                    color: isItemVisible ? Colors.green : Colors.red,
                    height: 100,
                    child: Center(
                      child: Text('Item $index'),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
