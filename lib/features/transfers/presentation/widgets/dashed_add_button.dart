import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class DashedAddButton extends StatelessWidget {
  final double radius;
  final double dashLength;
  final double gapLength;
  final double strokeWidth;
  final Color color;
  final Widget child;
  final VoidCallback? onTap;

  const DashedAddButton({
    super.key,
    required this.radius,
    this.dashLength = 6,
    this.gapLength = 4,
    this.strokeWidth = 2,
    this.color = DefaultColors.dashboarddarkBlue,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = radius * 2;
    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(size, size),
              painter: _DashedCirclePainter(
                color: color,
                strokeWidth: strokeWidth,
                dashLength: dashLength,
                gapLength: gapLength,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  _DashedCirclePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.gapLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final circumference = 2 * 3.141592653589793 * radius;
    final dashAndGap = dashLength + gapLength;
    final dashCount = (circumference / dashAndGap).floor();
    if (dashCount <= 0) return;

    final dashAngle = dashLength / radius; // in radians approximation
    final stepAngle = (dashAndGap) / radius; // in radians approximation

    for (int i = 0; i < dashCount; i++) {
      final startAngle = i * stepAngle - 3.141592653589793 / 2;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        dashAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
