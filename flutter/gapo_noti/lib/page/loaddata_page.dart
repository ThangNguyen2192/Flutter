import 'package:flutter/material.dart';

import '../controler.dart';

class LoadDataPage extends StatelessWidget {
  const LoadDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<bool>(
          future: readJsonData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamed('/notificationPage');
              });
            } else if (snapshot.hasError) {
              return const Text("Error load data");
            }

            // if (snapshot.connectionState == ConnectionState.done) {

            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   Navigator.of(context).pushNamed('/notificationPage');
            // });
            //   //Navigator.of(context).pushNamed("/notificationPage");
            // }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
