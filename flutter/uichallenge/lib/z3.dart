import 'package:flutter/material.dart';

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

class _MyHomePagStateState extends State<MyHomePagState> {
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

  void test() {
    print(_scrollController.position.pixels);
  }

  int crossAxisCount = 4;
  double height = 300;

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
                  height = 100;
                } else {
                  crossAxisCount = 4;
                  height = 300;
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
              // toolbarHeight: 130,
              // pinned: true,
              //snap: true,

              backgroundColor: const Color.fromARGB(255, 195, 188, 190),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                    ),
                                    child: const Icon(Icons.apple),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                    ),
                                    child: const Icon(Icons.apple),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                    ),
                                    child: const Icon(Icons.apple),
                                  ),
                                ],
                              ),
                              const Text("Hom ngay ngay 21  ")
                              // ClipRect(
                              //   child: SlideTransition(
                              //     position: _animation,
                              //     child: const Text(
                              //       "Hom nay la ngay 18 thang 10 năm 2023",
                              //       style: TextStyle(fontSize: 20),
                              //       maxLines: 1,
                              //     ),
                              //   ),
                              // ),
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
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  color: Colors.blue,
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
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
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      itemCount: 5)),
            ),

            SliverToBoxAdapter(
              child: Container(
                color: const Color.fromARGB(255, 242, 137, 172),
                width: 10,
                height: 100,
                //   child: GridView.builder(
                //     scrollDirection: Axis.horizontal,

                //     // physics: const NeverScrollableScrollPhysics(),
                //     // padding: const EdgeInsets.all(0),
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //       // mainAxisExtent: 0.01,
                //       crossAxisCount: 1,
                //       mainAxisSpacing: 10,
                //       //crossAxisSpacing: 20,
                //     ),
                //     itemCount: 5,
                //     itemBuilder: (context, index) {
                //       // if (index > 4) {
                //       //   // Ẩn đi hàng số 2
                //       //   return const SizedBox.shrink();
                //       // }
                //       return Container(
                //         width: 60,
                //         color: Colors.amber,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Container(
                //               width: 60,
                //               height: 60,
                //               decoration: const BoxDecoration(
                //                   color: Colors.grey, shape: BoxShape.circle),
                //               child: const Icon(Icons.apple),
                //             ),
                //             Text('$index'),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                color: Colors.yellow,
                height: 200,
                child: GridView.builder(
                  //  scrollDirection: Axis.horizontal,

                  physics: const NeverScrollableScrollPhysics(),
                  // padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    // mainAxisSpacing: 10,
                    //crossAxisSpacing: 20,
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
            // SliverToBoxAdapter(
            //   child: Container(
            //     color: Colors.blue,
            //     height: 700,
            //   ),
            // )
            // SliverGrid.builder(
            //   //  padding: const EdgeInsets.all(0),
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 5,
            //   ),
            //   itemCount: 80,
            //   itemBuilder: (context, index) {
            //     return Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Container(
            //           width: 60,
            //           height: 60,
            //           decoration: const BoxDecoration(
            //               color: Colors.grey, shape: BoxShape.circle),
            //           child: const Icon(Icons.apple),
            //         ),
            //         Text('$index'),
            //       ],
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
