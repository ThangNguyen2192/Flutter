import 'dart:math' as math show pi;
import 'package:flutter/material.dart';

const bool useCanvas = false;

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

class MyPainter extends StatelessWidget {
  const MyPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Paint example'),
      ),
      body: CustomPaint(
        painter: ShapePainter(),
        child: Container(),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final Path path = Path();
    // --------- LINE --------- \\
    void drawLine() {
      if (useCanvas) {
        // Cach 1:
        Offset startingPoint = Offset(0, size.height / 2);
        Offset endingPoint = Offset(size.width, size.height / 2);

        canvas.drawLine(startingPoint, endingPoint, paint);
      } else {
        // Cach 2: dung Path
        path.moveTo(0, size.height / 2); //--dat vi tri o toa do nay
        path.lineTo(size.height,
            size.height / 2); //-- ve den toa do nay, toa do so voi man hinh
        canvas.drawPath(path, paint);

        // --------- Path addRect Rect.fromLTWH--------- \\ ve hinh vuong
        void addRect() {
          // Adds a rectangle

          final Path path = Path();
          path.addRect(Rect.fromLTWH(size.width / 2, size.height / 2,
              size.width / 4, size.height / 4));
          canvas.drawPath(path, paint);
        }

        addRect();

        // --------- Path addRRect Rect.fromRectAndRadius--------- \\ ve hinh vuong bo goc
        void addRRect() {
          final Path path = Path();
          path.addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(size.width / 4, size.height / 2, size.width / 4,
                  size.height / 4),
              const Radius.circular(32)));
          canvas.drawPath(path, paint);
        }

        addRRect();

        // --------- Path addRRect Rect.fromRectAndRadius--------- \\
        void addPath() {
          final Path path = Path();
          path.addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(size.width / 4, size.height * 3 / 4, size.width / 4,
                  size.height / 4),
              const Radius.circular(32)));

          final Path secondPath = Path();

          const double left = 20;
          final double top = size.height * 3 / 4 + 40;

          secondPath.moveTo(size.width / 4 - left, top);
          secondPath.lineTo(0 - left, top);
          path.addPath(secondPath, const Offset(16, 16));

          canvas.drawPath(path, paint);
        }

        addPath();

        // --------- Path addRRect Rect.fromRectAndRadius--------- \\
        void relativePath() {
          final Path path = Path();
          path.moveTo(100, 100); //-- toa do ban dau
          path.relativeLineTo(200, 100); //-- toa do so voi toa do điểm trước đó
          path.relativeLineTo(0, 200);
          // path.
          // path.lineTo(200, 200);
          // path.lineTo(0, 200);
          canvas.drawPath(path, paint);
        }

        relativePath();

        void addPolygon() {
          //--Nối nhiều điểm
          path.addPolygon([
            Offset(size.width, size.height / 2),
            Offset(0, size.height / 2),
            Offset(size.width / 2, size.height / 4),
            Offset(size.width / 2, size.height / 8),
            // Offset(size.width / 4, size.height / 16),
          ], true);
          //--true là không nối điểm cuói với điẻm đầu
          //-- false là nối cả cuối và đầu
          canvas.drawPath(path, paint);
        }

        addPolygon();
      }
    }

    drawLine();

    // --------- CIRCLE --------- \\
    void drawCircle() {
      if (useCanvas) {
        Offset center = Offset(size.width / 2, size.height / 2);

        canvas.drawCircle(center, 100, paint);
      } else {
        path.addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: 100, //--r hinh tron
        ));
        canvas.drawPath(path, paint);

        // --------- Path addOval Rect.fromLTWH--------- \\
        void addOval() {
          // Adds an oval
          path.addOval(Rect.fromLTWH(size.width / 2, size.height / 2,
              size.width / 4, size.height / 4));
          canvas.drawPath(path, paint);
        }

        addOval();
      }
    }

    drawCircle();

    // --------- QuadraticBezier --------- \\
    void drawQuadraticBezierTo() {
      path.moveTo(0, size.height / 2);
      path.quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height / 2);
      canvas.drawPath(path, paint);
    }

    drawQuadraticBezierTo();

    // --------- QuadraticBezier --------- \\
    void drawCubicTo() {
      path.moveTo(0, 0);
      path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4,
          size.height / 4, size.width, size.height);

      canvas.drawPath(path, paint);

      path.moveTo(0, 0);
      path.cubicTo(
        200,
        500,
        500,
        200,
        0,
        0,
      );

      canvas.drawPath(path, paint);
    }

    drawCubicTo();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
