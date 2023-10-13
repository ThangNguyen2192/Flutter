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
            CustomSliverStickyHeader(
              title: "Header0",
              backgroundColor: Colors.blue,
            ),
            CustomSliverStickyHeader(
              title: "Header1",
              backgroundColor: Colors.yellow,
            ),
            CustomSliverStickyHeaderBuilder(
              title: "Header builder 1",
              backgroundColor: Colors.pink,
            ),
            CustomSliverStickyHeaderBuilder(
              title: "Header builder 2",
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliverStickyHeaderBuilder extends StatefulWidget {
  CustomSliverStickyHeaderBuilder(
      {super.key, required this.title, this.backgroundColor = Colors.blue});
  final String title;
  Color backgroundColor;
  @override
  State<CustomSliverStickyHeaderBuilder> createState() =>
      _CustomSliverStickyHeaderBuilderState();
}

class _CustomSliverStickyHeaderBuilderState
    extends State<CustomSliverStickyHeaderBuilder> {
  int _childCount = 20;
  Icon icon = const Icon(Icons.arrow_upward);
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader.builder(
      builder: (context, state) => Container(
        //height: 60.0,
        // color: (state.isPinned ? Colors.pink : Colors.lightBlue)
        //     .withOpacity(1.0 - state.scrollPercentage),
        // padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Container(
          height: 60.0,
          color: widget.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title),
              InkWell(
                  onTap: () {
                    setState(() {
                      if (_childCount == 20) {
                        _childCount = 0;
                        icon = const Icon(Icons.arrow_downward);
                      } else {
                        _childCount = 20;
                        icon = const Icon(Icons.arrow_upward);
                      }
                    });
                  },
                  child: icon),
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
  CustomSliverStickyHeader(
      {super.key, required this.title, this.backgroundColor = Colors.blue});
  final String title;
  Color backgroundColor;
  @override
  State<CustomSliverStickyHeader> createState() =>
      _CustomSliverStickyHeaderState();
}

class _CustomSliverStickyHeaderState extends State<CustomSliverStickyHeader> {
  int _childCount = 20;
  Icon icon = const Icon(Icons.arrow_upward);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: 50.0,
        color: widget.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title),
            InkWell(
                onTap: () {
                  setState(() {
                    if (_childCount == 20) {
                      _childCount = 0;
                      icon = const Icon(Icons.arrow_downward);
                    } else {
                      _childCount = 20;
                      icon = const Icon(Icons.arrow_upward);
                    }
                  });
                },
                child: icon),
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
