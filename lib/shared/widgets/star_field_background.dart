import 'dart:math';
import 'package:flutter/material.dart';
import 'star_painter.dart';

class StarFieldBackground extends StatefulWidget {
  final int starCount;
  const StarFieldBackground({Key? key, this.starCount = 60}) : super(key: key);

  @override
  State<StarFieldBackground> createState() => _StarFieldBackgroundState();
}

class _StarFieldBackgroundState extends State<StarFieldBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Star> _stars;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    final random = Random(42);
    _stars = List.generate(widget.starCount, (_) => Star.random(random));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: StarPainter(
            animationValue: _controller.value,
            stars: _stars,
          ),
        );
      },
    );
  }
}
