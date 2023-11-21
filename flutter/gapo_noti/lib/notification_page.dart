import 'package:flutter/material.dart';
import 'controler.dart';
import 'modal.dart';
import 'view.dart';

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
      body: FutureBuilder<bool>(
        future: readJsonData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
             //datas = snapshot.data;
            // print(snapshot.data);
            return CustomScrollView(
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
                NotificationWidget(listdata: datas.listData!),
              ],
            );
            //return Text(snapshot.data!.toJson().toString());
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}


