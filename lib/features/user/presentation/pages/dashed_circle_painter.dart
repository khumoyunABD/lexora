// First, create the painter class
import 'dart:math';

import 'package:flutter/material.dart';

class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedCirclePainter({
    this.color = Colors.white,
    this.strokeWidth = 2.5,
    this.dashWidth = 8.0,
    this.dashSpace = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    // Calculate the circumference
    final circumference = 2 * pi * radius;

    // Calculate how many dashes we can fit
    final dashCount = (circumference / (dashWidth + dashSpace)).floor();
    final adjustedDashWidth = dashWidth;
    final adjustedDashSpace = dashSpace;

    // Draw dashed circle
    for (int i = 0; i < dashCount; i++) {
      final startAngle = (i * (adjustedDashWidth + adjustedDashSpace)) / radius;
      final sweepAngle = adjustedDashWidth / radius;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle - pi / 2, // Start from top
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
  }
}
