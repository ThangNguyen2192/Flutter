import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> assetImages = [
  "assets/images/1.png",
  "assets/images/2.png",
  "assets/images/3.png",
  "assets/images/4.png",
  "assets/images/5.png",
  "assets/images/6.png",
  "assets/images/7.png",
  "assets/images/8.png",
  "assets/images/9.png",
  "assets/images/10.png",
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
            // child: GridView.count(
            //   crossAxisCount: 2,
            //   padding: const EdgeInsets.all(20),
            //   crossAxisSpacing: 20,
            //   mainAxisSpacing: 20,
            //   children: const [
            //     ImageBox(),
            //     ImageBox(),
            //     ImageBox(),
            //     ImageBox(),
            //     ImageBox(),
            //     ImageBox(),
            //   ],
            // ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            width: double.infinity,
            color: Colors.blue,
            child: TextButton(
              onPressed: () {
                setState(() {
                  imageBoxs.clear();
                  hideAll = true;
                  ImageBox i1 = ImageBox();
                  print(i1.assetImage);
                  imageBoxs.add(i1);
                  // imageBoxs.add(i1);
                  // imageBoxs.add(i1);
                  // imageBoxs.add(i1);
                  // imageBoxs.add(i1);
                  // imageBoxs.add(i1);
                  // imageBoxs.add(i1);
                  // imageBoxs.add(i1);
                  // imageBoxs.add(i1);
                  // imageBoxs.add(i1);
                  // imageBoxs.add(i1);
                  // imageBoxs.add(i1);
                  //reset();
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
  ImageBox({super.key, this.imageShow = false, this.assetImage = ""});

  bool imageShow;
  String assetImage;

  @override
  State<ImageBox> createState() =>
      _ImageBoxState(imageShow: imageShow, assetImage: assetImage);
}

class _ImageBoxState extends State<ImageBox> {
  _ImageBoxState({this.imageShow = false, this.assetImage = ""});
  bool imageShow;

  String? assetImage;

  final double _circular = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(_circular)),
      ),
      child: (!hideAll && !imageShow)
          ? InkWell(
              onTap: () {
                //print(Random().nextInt(10));
                setState(() {
                  hideAll = false;
                  imageShow = !imageShow;
                  assetImage =
                      assetImages[Random().nextInt(assetImages.length)];
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
              child: Image(fit: BoxFit.cover, image: AssetImage(assetImage!))),
    );
  }
}

bool hideAll = false;
