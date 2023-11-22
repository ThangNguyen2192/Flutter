import 'package:flutter/material.dart';
import 'controler.dart';
import 'modal.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key, required this.listdata});
  final List<Data> listdata;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: listdata.length,
      itemBuilder: (context, index) {
        return Notification(data: listdata[index]);
      },
    );
  }
}

// ignore: must_be_immutable
class Notification extends StatelessWidget {
  Notification({super.key, required this.data});
  Data data;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> status =
        ValueNotifier<String>(data.status.toString());
    return InkWell(
      onTap: () {
        data.status = "read";
        status.value = "read";
      },
      child: AnimatedBuilder(
        animation: status,
        builder: (BuildContext context, Widget? child) {
          return Container(
            padding: const EdgeInsets.all(10),
            color: status.value == "read"
                ? Colors.transparent
                : const Color(0xFFECF7E7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Avartar(
                  data: data,
                ),
                Content(
                  data: data,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class Avartar extends StatelessWidget {
  Avartar({super.key, required this.data});
  Data data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: Image.network(
            data.image.toString(),
            fit: BoxFit.cover,
            width: 56,
            height: 56,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: ClipOval(
            child: Image.network(
              data.icon.toString(),
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text('');
              },
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class Content extends StatelessWidget {
  Content({super.key, required this.data});
  Data data;

  List<TextSpan> childrenTextSpan(Data data) {
    List<TextSpan> children = [];
    int currentPosition = 0;
    String text = data.message!.text.toString();

    for (int i = 0; i < data.message!.highlights!.length; i++) {
      final int offset = data.message!.highlights![i].offset ?? 0;
      final int length = data.message!.highlights![i].length ?? 0;
      children.add(
        TextSpan(
          text: text.substring(currentPosition, offset),
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black), // phần văn bản không in đậm
        ),
      );

      children.add(
        TextSpan(
          text: text.substring(offset, offset + length),
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black), // phần văn bản in đậm
        ),
      );

      currentPosition = offset + length;
    }

    // Thêm văn bản còn lại sau vị trí được đánh dấu
    if (currentPosition < text.length) {
      children.add(
        TextSpan(
          text: text.substring(currentPosition),
          style: const TextStyle(
              fontWeight: FontWeight.normal, color: Colors.black), //
        ),
      );
    }

    double secondsSinceEpoch = double.parse(data.createdAt
        .toString()); // Giá trị double đại diện cho số giây kể từ Epoch
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch((secondsSinceEpoch * 1000).toInt());

    String sngay = "\n${formatDateTime(dateTime, "dd/MM/yyyy, hh:mm")}";
    children.add(TextSpan(
      text: sngay,
      style:
          const TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
    ));

//  print(dateTime.toString("dd"));

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: RichText(
          // maxLines: 2,
          //softWrap: false,
          text: TextSpan(
            children: childrenTextSpan(data),
          ),
        ),
      ),
    );
  }
}
