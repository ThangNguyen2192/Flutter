import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

void main(List<String> args) {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: CustomScrollView(
          slivers: [
            SliverStickyHeader(
              header: Container(
                height: 50.0,
                color: Colors.blue,
                child: const Center(
                  child: Text("Header"),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text("Item $index"),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ),
            SliverStickyHeader(
              header: Container(
                height: 60.0,
                color: Colors.pink,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Header #0',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => ListTile(
                    leading: const CircleAvatar(
                      child: Text('0'),
                    ),
                    title: Text('List tile #$i'),
                  ),
                  childCount: 20,
                ),
              ),
            ),
            SliverStickyHeader.builder(
              builder: (context, state) => Container(
                height: 60.0,
                color: (state.isPinned ? Colors.pink : Colors.lightBlue)
                    .withOpacity(1.0 - state.scrollPercentage),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Header #1',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => ListTile(
                    leading: const CircleAvatar(
                      child: Text('0'),
                    ),
                    title: Text('List tile #$i'),
                  ),
                  childCount: 20,
                ),
              ),
            ),
            SliverStickyHeader.builder(
              builder: (context, state) => Container(
                height: 60.0,
                color: (state.isPinned ? Colors.pink : Colors.lightBlue)
                    .withOpacity(1.0 - state.scrollPercentage),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Header #2',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => ListTile(
                    leading: const CircleAvatar(
                      child: Text('0'),
                    ),
                    title: Text('List tile #$i'),
                  ),
                  childCount: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
