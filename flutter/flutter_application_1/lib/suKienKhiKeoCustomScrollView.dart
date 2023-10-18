import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _sliverKey = GlobalKey();
  Offset sliverPosition = Offset.zero;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateSliverPosition);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateSliverPosition() {
    print(_scrollController.position.viewportDimension);
    if (_sliverKey.currentContext != null) {
      RenderBox renderBox =
          _sliverKey.currentContext!.findRenderObject() as RenderBox;
      Offset position = renderBox.localToGlobal(Offset.zero);
      setState(() {
        sliverPosition = position;
      });
      if (_scrollController.position.viewportDimension >
          (renderBox.size.height * 0 / 2 +
              renderBox.localToGlobal(Offset.zero).dy)) {
        print(renderBox.size.height);
        print(renderBox.localToGlobal(Offset.zero).dy);
        setState(() {
          color = Colors.yellow;
        });
      } else {
        setState(() {
          color = Colors.blue;
        });
      }
      //print(renderBox.size.height);
    }
  }

  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverToBoxAdapter Position Example'),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          const SliverAppBar(
            title: Text('Scroll Down'),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              key: _sliverKey,
              width: 200,
              height: 200,
              color: color,
              child: const Center(
                child: Text('SliverToBoxAdapter'),
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: <Widget>[
        ElevatedButton(
          onPressed: () {
            _updateSliverPosition();
          },
          child: const Text('Get SliverToBoxAdapter Position'),
        ),
        Text(
            'SliverToBoxAdapter Position: ${sliverPosition.dx}, ${sliverPosition.dy}'),
      ],
    );
  }
}
