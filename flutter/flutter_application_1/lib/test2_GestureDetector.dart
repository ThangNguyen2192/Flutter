import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IconGridView(),
    );
  }
}

class IconGridView extends StatefulWidget {
  const IconGridView({super.key});

  @override
  _IconGridViewState createState() => _IconGridViewState();
}

List<Widget> items = List.generate(
  20,
  (index) => const Icon(
    Icons.star,
    size: 50,
    color: Colors.yellow,
  ),
);

bool showIcons = true;

class _IconGridViewState extends State<IconGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Grid View'),
      ),
      body: Column(
        children: [
           Expanded(
            // child: MG(),
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (showIcons) {
                        items[index] = Image.asset(
                          'assets/images/1.png', // Đường dẫn đến hình ảnh của bạn
                          width: 50,
                          height: 50,
                        );
                      } else {
                        items[index] = const Icon(
                          Icons.star,
                          size: 50,
                          color: Colors.yellow,
                        );
                      }
                    });
                  },
                  child: items[index],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                // Đặt lại danh sách Icon
                items = List.generate(
                  1,
                  (index) => const Icon(
                    Icons.star,
                    size: 50,
                    color: Colors.yellow,
                  ),
                );
                showIcons = true;
              });
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}

class MG extends StatefulWidget {
  const MG({super.key});

  @override
  State<MG> createState() => _MGState();
}

class _MGState extends State<MG> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (showIcons) {
                items[index] = Image.asset(
                  'assets/images/1.png', // Đường dẫn đến hình ảnh của bạn
                  width: 50,
                  height: 50,
                );
              } else {
                items[index] = const Icon(
                  Icons.star,
                  size: 50,
                  color: Colors.yellow,
                );
              }
            });
          },
          child: items[index],
        );
      },
    );
  }
}
