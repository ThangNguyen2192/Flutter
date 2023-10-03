import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const AvataApp());
}

class AvataApp extends StatelessWidget {
  const AvataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Avatar(
              name: "Thang",
              avatarUrl:
                  "https://demoda.vn/wp-content/uploads/2022/08/hinh-anh-avatar-nu-de-thuong.jpg",
              isUpload: true,
            ),
            Avatar(
              name: "Thang",
              avatarUrl:
                  "https://demoda.vn/wp-content/uploads/2022/08/hinh-anh-avatar-nu-de-thuong.jpg",
              // isUpload: true,
            ),
            Avatar(
              name: "Thang",
            ),
          ],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar(
      {super.key,
      required this.name,
      this.avatarUrl = "",
      this.isUpload = false});
  final String name;
  final String avatarUrl;
  final isUpload;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Stack(
            children: [
              ClipOval(
                child: Image(
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  image: NetworkImage(avatarUrl),
                  errorBuilder: (context, exception, stackTrace) {
                    return Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                        child: const Text(
                          "T",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ));
                  },
                ),
              ),
              if (isUpload)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.upload,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "0981574222",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
