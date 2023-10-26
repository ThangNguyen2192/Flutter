import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.transparent,
      ),
      home: const MyHomePagState(),
    );
  }
}

class MyHomePagState extends StatefulWidget {
  const MyHomePagState({super.key});

  @override
  State<MyHomePagState> createState() => _MyHomePagStateState();
}

class _MyHomePagStateState extends State<MyHomePagState>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener((test));
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {
      test();
    });
    _scrollController.dispose();

    super.dispose();
  }

//double height=200;
  void test() {
    print(_scrollController.position.pixels);
    setState(() {
      if (_scrollController.position.pixels >= 0 &&
          _scrollController.position.pixels <= 200) {
        // print(20 * _scrollController.position.pixels / 200);
        mainAxisSpacing = 20 - 20 * _scrollController.position.pixels / 200;
        fontSize = 40 - 20 * _scrollController.position.pixels / 200;
        left = 70 * _scrollController.position.pixels / 200;
        height1 = 100 - 70 * _scrollController.position.pixels / 200;
        top = 70 - 70 * _scrollController.position.pixels / 200;
        height = 200 - 50 * _scrollController.position.pixels / 200;
        opacity = 1 - 1 * _scrollController.position.pixels / 200;
        bottomRightApple = 75 - 75 * _scrollController.position.pixels / 200;
        bottomRightAndroid = 150 - 75 * _scrollController.position.pixels / 200;
        // print(opacity);
      }

      if (_scrollController.position.pixels > 200) {
        mainAxisSpacing = 0;
        fontSize = 20;
        left = 70;
        height1 = 30;
        top = 0;
        height = 150;
        opacity = 0;
        bottomRightApple = 0;
        bottomRightAndroid = 75;
      }
      //   if(_scrollController.position.pixels>20)
      //   height=0;
      // if(_scrollController.position.pixels<-20)
      // height=200;
      //   //mainAxisSpacing=0
      // if (height >= 0 && height <= 200) {
      //   if (_scrollController.position.pixels > 0) {
      //     height = 200 - _scrollController.position.pixels;
      //   }
      // }
    });
  }

  double height = 200;
  int crossAxisCount = 4;
  double mainAxisSpacing = 20;
  double height3 = 200;
  double fontSize = 40;
  double left = 0;
  double height1 = 100;
  double top = 70;
  double opacity = 1;
  double bottomRightApple = 75;
  double bottomRightAndroid = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                if (crossAxisCount == 4) {
                  crossAxisCount = 5;
                  height3 = 100;
                } else {
                  crossAxisCount = 4;
                  height3 = 300;
                }
              });
            },
            child: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              //
              pinned: true,
              //snap: true,
              backgroundColor: const Color.fromARGB(255, 195, 188, 190),
              expandedHeight: height,
              toolbarHeight: height,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: height1,
                      child: Stack(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "22:55",
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold),
                          ),
                          Positioned(
                            // bottom: 0,
                            left: left,
                            top: top,
                            child: const Text(
                              "CN, 21 thg 9",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            // left: 100,
                            right: 0,
                            //left: left,

                            top: 70,
                            child: SizedBox(
                              // alignment: Alignment.topCenter,
                              //color: Colors.pink,
                              width: 170,
                              height: 30,
                              // child: const Text("dsfdsfdsf"),
                              child: Marquee(
                                text:
                                    "Hôm nay ngày 21 tháng 9 năm 2023, thời tiết đẹp",
                                crossAxisAlignment: CrossAxisAlignment.center,
                                blankSpace:
                                    20.0, // Khoảng cách giữa các lần lặp
                                velocity: 75, // Vận tốc di chuyển (pixels/giây)
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: AnimatedOpacity(
                              opacity: opacity,
                              duration: Duration.zero,
                              child: const Icon(Icons.settings),
                            ),
                          ),
                          Positioned(
                            right: bottomRightAndroid,
                            child: AnimatedOpacity(
                              opacity: opacity,
                              duration: Duration.zero,
                              child: const Icon(
                                Icons.android,
                                //color: Colors.blue,
                              ),
                            ),
                          ),
                          Positioned(
                            right: bottomRightApple,
                            child: const Icon(Icons.apple),
                          ),
                        ],
                      ),
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
                  ],
                ),
              ),
            ),
            SliverAppBar(
              //  expandedHeight: 100,
              toolbarHeight: 100,
              // floating: true,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width:
                        constraints.maxWidth, // Lấy chiều rộng của SliverAppBar
                    color: const Color.fromARGB(255, 195, 188, 190),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,

                      // physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: mainAxisSpacing,
                        childAspectRatio: 1.28,
                        //crossAxisSpacing: 20,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        // if (index > 4) {
                        //   // Ẩn đi hàng số 2
                        //   return const SizedBox.shrink();
                        // }
                        return Container(
                          // color: index % 2 == 0 ? Colors.green //: Colors.yellow[50],
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
                              Text('$index'),
                            ],
                          ),
                        );
                      },
                    ),
                    // child: const Center(
                    //   child: Text('Container Content'),
                    // ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: const Color.fromARGB(255, 195, 188, 190),
                height: height3,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,

                  physics: const NeverScrollableScrollPhysics(),
                  // padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.28,
                    mainAxisSpacing: 20,
                    //crossAxisSpacing: 20,
                    // childAspectRatio: 1.28,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    // if (index > 4) {
                    //   // Ẩn đi hàng số 2
                    //   return const SizedBox.shrink();
                    // }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: const Icon(Icons.apple),
                        ),
                        Text('$index'),
                      ],
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                // color: Colors.blue,
                height: 300,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
