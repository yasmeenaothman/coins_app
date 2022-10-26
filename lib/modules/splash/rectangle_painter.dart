import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RectanglePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 12.w;
    final a = Offset(size.width * 1 / 6, size.height * 1/ 5);
    final b = Offset(size.width * 5 / 6, size.height * 3 / 4);
    const radius = Radius.circular(10);
    final rect = Rect.fromPoints(a, b);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>false;

}