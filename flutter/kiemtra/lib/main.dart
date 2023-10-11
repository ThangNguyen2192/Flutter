import 'package:flutter/material.dart';

import 'RecommendedWorkshops.dart';
import 'Responsive.dart';
import 'TopServices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
);
ThemeData darkTheme = ThemeData.dark();

ResponsiveUiConfig responsiveUiConfig = ResponsiveUiConfig();

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false; // Ban đầu sử dụng theme sáng
  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme; // Đảo ngược theme
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = isDarkTheme ? darkTheme : lightTheme;
    responsiveUiConfig.initialize(context);
    return MaterialApp(
      theme: theme, // Sử dụng theme tương ứng
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.transparent,
          leading: Container(
            color: Colors.transparent,
            width: 44,
            height: 44,
            child: Image.asset("assets/images/menu.png"),
          ),
          title: Container(
            alignment: Alignment.centerLeft,
            child: Image.asset("assets/images/logo.png"),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Action(
                  pathImage: "assets/images/notification.png",
                ),
                const Action(
                  pathImage: "assets/images/shopping.png",
                ),
                Container(
                  margin: const EdgeInsets.only(right: 14),
                  decoration: BoxDecoration(
                      // ignore: use_full_hex_values_for_flutter_colors
                      color: const Color(0xff1e36721f),
                      borderRadius: BorderRadius.circular(10)),
                  //  width: 44,
                  //height: 44,
                  child: IconButton(
                    icon: Icon(
                      isDarkTheme ? Icons.light_mode : Icons.dark_mode,
                      color: Colors.black,
                    ),
                    onPressed: toggleTheme,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Body(),
      ),
    );
  }
}

// ignore: must_be_immutable
class Body extends StatefulWidget {
  Body({
    super.key,
  });
  int a = 0;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _tabindex = 0; // Biến để theo dõi tab hiện tại

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);

    // Thêm lắng nghe sự kiện chuyển tab
    _tabController.addListener(_handleTabChange);
  }

  // Xử lý sự kiện chuyển tab
  void _handleTabChange() {
    //setState(() {
    _tabindex = _tabController.index;
    tabindex.value = _tabindex;
    // print(_tabindex);
    //});
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(controller: _tabController, children: const [
              HomeTabBarView(),
              Text("Explore"),
              Text("Chat"),
              Text("Blog"),
              Text("Account"),
            ]),
          ),
          ValueListenableBuilder(
            valueListenable: tabindex,
            builder: (BuildContext context, value, Widget? child) {
              return Container(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                color: const Color(0xFF1D1F24),
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    iconTab(
                      index: 0,
                      title: "Home",
                      pathImage: "assets/images/home.png",
                    ),
                    iconTab(
                        index: 1,
                        title: "Explore",
                        pathImage: "assets/images/explore.png"),
                    iconTab(
                      index: 2,
                      title: "Chat",
                      pathImage: "assets/images/chat.png",
                    ),
                    iconTab(
                      index: 3,
                      title: "Blog",
                      pathImage: "assets/images/blog.png",
                    ),
                    iconTab(
                        index: 4,
                        title: "Account",
                        pathImage: "assets/images/account.png"),
                  ],
                  isScrollable: false,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HomeTabBarView extends StatelessWidget {
  const HomeTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Search(),
        const TodaysDeal(),
        const TopServices(),
        const RecommendedWorkshops(),
      ],
    );
  }
}

class TodaysDeal extends StatelessWidget {
  const TodaysDeal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          margin: const EdgeInsets.only(top: 16),
          //padding: const EdgeInsets.only(left: 21, right: 21),
          height: 203,
          decoration: const BoxDecoration(
            //#CBDAEE, #9CB9DD00
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Color(0xFFCBDAEE),
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                right: 11,
                child: Image.asset("assets/images/ellipse.png"),
              ),
              Positioned(
                right: 32,
                child: Image.asset(
                  'assets/images/girl1.png',
                  width: 136,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36, right: 137),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Todays Deal",
                      style: TextStyle(
                        fontFamily: "Hind",
                        fontSize: 18,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-0.6, -0.6),
                              color: Color(0xFF0E293F)),
                          Shadow(
                              // bottomRight
                              offset: Offset(0.6, -0.6),
                              color: Color(0xFF0E293F)),
                          Shadow(
                              // topRight
                              offset: Offset(0.6, 0.6),
                              color: Color(0xFF0E293F)),
                          Shadow(
                              // topLeft
                              offset: Offset(-0.6, 0.6),
                              color: Color(0xFF0E293F)),
                        ],
                        //  decoration: TextDecoration.combine(decorations),
                      ),
                    ),
                    const Text(
                      "50% OFF",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Et provident eos est dolore. Eum libero eligendi molestias aut et quibusdam aspernatur.",
                      style: TextStyle(fontSize: 11, color: Colors.black),
                    ),
                    Image.asset("assets/images/Rectangle.png"),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class Search extends StatelessWidget {
  Search({
    super.key,
  });
  int a = 0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        floating: true,
        // expandedHeight:70,
        // floating: false,
        // pinned: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                // width: 295.w,
                //  padding: const EdgeInsets.only(right: 50),
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(178, 186, 205, 1))),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search here",
                      hintStyle: const TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      prefixIcon: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ))),
                ),
              ),
            ),
            Container(
              width: 51,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(width: 1, color: const Color(0xFFB2BACD))),
              child: Image.asset(
                "assets/images/sort.png",
              ),
            )
          ],
        )
        // title: SizedBox(
        //   height: 45,
        //   child: Padding(
        //     padding: const EdgeInsets.all(16),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Expanded(
        //           child: Container(
        //             // width: 295.w,
        //             //  padding: const EdgeInsets.only(right: 50),
        //             margin: const EdgeInsets.only(right: 20),
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(14),
        //                 border: Border.all(
        //                     width: 1,
        //                     color: const Color.fromRGBO(178, 186, 205, 1))),
        //             child: TextField(
        //               decoration: InputDecoration(
        //                   hintText: "Search here",
        //                   border: InputBorder.none,
        //                   prefixIcon: InkWell(
        //                       onTap: () {}, child: const Icon(Icons.search))),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 51,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(14),
        //               border: Border.all(
        //                   width: 1, color: const Color(0xFFB2BACD))),
        //           child: Image.asset(
        //             "assets/images/sort.png",
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}

class Action extends StatelessWidget {
  const Action({
    super.key,
    required this.pathImage,
  });
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
          // ignore: use_full_hex_values_for_flutter_colors
          color: const Color(0xff1e367205),
          borderRadius: BorderRadius.circular(10)),
      width: 44,
      height: 44,
      child: Image.asset(
        pathImage,
        // width: 24,
        // height: 24,
      ),
    );
  }
}

// int tabindex = 0;

ValueNotifier<int> tabindex = ValueNotifier<int>(0);

// ignore: must_be_immutable, camel_case_types
class iconTab extends StatefulWidget {
  iconTab(
      {super.key,
      required this.title,
      required this.pathImage,
      this.index = 0});
  final String title;
  final String pathImage;
  int index;

  @override
  State<iconTab> createState() => _iconTabState();
}

// ignore: camel_case_types
class _iconTabState extends State<iconTab> {
  @override
  Widget build(BuildContext context) {
    return Tab(
        icon: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          widget.pathImage,
          color: (widget.index == tabindex.value)
              ? const Color(0xFF827BEB)
              : const Color(0xFF676D75),
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 12,
            color: (widget.index == tabindex.value)
                ? const Color(0xFF827BEB)
                : const Color(0xFF676D75),
          ),
        )
      ],
    )));
  }
}
