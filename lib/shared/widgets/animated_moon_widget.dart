import 'package:flutter/material.dart';
import 'moon_painter.dart';

class AnimatedMoonWidget extends StatefulWidget {
  final double phase; // 0.0 to 1.0
  final double size;

  const AnimatedMoonWidget({
    Key? key,
    required this.phase,
    this.size = 180.0,
  }) : super(key: key);

  @override
  State<AnimatedMoonWidget> createState() => _AnimatedMoonWidgetState();
}

class _AnimatedMoonWidgetState extends State<AnimatedMoonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnim;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _glowAnim = CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Illumination fraction (0..1) for outer glow strength
    final illum = (1.0 - (2 * widget.phase - 1.0).abs()).clamp(0.0, 1.0);

    return AnimatedBuilder(
      animation: _glowAnim,
      builder: (context, _) {
        final glow = _glowAnim.value;
        final glowOpacity = (0.12 + 0.10 * glow) * illum;
        final blurRadius = 24.0 + 14.0 * glow;

        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: illum > 0.05
                ? [
                    // Inner soft glow
                    BoxShadow(
                      color: const Color(0xFFB8CFFF).withOpacity(glowOpacity * 0.8),
                      blurRadius: blurRadius * 0.6,
                      spreadRadius: 0,
                    ),
                    // Outer atmospheric halo
                    BoxShadow(
                      color: const Color(0xFF6A9FE0).withOpacity(glowOpacity * 0.5),
                      blurRadius: blurRadius * 1.6,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: CustomPaint(
            painter: MoonPainter(
              phase: widget.phase,
              glowIntensity: glow,
            ),
          ),
        );
      },
    );
  }
}
