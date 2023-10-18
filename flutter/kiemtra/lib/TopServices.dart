import 'dart:ffi';

import 'package:flutter/material.dart';

import 'main.dart';

class TopServices extends StatefulWidget {
  const TopServices({
    super.key,
  });

  @override
  State<TopServices> createState() => _TopServicesState();
}

List<ItemTopService> listItemTopService = [
  const ItemTopService(
    pathImage: "assets/images/service1.png",
  ),
  const ItemTopService(
    pathImage: "assets/images/service2.png",
  ),
  const ItemTopService(
    pathImage: "assets/images/service3.png",
  ),
];
final ValueNotifier<bool> _loaded = ValueNotifier<bool>(false);

class _TopServicesState extends State<TopServices> with WidgetsBindingObserver {
  ValueNotifier<List<ItemTopService>> itemTopServices =
      ValueNotifier<List<ItemTopService>>(listItemTopService);

  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  bool _isRefresh =
      false; //--Biến lưu để biết đang Refresh đẻ tránh gọi điến sự kiện loadmoredata

  Future<void> _onRefresh() async {
    // loaded = false;
    //setState(() {
    _isLoading.value = false;
    _isRefresh = true;
    // print("fre");
    listItemTopService = [
      const ItemTopService(
        pathImage: "assets/images/service1.png",
      ),
      const ItemTopService(
        pathImage: "assets/images/service2.png",
      ),
      const ItemTopService(
        pathImage: "assets/images/service3.png",
      ),
    ];
    itemTopServices.value = listItemTopService;
    //});
  }

  //bool _isLoading = false;

  Future<void> _loadMoreData() async {
    // Simulate loading more data by adding a delay

    if (_isRefresh) {
      _isRefresh = false;
      _isLoading.value = false;
    } else if (!_isLoading.value) {
      // setState(() {
      _isLoading.value = true;
      //_loaded.value = true;
      // });
      await Future.delayed(const Duration(seconds: 2));
      //setState(() {
      listItemTopService.addAll(List.generate(5, (index) {
        if (index % 3 == 0) {
          return const ItemTopService(pathImage: "assets/images/service3.png");
        }
        if (index % 2 == 0) {
          return const ItemTopService(pathImage: "assets/images/service2.png");
        } else {
          return const ItemTopService(pathImage: "assets/images/service1.png");
        }
      }));
      itemTopServices.value = listItemTopService;
      _isLoading.value = false;
      // });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Simulate some loading process
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _loaded.value = true;
        // print("v");
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !_loaded.value) {
      // The app has just resumed, and the widget is not loaded yet
      print('Widget is loaded for the first time.');
      // You can perform actions here
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 632,
        //color: Colors.red,
        padding: const EdgeInsets.only(top: 24, right: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 16),
                  height: 38,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFFCBDAEE),
                      Colors.white,
                    ]),
                  ),
                  child: const Text(
                    "Top Services",
                    style: TextStyle(fontSize: 20, color: Color(0xFF1D1F24)),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _loaded.value = !_loaded.value;
                      });
                      print("v");

                      //  print(responsiveUiConfig.screenWidth / 358);
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF154883),
                          decoration: TextDecoration.underline),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: AnimatedBuilder(
                  animation: Listenable.merge([itemTopServices, _isLoading]),
                  builder: (context, child) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        _onRefresh();
                      },
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollEndNotification) {
                            _loadMoreData();
                            // return true;
                          }

                          return false;
                        },
                        child: CustomScrollView(
                          shrinkWrap: true,
                          // controller: _controller,
                          slivers: [
                            SliverGrid.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    (responsiveUiConfig.screenWidth ~/ 358),
                                mainAxisExtent: 165,
                                mainAxisSpacing: 26,
                                //  crossAxisSpacing: 50,
                              ),
                              itemCount: (_isLoading.value)
                                  ? itemTopServices.value.length + 1
                                  : itemTopServices.value.length,
                              itemBuilder: (_, index) {
                                //return  itemTopServices.value[index];
                                // return ItemTopService(
                                //   pathImage:
                                //       itemTopServices.value[index].pathImage,
                                // );
                                if (index < itemTopServices.value.length) {
                                  return itemTopServices.value[index];
                                } else if (_isLoading.value) {
                                  return Container(
                                    alignment: Alignment.topCenter,
                                    child: const CircularProgressIndicator(),
                                  );
                                }
                                return null;
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTopService extends StatefulWidget {
  const ItemTopService({super.key, required this.pathImage});
  final String pathImage;

  @override
  State<ItemTopService> createState() => _ItemTopServiceState();
}

class _ItemTopServiceState extends State<ItemTopService> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _loaded,
      builder: (context, child) {
        return Stack(
          children: [
            AnimatedAlign(
              alignment:
                  _loaded.value ? Alignment.centerLeft : Alignment.center,
              duration: const Duration(seconds: 1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.pathImage,
                  width: 210,
                  height: 165,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedAlign(
              alignment:
                  _loaded.value ? Alignment.centerRight : Alignment.center,
              duration: const Duration(seconds: 1),
              child: Container(
                width: 216,
                height: 123,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, right: 8),
                      alignment: Alignment.topCenter,
                      child: ClipOval(
                        child: InkWell(
                          // onTap: () {
                          //   setState(() {
                          //     loaded = !loaded;
                          //   });
                          // },
                          child: Image.asset(
                            'assets/images/girl.png',
                            width: 38,
                            height: 38,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.pink,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Miss Zachary Will",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF1D1F24)),
                          ),
                          const Text(
                            "Beautician",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF827BEB)),
                          ),
                          const Text(
                            "Doloribus saepe aut necessit qui non qui.",
                            style: TextStyle(
                                fontSize: 10, color: Color(0xFF6B6B6B)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 44,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: const Color.fromARGB(
                                        130, 236, 225, 238)),
                                // child: const Icon(
                                //   Icons.star_rounded,
                                //   size: 12,
                                // ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/star.png",
                                      width: 12,
                                      height: 12,
                                    ),
                                    const Text(
                                      "4.9",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24, top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF827BEB),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text(
                                    "Book now",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xFFFFFFFF)),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
