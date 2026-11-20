import 'dart:math';
import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  final double animationValue;
  final List<Star> stars;

  StarPainter({required this.animationValue, required this.stars});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var star in stars) {
      final twinkle = sin(animationValue * 2 * pi * star.speed + star.offset) * 0.5 + 0.5;
      paint.color = Colors.white.withOpacity(star.opacity * (0.3 + 0.7 * twinkle));

      final x = star.x * size.width;
      final y = star.y * size.height;

      canvas.drawCircle(Offset(x, y), star.radius, paint);

      // Draw subtle glow for brighter stars
      if (star.radius > 1.5) {
        paint.color = const Color(0xFF8ABEFF).withOpacity(0.2 * twinkle);
        canvas.drawCircle(Offset(x, y), star.radius * 2.5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant StarPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

class Star {
  final double x;
  final double y;
  final double radius;
  final double opacity;
  final double speed;
  final double offset;

  Star({
    required this.x,
    required this.y,
    required this.radius,
    required this.opacity,
    required this.speed,
    required this.offset,
  });

  factory Star.random(Random random) {
    return Star(
      x: random.nextDouble(),
      y: random.nextDouble(),
      radius: random.nextDouble() * 1.8 + 0.6,
      opacity: random.nextDouble() * 0.7 + 0.3,
      speed: random.nextDouble() * 1.5 + 0.5,
      offset: random.nextDouble() * 2 * pi,
    );
  }
}
