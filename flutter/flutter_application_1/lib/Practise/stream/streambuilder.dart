import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Lap1,2,3,4,5"),
        ),
        body: Column(
          children: [
            const Lap1Widget(),
            const NewWidget(),
            Lap2Widget(),
            const NewWidget(),
            const Lap3Wigget(),
            const NewWidget(),
            const Lap4Widget(),
            const NewWidget(),
            Lap5Widget(),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.black,
      height: 2,
    );
  }
}

// ignore: must_be_immutable
class TextButtonWidget extends StatelessWidget {
  TextButtonWidget({
    super.key,
    // required this.function,
    required this.text,
    this.function,
  });

  final String text;
  Function? function;

  //final ValueNotifier<bool> isDownload;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function == null
            ? null
            : () {
                function!();
              },
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: function == null ? Colors.grey : Colors.blue,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }
}

//--Lap5
// ignore: must_be_immutable
class Lap5Widget extends StatelessWidget {
  Lap5Widget({super.key});

  ValueNotifier<bool> isDownload = ValueNotifier<bool>(false);
  void downloadClick() {
    isDownload.value = true;
  }

  Stream<int> streamLap5() async* {
    if (isDownload.value) {
      for (int i = 0; i <= 180; i++) {
        yield i;
        await Future.delayed(const Duration(seconds: 1));
      }
    }
  }

  List<int> maxValues = List.generate(10, (index) => Random().nextInt(10) + 10);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        // height: 500,
        //color: Colors.greenAccent,
        child: AnimatedBuilder(
      animation: isDownload,
      builder: (context, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Lap5:",
                  style: TextStyle(fontSize: 30),
                ),
                TextButtonWidget(
                  text: "Download",
                  function: downloadClick,
                )
              ],
            ),
            StreamBuilder(
              stream: streamLap5(),
              builder: (context, snapshot) {
                double value = 0;
                if (snapshot.hasData) {
                  value = snapshot.data!.toDouble();
                }
                //return const Text("abc");
                return Expanded(
                  //height: 300,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Download(value: value, maxValue: maxValues[index]);
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    ));
  }
}

class Download extends StatelessWidget {
  const Download({
    super.key,
    required this.value,
    required this.maxValue,
  });

  final double value;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: value / maxValue < 1 ? value / maxValue : 1,
            // minHeight: 0.9,
          ),
          SizedBox(
            width: double.infinity,
           // height: 10,
            // color: Colors.pink,
            //  padding: EdgeInsets.only(left: 0),
            child: Text(
              "${value / maxValue < 1 ? (value * 100 / maxValue).roundToDouble() : 100}%",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

//--Lap4
class Lap4Widget extends StatefulWidget {
  const Lap4Widget({super.key});

  @override
  State<Lap4Widget> createState() => _Lap4WidgetState();
}

class _Lap4WidgetState extends State<Lap4Widget> {
  ValueNotifier<double> valueCupertinoSlider = ValueNotifier<double>(1);

  void historyClick() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
              // color: Colors.pink,
              height: 500,
              child: ListView.builder(
                itemCount: map.length,
                itemBuilder: (context, index) {
                  return Container(
                    // height: 50,
                    color: index % 2 == 0 ? Colors.blue : Colors.amber[50],
                    child: Text(
                      "Giai thừa của ${map.keys.toList()[index]}: ${map.values.toList()[index]}",
                      style: const TextStyle(fontSize: 30),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }

  StreamController streamController = StreamController<int>.broadcast();

  Map<int, int> map = <int, int>{};

  int tinhGiaiThua(int num) {
    int gt = 1;
    for (int i = 1; i <= num; i++) {
      gt *= i;
    }
    return gt;
  }

  @override
  Widget build(BuildContext context) {
    streamController.stream.listen(
      (data) {
        //  if(!map.containsKey(data))
        //  {
        map.addAll({data: tinhGiaiThua(data)});
        //  }
      },
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Lap4:",
          style: TextStyle(fontSize: 30),
        ),
        AnimatedBuilder(
          animation: valueCupertinoSlider,
          builder: (context, child) {
            return Column(
              children: [
                CupertinoSlider(
                  value: valueCupertinoSlider.value,
                  onChangeEnd: (value) {
                    if (!map.containsKey(value.round())) {
                      streamController.add(value.round());
                    }
                  },
                  onChanged: (value) {
                    valueCupertinoSlider.value = value;
                  },
                  min: 1,
                  max: 10,
                  divisions: 9,
                ),
                Text(
                  valueCupertinoSlider.value.round().toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  tinhGiaiThua(valueCupertinoSlider.value.round()).toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            );
          },
        ),
        TextButtonWidget(
          text: "History",
          function: historyClick,
        ),
      ],
    );
  }
}

//--Lap3
class Lap3Wigget extends StatelessWidget {
  const Lap3Wigget({super.key});

  Stream<int> streamLap3() async* {
    for (int i = 0; i <= 180; i++) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Lap3: ",
          style: TextStyle(fontSize: 30),
        ),
        StreamBuilder(
          stream: streamLap3(),
          builder: (context, snapshot) {
            String text = "";
            if (snapshot.hasData) {
              int minute = snapshot.data! ~/ 60;
              int second = snapshot.data! - minute * 60;
              text = "${(minute > 0) ? "${minute}p" : ""}${second}s";
            }
            return Text(
              text,
              style: const TextStyle(fontSize: 30),
            );
          },
        ),
      ],
    );
  }
}

//--Lap2
// ignore: must_be_immutable
class Lap2Widget extends StatelessWidget {
  Lap2Widget({super.key});
  ValueNotifier<bool> lap2Reset = ValueNotifier<bool>(false);

  Stream<String> streamLap2() async* {
    //print("v");
    if (lap2Reset.value) {
      for (int i = 3; i >= 0; i--) {
        if (i > 0) {
          yield i.toString();
          await Future.delayed(const Duration(seconds: 1));
        } else {
          yield "Done";
        }
      }
      lap2Reset.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: lap2Reset,
      builder: (context, child) {
        return Row(
          children: [
            const Text(
              "Lap2: ",
              style: TextStyle(fontSize: 30),
            ),
            TextButtonWidget(
                text: "Click",
                function: (lap2Reset.value == true)
                    ? null
                    : () {
                        if (lap2Reset.value == false) {
                          lap2Reset.value = true;
                        }
                      }),
            StreamBuilder(
              stream: streamLap2(),
              builder: (context, snapshot) {
                String text = "";
                if (snapshot.data != null) {
                  text = snapshot.data.toString();
                }

                return Text(
                  text,
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

//--Lap1
class Lap1Widget extends StatelessWidget {
  const Lap1Widget({super.key});

  Stream<int> stream() async* {
    for (int i = 1; i <= 12; i++) {
      yield i;
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Lap1: ",
          style: TextStyle(fontSize: 30),
        ),
        StreamBuilder(
          stream: stream(),
          builder: (context, snapshot) {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 30),
            );
          },
        ),
      ],
    );
  }
}
