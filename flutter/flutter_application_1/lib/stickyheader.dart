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
        body: const CustomScrollView(
          slivers: [
            CustomSliverStickyHeader(
              title: "Header0",
            ),
            CustomSliverStickyHeader(
              title: "Header1",
            ),
            CustomSliverStickyHeaderBuilder(
              title: "Header builder 1",
            ),
            CustomSliverStickyHeaderBuilder(
              title: "Header builder 2",
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliverStickyHeaderBuilder extends StatefulWidget {
  const CustomSliverStickyHeaderBuilder({super.key, required this.title});
  final String title;
  @override
  State<CustomSliverStickyHeaderBuilder> createState() =>
      _CustomSliverStickyHeaderBuilderState();
}

class _CustomSliverStickyHeaderBuilderState
    extends State<CustomSliverStickyHeaderBuilder> {
  int _childCount = 20;
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader.builder(
      builder: (context, state) => Container(
        //height: 60.0,
        color: (state.isPinned ? Colors.pink : Colors.lightBlue)
            .withOpacity(1.0 - state.scrollPercentage),
        // padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Container(
          height: 60.0,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title),
              InkWell(
                  onTap: () {
                    setState(() {
                      print("a");
                      if (_childCount == 20) {
                        _childCount = 0;
                      } else {
                        _childCount = 20;
                      }
                    });
                  },
                  child: const Icon(Icons.arrow_downward)),
            ],
          ),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) {
            print('${widget.title} $i');
            return ListTile(
              leading: const CircleAvatar(
                child: Text('0'),
              ),
              title: Text('List tile #$i'),
            );
          },
          childCount: _childCount,
        ),
      ),
    );
  }
}

class CustomSliverStickyHeader extends StatefulWidget {
  const CustomSliverStickyHeader({super.key, required this.title});
  final String title;
  @override
  State<CustomSliverStickyHeader> createState() =>
      _CustomSliverStickyHeaderState();
}

class _CustomSliverStickyHeaderState extends State<CustomSliverStickyHeader> {
  int _childCount = 20;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: 50.0,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title),
            InkWell(
                onTap: () {
                  setState(() {
                    if (_childCount == 20) {
                      _childCount = 0;
                    } else {
                      _childCount = 20;
                    }
                  });
                },
                child: const Icon(Icons.arrow_downward)),
          ],
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ListTile(
              title: Text("Item $index"),
            );
          },
          childCount: _childCount,
        ),
      ),
    );
  }
}
