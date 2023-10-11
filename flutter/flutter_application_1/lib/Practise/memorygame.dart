import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  int a = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> networkImages = [
  "https://haycafe.vn/wp-content/uploads/2023/01/Hinh-anh-thien-nhien-dep-nhat.jpeg",
  // "https://www.google.com/imgres?imgurl=https%3A%2F%2Fkhoinguonsangtao.vn%2Fwp-content%2Fuploads%2F2023%2F01%2Fhinh-anh-dong-vat-de-thuong.jpg&tbnid=URY0_VnaupCHoM&vet=12ahUKEwiYg4r5se2BAxV91TQHHbYHCN0QMygGegQIARBY..i&imgrefurl=https%3A%2F%2Fkhoinguonsangtao.vn%2Fhinh-anh-dong-vat-de-thuong%2F&docid=VtFQnY1cmC4SPM&w=2564&h=1604&q=%E1%BA%A3nh%20con%20v%E1%BA%ADt%20%C4%91%E1%BA%B9p&ved=2ahUKEwiYg4r5se2BAxV91TQHHbYHCN0QMygGegQIARBY",
  "https://haycafe.vn/wp-content/uploads/2022/04/Hinh-anh-dong-vat-de-thuong-Tho-va-Meo-800x500.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/04/Hinh-anh-dong-vat-de-thuong-cute-800x500.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/04/Hinh-anh-dong-vat-de-thuong-gia-dinh-chim-canh-cut-800x533.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/04/Hinh-anh-dong-vat-de-thuong-cute-2-chu-Tho-800x500.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/04/Hinh-anh-dong-vat-de-thuong-2-chu-meo-con-800x500.jpg",
  // "https://haycafe.vn/wp-content/uploads/2022/04/Cac-hinh-anh-con-vat-de-thuong-800x600.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/03/Lang-hoa-Sa-Dec-800x535.jpg",
  "https://haycafe.vn/wp-content/uploads/2022/03/anh-danh-lam-thang-canh-Lang-hoa-Sa-Dec-800x450.jpg",
  //"https://haycafe.vn/wp-content/uploads/2022/03/Lang-hoa-Sa-Dec-khu-du-lich-800x450.jpg",
];

List<ImageBox> l1 = [
  ImageBox(),
  ImageBox(),
  ImageBox(),
  ImageBox(),
  ImageBox(),
  ImageBox()
];
List<ImageBox> imageBoxs = [...l1];

class _MyHomePageState extends State<MyHomePage> {
  void reset() {
    setState(() {
      imageBoxs.clear();
      imageBoxs = [...l1];
    });
  }

  bool imageShow = false;

  String assetImage = "";

  // ignore: unused_field
  final double _circular = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: imageBoxs.length,
              itemBuilder: (context, index) {
                // print("v1");
                // setState(() {
                // });
                return imageBoxs[index];
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            width: double.infinity,
            color: Colors.blue,
            child: TextButton(
              onPressed: () {
                setState(() {
                  //  imageBoxs.clear();
                  //hideAll = true;
                  // ImageBox i1 = ImageBox();

                  // imageBoxs.add(i1);
                  print("v");
                  imageBoxs.clear();
                  imageBoxs = [...l1];
                });

                //_resetAll = false;
                //print(_resetAll);
              },
              child: const Text(
                "Reset",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageBox extends StatefulWidget {
  ImageBox({super.key, this.imageShow = false, this.networkImage = ""});

  bool imageShow;
  String networkImage;

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  _ImageBoxState();

  final double _circular = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(_circular)),
      ),
      child: (!hideAll && !widget.imageShow)
          ? InkWell(
              onTap: () {
                //print(Random().nextInt(10));
                setState(() {
                  hideAll = false;
                  widget.imageShow = !widget.imageShow;
                  widget.networkImage =
                      networkImages[Random().nextInt(networkImages.length)];

                  print(widget.networkImage);
                });
              },
              child: const Icon(
                Icons.question_mark,
                size: 30,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(_circular),
              // clipBehavior: Clip.antiAlias,
              child: Image(
                  fit: BoxFit.cover, image: NetworkImage(widget.networkImage))),
    );
  }
}

bool hideAll = false;
