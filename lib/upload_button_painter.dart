import 'package:flutter/material.dart';

class UploadButtonPainter extends CustomPainter {
  final BoxDecoration decoration;
  final double start;
  final double end;
  final Color color;
  final double strokeWidth;

  UploadButtonPainter({
    required this.decoration,
    required this.start,
    required this.end,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = decoration.getClipPath(Offset.zero & size, TextDirection.rtl);
    final pathMetric = path.computeMetrics().first;

    canvas.drawPath(
        pathMetric.extractPath(start, end * pathMetric.length), paint);
  }

  @override
  bool shouldRepaint(covariant UploadButtonPainter oldDelegate) {
    return oldDelegate.decoration != decoration ||
        oldDelegate.start != start ||
        oldDelegate.end != end ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
