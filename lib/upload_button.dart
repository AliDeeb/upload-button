import 'package:flutter/material.dart';
import 'package:upload_button/upload_button_painter.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    super.key,
    required this.progressValue,
    required this.child,
    this.width,
    this.height,
    this.color = const Color(0xFF0969E7),
    this.borderRadius = 100,
    this.strokeColor = const Color.fromARGB(120, 9, 105, 231),
    this.strokeWidth = 8,
    this.onTap,
  });

  final double? width;
  final double? height;
  final Color color;
  final double borderRadius;
  final Color strokeColor;
  final double strokeWidth;
  final double progressValue;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
    );

    return CustomPaint(
      painter: UploadButtonPainter(
        decoration: decoration,
        start: 0,
        end: progressValue,
        color: strokeColor,
        strokeWidth: strokeWidth,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: width,
        height: height,
        decoration: decoration,
        clipBehavior: Clip.hardEdge,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white30,
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: onTap,
            child: child,
          ),
        ),
      ),
    );
  }
}
