import 'package:flutter/material.dart';

import 'modal.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.listdata});
  final List<Data> listdata;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: listdata.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  ClipOval(
                    child: Image.network(
                      listdata[index].image.toString(),
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
                        listdata[index].icon.toString(),
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                    maxLines: 2,
                    //softWrap: false,
                    text: TextSpan(
                      text: listdata[index].subjectName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: listdata[index]
                              .message!
                              .text
                              .toString()
                              .replaceAll(
                                  listdata[index].subjectName.toString(), ""),
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        //return Text(datas.listData![index].message!.text.toString()

        // );
      },
    );
  }
}