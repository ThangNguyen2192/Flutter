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
    double dx = size.width / 2;
    double dy = size.height / 2;
    double doDaiKimGio = 80;
    double doDaiKimPhut = 100;
    double doDaiKimGiay = 120;

    
    void veHinhTron(
        {Color color = Colors.transparent,
        double strokeWidth = 0,
        PaintingStyle style = PaintingStyle.stroke,
        double radius = 0,}) {
      final Path path = Path();
      final Paint paint = Paint()
            ..color = color
            ..strokeWidth = strokeWidth
            ..style = style
          //..strokeCap = StrokeCap.round
          ;
      path.addOval(Rect.fromCircle(
        center: Offset(dx, dy),
        radius: radius,
      ));
      canvas.drawPath(path, paint);
    }
    //--Vẽ nền bên trong
    veHinhTron(color: const Color(0xFF353763),style: PaintingStyle.fill,radius: 150);
    //--Vẽ hình tròn to bo bên ngoài
    veHinhTron(color:  Colors.white,strokeWidth: 20,style: PaintingStyle.stroke,radius: 150);

    
    //--Vẽ kim
    void veKim(
        {double doDaiKim = 0,
        double strokeWidth = 16,
        Color color = Colors.red,
        double degree = 0}) {
      final Path path = Path();
      final Paint paint = Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      //double degree = dateTime.hour * 30 + 30 * dateTime.minute / 60;
      path.moveTo(dx, dy);
      path.lineTo(dx + doDaiKim * sin(degree), dy - doDaiKim * cos(degree));
      canvas.drawPath(path, paint);
    }

//--Vẽ kim giờ
    veKim(
        doDaiKim: doDaiKimGio,
        strokeWidth: 16,
        color: Colors.red,
        degree: (dateTime.hour * 30 + 30 * dateTime.minute / 60));

    //--Vẽ kim phút
    veKim(
        doDaiKim: doDaiKimPhut,
        strokeWidth: 12,
        color: const Color(0xFF5055f5),
        degree: dateTime.minute * 6);

    //-- Vẽ kim giây
    veKim(
        doDaiKim: doDaiKimGiay,
        strokeWidth: 8,
        color: Colors.yellow,
        degree: dateTime.second * 6);

    //--Vẽ hình tròn tâm đồng hồ
    veHinhTron(color: Colors.white,style: PaintingStyle.fill,radius: 20);
    

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
        path.moveTo(dx + 180 * sin(degree), dy - 180 * cos(degree));
        path.lineTo(dx + 200 * sin(degree), dy - 200 * cos(degree));
        canvas.drawPath(path, paint);
      }
    }

    veDuongGach();

    //--Vẽ các mốc giờ
    void veVachGio() {
      final Path path = Path();

      final Paint paint = Paint()
        ..color = Colors.white
        ..strokeWidth = 8
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      for (int i = 0; i < 12; i++) {
        double degree = i * 30;
        path.moveTo(dx + 130 * sin(degree), dy - 130 * cos(degree));
        path.lineTo(dx + 135 * sin(degree), dy - 135 * cos(degree));
        canvas.drawPath(path, paint);
      }
    }

    veVachGio();
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
