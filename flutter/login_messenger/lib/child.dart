import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Cubes(
          left: 23,
          top: -171,
          width: 496,
          height: 496,
          boxShape: BoxShape.circle,
        ),
        Cubes(
          left: 114,
          top: -356,
          width: 635,
          height: 635,
          boxShape: BoxShape.circle,
          backgroundColor: const Color(0xFFF8F9FF),
          // backgroundColor: const Color.fromARGB(255, 239, 235, 240),
        ),
        Cubes(left: -306, top: 634, width: 371, height: 372),
        Cubes(
          left: -300,
          top: 639,
          width: 372,
          height: 372,
          angle: 27.09 * pi / 180,
        ),
      ],
    );
  }
}

class Cubes extends StatelessWidget {
  Cubes({
    super.key,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    this.boderColor = const Color(0xFFF8F9FF),
    this.backgroundColor,
    this.angle = 0,
    this.boxShape = BoxShape.rectangle,
  });
  double left = 0;
  double top = 0;
  double angle;
  double width = 0;
  double height = 0;
  Color boderColor;
  Color? backgroundColor;
  BoxShape boxShape;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: width, // Độ rộng của hình tròn
          height: height, // Độ cao của hình tròn
          decoration: BoxDecoration(
              shape: boxShape,
              border: Border.all(
                width: 3,
                color: boderColor,
              ),
              // shape: BoxShape.circle, // Chọn hình tròn
              color: backgroundColor // Màu của hình tròn
              ),
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  TextBox({
    super.key,
    required this.text,
    this.color = const Color(0xFF1F41BB),
    this.alignment,
    this.margin,
    this.onTap,
  });
  String text;
  Color? color;
  AlignmentGeometry? alignment;
  EdgeInsetsGeometry? margin;
  Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      // margin: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: color),
        ),
      ),
    );
  }
}

class TextFieldBox extends StatelessWidget {
  TextFieldBox({
    super.key,
    required this.hintText,
    this.boxBoder,
    this.controller,
    this.errorText,
    this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
  });
  String hintText = "";
  Border? boxBoder;
  TextEditingController? controller;
  String? errorText;
  Function? onChanged;
  Widget? suffixIcon;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FF),
        border: boxBoder,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: obscureText,
        onChanged: (value) {
          onChanged?.call(value);
        },
        controller: controller,
        // textAlignVertical: TextAlignVertical
        //     .top, // Center vertically Căn cho chữ luôn ở giữa dòng theo chiều đứng
        decoration: InputDecoration(
          hintText: hintText,
          // labelText: hintText,
          hintStyle: const TextStyle(fontSize: 16),
          errorText: errorText,
          errorStyle: const TextStyle(fontSize: 16),
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

class IconBox extends StatelessWidget {
  IconBox({super.key, required this.icon, this.width = 60, this.height = 44});
  double width;
  double height;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: icon,
    );
  }
}

class ButtonBox extends StatelessWidget {
  ButtonBox({
    super.key,
    required this.text,
    this.onPressed,
  });
  Function? onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF1F41BB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          onPressed?.call();
        }

        //checkEmail(emailController.text);
        ,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}
