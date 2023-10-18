// ignore: file_names
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

import 'main.dart';


//--Tạo ra RecommenProvider để cập nhật đưọc lại giá trị của recommendedworkshops.dart
class RecommenProvider with ChangeNotifier {
//  bool myVariable_Other = false;
  GlobalKey recommendKey = GlobalKey();//--Gán key phục vụ xử lý để biết được khi cuộn đến phần recommendedworkshops
  Color color = Colors.yellow;
double _opacityLevel = 0;//--Độ mờ khi khởi tạo là 0, khi cuộn đến thì chuyển về 1
  void updateOpacityLevel() {
    // Thực hiện logic cập nhật biến ở đây.
    // myVariable_Other = gt; // Ví dụ: thay đổi giá trị biến
    // if (color == Colors.yellow) {
    //   color = Colors.blue;
    // }
    if (_opacityLevel < 1) {
      _opacityLevel = 1;
    }
    notifyListeners(); // Thông báo cho các người tiêu dùng về thay đổi.
  }

  
}

class RecommendedWorkshops extends StatefulWidget {
  const RecommendedWorkshops({super.key});

  @override
  State<RecommendedWorkshops> createState() => _RecommendedWorkshops();
}

List<ItemRecommendedWorkshop> listItemRecommendedWorkshop = [
  const ItemRecommendedWorkshop(),
  const ItemRecommendedWorkshop(),
  const ItemRecommendedWorkshop(),
  const ItemRecommendedWorkshop(),
];

class _RecommendedWorkshops extends State<RecommendedWorkshops>
    with WidgetsBindingObserver {
  ValueNotifier<List<ItemRecommendedWorkshop>> itemRecommendedWorkshops =
      ValueNotifier<List<ItemRecommendedWorkshop>>(listItemRecommendedWorkshop);

  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  bool _isRefresh =
      false; //--Biến lưu để biết đang Refresh đẻ tránh gọi điến sự kiện loadmoredata

  Future<void> _onRefresh() async {
    //  setState(() {
    _isLoading.value = false;
    _isRefresh = true;

    listItemRecommendedWorkshop = [
      const ItemRecommendedWorkshop(),
      const ItemRecommendedWorkshop(),
      const ItemRecommendedWorkshop(),
      const ItemRecommendedWorkshop(),
    ];
    itemRecommendedWorkshops.value = listItemRecommendedWorkshop;
    //  });
  }

  Future<void> _loadMoreData() async {
    // Simulate loading more data by adding a delay

    if (_isRefresh) {
      _isRefresh = false;
      _isLoading.value = false;
    } else if (!_isLoading.value) {
      _isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      //setState(() {
      listItemRecommendedWorkshop.addAll(List.generate(10, (index) {
        return const ItemRecommendedWorkshop();
      }));

      itemRecommendedWorkshops.value = listItemRecommendedWorkshop;
      // });
      _isLoading.value = false;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
   
  }

  @override
  Widget build(BuildContext context) {
   final recommenProvider = Provider.of<RecommenProvider>(context);

    return SliverToBoxAdapter(
      child: Container(
        key: recommenProvider.recommendKey,
        height: 691,
        //  color: recommenProvider.color,
        padding: const EdgeInsets.only(top: 40, right: 16),
        //padding: const EdgeInsets.only(top: 24, right: 0),
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
                    "Recommended Workshops",
                    style: TextStyle(fontSize: 20, color: Color(0xFF1D1F24)),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF154883),
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                //padding: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: ValueListenableBuilder(
                  valueListenable: itemRecommendedWorkshops,
                  builder: (BuildContext context, value, Widget? child) {
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
                            ListenableBuilder(
                              listenable: _isLoading,
                              builder: (BuildContext context, Widget? child) {
                                return SliverGrid.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        (responsiveUiConfig.screenWidth ~/ 180),
                                    mainAxisExtent: 307,
                                    // mainAxisSpacing: 1,
                                    // crossAxisSpacing: 30,
                                    //  crossAxisSpacing: 50,
                                  ),
                                  itemCount: (_isLoading.value)
                                      ? itemRecommendedWorkshops.value.length +
                                          1
                                      : itemRecommendedWorkshops.value.length,
                                  itemBuilder: (_, index) {
                                    if (index <
                                        itemRecommendedWorkshops.value.length) {
                                      return itemRecommendedWorkshops
                                          .value[index];
                                    } else if (_isLoading.value) {
                                      return Container(
                                        alignment: Alignment.topCenter,
                                        child:
                                            const CircularProgressIndicator(),
                                      );
                                    }
                                    return null;
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemRecommendedWorkshop extends StatelessWidget {
  const ItemRecommendedWorkshop({super.key});

  @override
  Widget build(BuildContext context) {
   final recommenProvider = Provider.of<RecommenProvider>(context);
    // final myStateOther = Provider.of<MyProvider>(context);
    return AnimatedOpacity(
      opacity: recommenProvider._opacityLevel,
      curve: Curves.easeInOutSine,
      duration: const Duration(seconds: 4),
      child: Container(
        //  key: recommenProvider.containerkey,
          padding: const EdgeInsets.all(10),
          // height: 307,
          // color: Colors.pink,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.topRight, children: [
                  Image.asset(
                    "assets/images/5.png",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10, right: 10),
                    //padding: const EdgeInsets.all(10),
                    width: 48,
                    height: 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color(0xFFFFFFFF)),
                    // child: const Icon(
                    //   Icons.star_rounded,
                    //   size: 12,
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/star.png",
                          width: 12,
                          height: 12,
                        ),
                        const Text(
                          "4.9",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ]),
                const Text(
                  "Miss Zachary Will",
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Text(
                  "Beautician",
                  style: TextStyle(fontSize: 12, color: Color(0xFF827BEB)),
                ),
                const Text(
                  "Occaecati aut nam beatae quo non deserunt consequatur.",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 24, top: 6, right: 24, bottom: 6),
                  // width: 132,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF827BEB),
                  ),
                  // color: const Color(0xFF827BEB),
                  child: const Center(
                    child: Text(
                      "Book Workshop",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ])),
    );
  }
}
