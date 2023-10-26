import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Bắt đầu từ bên ngoài container bên trái
      end: const Offset(-1.0, 0.0), // Kết thúc bên ngoài container bên phải
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    //_animation.dis
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "22:55",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "CN, 21 thg 9",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.apple),
                            ),
                            Container(
                              child: const Icon(Icons.apple),
                            ),
                            Container(
                              child: const Icon(Icons.apple),
                            ),
                          ],
                        ),
                        ClipRect(
                          child: SlideTransition(
                            position: _animation,
                            child: const Text(
                              "Hom nay la ngay 18 thang 10 năm 2023",
                              style: TextStyle(fontSize: 20),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 170,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      // crossAxisSpacing: 10,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        //color: Colors.yellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                              child: const Icon(Icons.apple),
                            ),
                            LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                print(constraints.maxWidth);
                                print(constraints.maxHeight);
                                const text =
                                    'This is a long text that may overflow the container';

                                final textPainter = TextPainter(
                                  text: const TextSpan(
                                    text: text,
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  textDirection: TextDirection.ltr,
                                );

                                // double maxHeight =
                                //     textPainter.maxIntrinsicWidth;
                                textPainter.layout(
                                    maxWidth: constraints.maxWidth);

                                if (textPainter.didExceedMaxLines) {
                                  // Văn bản vượt quá kích thước giới hạn
                                  return const Text('T1');
                                } else {
                                  // Văn bản không vượt quá kích thước giới hạn
                                  return const Text("T2");
                                }
                              },
                            ),
                            //Text("icon $index")
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
