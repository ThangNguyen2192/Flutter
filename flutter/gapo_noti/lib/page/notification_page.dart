import 'package:flutter/material.dart';
import '../controler.dart';
import '../view.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  get builder => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            // backgroundColor: Colors.transparent,
            // surfaceTintColor: Colors.transparent,
            floating: true,
            // pinned: true,
            centerTitle: false,
            //titleSpacing: -10,
            title: const Text(
              "Thông báo",
              style: TextStyle(fontSize: 28, color: Colors.black),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/searchPage");
                },
                child: const Icon(
                  Icons.search,
                  size: 50,
                ),
              ),
            ],
          ),
          Notifications(listdata: datas.listData!),
        ],
      ),
    );
  }
}
