import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPainter(),
    );
  }
}

class MyPainter extends StatefulWidget {
  const MyPainter({super.key});

  @override
  State<MyPainter> createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter> {
  @override
  void initState() {
    super.initState();

    // Khởi tạo timer để lấy thời gian mỗi giây
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clock"),
      ),
      backgroundColor: const Color.fromARGB(255, 159, 139, 139),
      body: CustomPaint(
        painter: ShapePainter(),
        child: Container(),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  DateTime dateTime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    //--Vẽ nền trong đồng hồ và vòng tròn bo bên ngoài
    void veNen() {
      final Path path = Path();

      final Paint paintBackground = Paint()
        ..color = const Color(0xFF353763)
        ..style = PaintingStyle.fill;

      final Paint paintCircle = Paint()
            ..color = Colors.white
            ..strokeWidth = 20
            ..style = PaintingStyle.stroke
          //..strokeCap = StrokeCap.round
          ;
      //--Vẽ nền trong
      path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: 150,
      ));
      canvas.drawPath(path, paintBackground);

      //--vẽ vòng tròn to
      path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: 150,
      ));
      canvas.drawPath(path, paintCircle);
    }

    veNen();

    //--Vẽ kim giờ
    void veKimGio() {
      final Path path = Path();

      final Paint paint = Paint()
        ..color = Colors.pink
        ..strokeWidth = 16
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      path.moveTo(size.width / 2, size.height / 2);
      path.lineTo(
          size.width / 2 +
              80 * sin(dateTime.hour * 30 + 30 * dateTime.minute / 60),
          size.height / 2 -
              80 * cos(dateTime.hour * 30 + 30 * dateTime.minute / 60));
      canvas.drawPath(path, paint);
    }

    veKimGio();

    //--Vẽ kim phút
    void vePhut() {
      final Path path = Path();

      final Paint paint = Paint()
        ..color = const Color(0xFF5055f5)
        ..strokeWidth = 12
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      path.moveTo(size.width / 2, size.height / 2);
      path.lineTo(size.width / 2 + 100 * sin(dateTime.minute * 6),
          size.height / 2 - 100 * cos(dateTime.minute * 6));
      canvas.drawPath(path, paint);
    }

    vePhut();

    //-- Vẽ kim giây
    void veKimGiay() {
      final Path path = Path();

      final Paint paint = Paint()
        ..color = Colors.yellow
        ..strokeWidth = 8
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      path.moveTo(size.width / 2, size.height / 2);
      path.lineTo(size.width / 2 + 120 * sin(dateTime.second * 6),
          size.height / 2 - 120 * cos(dateTime.second * 6));
      canvas.drawPath(path, paint);
    }

    veKimGiay();

    //--Vẽ tâm đồng hồ
    void veTam() {
      final Path path = Path();

      final Paint paint = Paint()
            ..color = Colors.white
            ..strokeWidth = 20
            ..style = PaintingStyle.stroke
          //..strokeCap = StrokeCap.round
          ;

      path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: 10,
      ));
      canvas.drawPath(path, paint);
      //
    }

    veTam();

    //--Vẽ các đường gạch  bên ngoài
    void veDuongGach() {
      final Path path = Path();

      final Paint paint = Paint()
        ..color = Colors.white
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      for (int i = 0; i < 30; i++) {
        double degree = i * 12;
        path.moveTo(size.width / 2 + 180 * sin(degree),
            size.height / 2 - 180 * cos(degree));
        path.lineTo(size.width / 2 + 200 * sin(degree),
            size.height / 2 - 200 * cos(degree));
        canvas.drawPath(path, paint);
      }
    }

    veDuongGach();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

double sin(double degree) {
  double radians = degree * (math.pi / 180);
  // Tính giá trị sin của góc
  double sinValue = math.sin(radians);

  return sinValue;
}

double cos(double degree) {
  double radians = degree * (math.pi / 180);
  // Tính giá trị cos của góc
  double cosValue = math.cos(radians);

  return cosValue;
}
