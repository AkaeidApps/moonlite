import 'dart:math';
import 'package:flutter/material.dart';

/// Realistic Moon Painter
/// phase: 0.0 = New Moon, 0.5 = Full Moon, 1.0 = New Moon again
class MoonPainter extends CustomPainter {
  final double phase;
  final double glowIntensity; // 0.0 to 1.0 for pulsing glow

  MoonPainter({
    required this.phase,
    this.glowIntensity = 0.5,
  });

  // === COLORS ===
  static const Color _moonBase = Color(0xFFD4DAEA);
  static const Color _moonDark = Color(0xFF8E9BB0);
  static const Color _moonLight = Color(0xFFF5F7FF);
  static const Color _mareColor = Color(0xFF6B7A94);
  static const Color _craterRim = Color(0xFFE8ECF5);
  static const Color _craterFloor = Color(0xFF5A6678);
  static const Color _shadowDark = Color(0xFF06111F);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 2;

    // ── 1. Atmospheric glow ──────────────────────────────────────────
    final illumination = _getIllumination(phase);
    if (illumination > 0.02) {
      final glowColor = Color.lerp(
        const Color(0xFF3A5F9A),
        const Color(0xFFB0CAFF),
        illumination,
      )!;
      for (int i = 3; i >= 1; i--) {
        final glowPaint = Paint()
          ..color = glowColor.withOpacity(0.04 * glowIntensity * illumination * i)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 18.0 * i);
        canvas.drawCircle(center, radius + 6.0 * i, glowPaint);
      }
    }

    // ── 2. Moon base sphere (gradient for 3D look) ───────────────────
    final baseGradient = RadialGradient(
      center: const Alignment(-0.3, -0.3),
      radius: 0.85,
      colors: [
        _moonLight,
        _moonBase,
        _moonDark,
        const Color(0xFF4A5568),
      ],
      stops: const [0.0, 0.45, 0.80, 1.0],
    );
    final basePaint = Paint()
      ..shader = baseGradient.createShader(
          Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, basePaint);

    // ── 3. Lunar Maria (dark seas) ───────────────────────────────────
    _drawLunarMaria(canvas, center, radius);

    // ── 4. Craters ───────────────────────────────────────────────────
    _drawCraters(canvas, center, radius);

    // ── 5. Surface highlight (specular point) ────────────────────────
    final highlightPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.4, -0.45),
        radius: 0.5,
        colors: [
          Colors.white.withOpacity(0.35),
          Colors.white.withOpacity(0.0),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, highlightPaint);

    // ── 6. Phase shadow overlay (the TERMINATOR) ─────────────────────
    _drawPhaseOverlay(canvas, center, radius, phase);

    // ── 7. Limb darkening ring ────────────────────────────────────────
    final limbPaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1.0,
        colors: [
          Colors.transparent,
          Colors.transparent,
          Colors.black.withOpacity(0.35),
        ],
        stops: const [0.0, 0.70, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..blendMode = BlendMode.multiply;
    canvas.drawCircle(center, radius, limbPaint);

    // ── 8. Thin bright limb edge ──────────────────────────────────────
    final rimPaint = Paint()
      ..color = Colors.white.withOpacity(0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(center, radius - 0.5, rimPaint);
  }

  // ------------------------------------------------------------------ //
  //  Lunar Mare (dark basaltic plains)                                   //
  // ------------------------------------------------------------------ //
  void _drawLunarMaria(Canvas canvas, Offset center, double r) {
    final Paint mare = Paint()
      ..color = _mareColor.withOpacity(0.55)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    // Mare Imbrium (top-left)
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(center.dx - r * 0.22, center.dy - r * 0.18),
          width: r * 0.52,
          height: r * 0.44),
      mare,
    );

    // Mare Serenitatis (top-right)
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(center.dx + r * 0.14, center.dy - r * 0.14),
          width: r * 0.36,
          height: r * 0.32),
      mare,
    );

    // Mare Tranquillitatis (center-right, Apollo 11 landing)
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(center.dx + r * 0.20, center.dy + r * 0.06),
          width: r * 0.42,
          height: r * 0.30),
      mare,
    );

    // Mare Crisium (far right)
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(center.dx + r * 0.52, center.dy - r * 0.14),
          width: r * 0.20,
          height: r * 0.17),
      mare,
    );

    // Mare Humorum (bottom-left)
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(center.dx - r * 0.30, center.dy + r * 0.38),
          width: r * 0.26,
          height: r * 0.22),
      mare,
    );

    // Oceanus Procellarum (large, left)
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(center.dx - r * 0.42, center.dy + r * 0.06),
          width: r * 0.36,
          height: r * 0.60),
      mare,
    );
  }

  // ------------------------------------------------------------------ //
  //  Craters                                                             //
  // ------------------------------------------------------------------ //
  void _drawCraters(Canvas canvas, Offset center, double r) {
    final craters = [
      // {dx, dy, radius} all in fraction of r
      {'x': 0.52, 'y': 0.42, 'r': 0.090}, // Tycho
      {'x': -0.14, 'y': -0.52, 'r': 0.065}, // Copernicus
      {'x': 0.60, 'y': -0.46, 'r': 0.055}, // Langrenus
      {'x': -0.52, 'y': 0.18, 'r': 0.045}, // Grimaldi
      {'x': 0.08, 'y': 0.58, 'r': 0.040}, // Clavius small
      {'x': -0.30, 'y': 0.62, 'r': 0.035},
      {'x': 0.38, 'y': -0.60, 'r': 0.030},
      {'x': -0.60, 'y': -0.30, 'r': 0.028},
      {'x': 0.20, 'y': 0.30, 'r': 0.022},
      {'x': -0.42, 'y': -0.08, 'r': 0.020},
      {'x': 0.44, 'y': 0.10, 'r': 0.018},
      {'x': -0.08, 'y': 0.20, 'r': 0.014},
    ];

    for (final c in craters) {
      final cx = center.dx + r * (c['x'] as double);
      final cy = center.dy + r * (c['y'] as double);
      final cr = r * (c['r'] as double);
      _drawCrater(canvas, Offset(cx, cy), cr);
    }
  }

  void _drawCrater(Canvas canvas, Offset pos, double r) {
    // Shadow on bottom-right (sun from top-left)
    final shadowPaint = Paint()
      ..color = _craterFloor.withOpacity(0.7)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, r * 0.4);
    canvas.drawCircle(Offset(pos.dx + r * 0.1, pos.dy + r * 0.1), r, shadowPaint);

    // Crater floor
    final floorPaint = Paint()
      ..color = _craterFloor.withOpacity(0.5);
    canvas.drawCircle(pos, r * 0.78, floorPaint);

    // Bright rim highlight (top-left lit by sun)
    final rimPaint = Paint()
      ..color = _craterRim.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = r * 0.25;
    canvas.drawArc(
      Rect.fromCircle(center: pos, radius: r * 0.9),
      pi + pi / 4, // top-left arc
      pi,
      false,
      rimPaint,
    );
  }

  // ------------------------------------------------------------------ //
  //  Phase overlay — accurate terminator with elliptical curve           //
  // ------------------------------------------------------------------ //
  void _drawPhaseOverlay(Canvas canvas, Offset center, double r, double p) {
    // phase 0.0 = New (all dark), 0.5 = Full (all lit), 1.0 = New
    // illumination fraction 0..1
    final illum = _getIllumination(p);

    if (illum < 0.001) {
      // New Moon: cover everything
      final paint = Paint()..color = _shadowDark.withOpacity(0.96);
      canvas.drawCircle(center, r, paint);
      return;
    }

    if (illum > 0.999) return; // Full Moon: nothing to cover

    canvas.save();
    canvas.clipPath(Path()..addOval(Rect.fromCircle(center: center, radius: r)));

    // The terminator x-offset as a fraction of radius:
    // illum = 0.5*(1 - cos(theta)), so cos(theta) = 1 - 2*illum
    // terminatorX = r * cos(theta) = r * (1 - 2*illum)
    final double terminatorX = r * (1.0 - 2.0 * illum);

    // Waxing (0..0.5): right side lit, terminator moves left→right
    // Waning (0.5..1): left side lit, terminator moves right→left
    final bool waxing = p <= 0.5;

    final shadowPath = _buildShadowPath(center, r, terminatorX, waxing);

    final shadowPaint = Paint()
      ..color = _shadowDark.withOpacity(0.93)
      ..style = PaintingStyle.fill;
    canvas.drawPath(shadowPath, shadowPaint);

    // Soft terminator edge glow
    final edgePaint = Paint()
      ..color = const Color(0xFF3A5F9A).withOpacity(0.25)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final edgePath = _buildTerminatorEdge(center, r, terminatorX, waxing);
    canvas.drawPath(edgePath, edgePaint);

    canvas.restore();
  }

  /// Builds the dark shadow region Path using an elliptical terminator.
  Path _buildShadowPath(Offset center, double r, double tx, bool waxing) {
    final path = Path();

    if (waxing) {
      // Shadow is on the LEFT side
      // Right semicircle (lit) + ellipse terminator
      // Start at top, go around right half, then back along ellipse
      path.moveTo(center.dx, center.dy - r);
      // Left half-circle arc (the shadow side)
      path.arcTo(
        Rect.fromCircle(center: center, radius: r),
        -pi / 2, // top
        -pi, // counter-clockwise to bottom (left side)
        false,
      );
      // Now at bottom: draw terminator ellipse back up
      // The terminator is a vertical ellipse with half-width = |tx|
      // For waxing: terminator bulges LEFT if tx > 0, RIGHT if tx < 0
      _addTerminatorArc(path, center, r, tx, true);
      path.close();
    } else {
      // Shadow is on the RIGHT side
      path.moveTo(center.dx, center.dy - r);
      // Right half-circle arc (shadow side)
      path.arcTo(
        Rect.fromCircle(center: center, radius: r),
        -pi / 2, // top
        pi, // clockwise to bottom (right side)
        false,
      );
      _addTerminatorArc(path, center, r, tx, false);
      path.close();
    }

    return path;
  }

  void _addTerminatorArc(Path path, Offset c, double r, double tx, bool waxing) {
    // Terminator is an ellipse: width = |tx|, height = r
    // We draw it from bottom to top (or top to bottom)
    final double ellipseA = tx.abs(); // semi-width of terminator ellipse

    if (ellipseA < 1) {
      // Nearly quarter or full: just a vertical line
      path.lineTo(c.dx, c.dy - r);
      return;
    }

    // Use cubic bezier to approximate the elliptical arc
    // Control point magic number for circle approximation: 0.5523
    final double k = 0.5523 * ellipseA;

    if (waxing) {
      // Terminator goes from bottom (c.dx, c.dy+r) to top (c.dx, c.dy-r)
      // If tx > 0: ellipse bulges right (crescent facing right for new→first Q)
      // If tx < 0: ellipse bulges left (past first Q → full)
      final double dir = (tx >= 0) ? 1.0 : -1.0;
      path.cubicTo(
        c.dx + dir * ellipseA + k * dir * 0, c.dy + r,
        c.dx + dir * ellipseA, c.dy + k,
        c.dx + dir * ellipseA, c.dy,
      );
      path.cubicTo(
        c.dx + dir * ellipseA, c.dy - k,
        c.dx + dir * ellipseA + k * dir * 0, c.dy - r,
        c.dx, c.dy - r,
      );
    } else {
      final double dir = (tx <= 0) ? -1.0 : 1.0;
      path.cubicTo(
        c.dx + dir * ellipseA, c.dy + k,
        c.dx + dir * ellipseA, c.dy,
        c.dx + dir * ellipseA, c.dy,
      );
      path.cubicTo(
        c.dx + dir * ellipseA, c.dy - k,
        c.dx + dir * ellipseA, c.dy - r,
        c.dx, c.dy - r,
      );
    }
  }

  Path _buildTerminatorEdge(Offset c, double r, double tx, bool waxing) {
    // Simplified: just draw the elliptical edge as a path for the glow
    final path = Path();
    final double ellipseA = tx.abs().clamp(1.0, r);
    final double k = 0.5523 * ellipseA;
    final double dir = waxing ? (tx >= 0 ? 1.0 : -1.0) : (tx <= 0 ? -1.0 : 1.0);

    path.moveTo(c.dx, c.dy - r);
    path.cubicTo(
      c.dx + dir * ellipseA, c.dy - k,
      c.dx + dir * ellipseA, c.dy + k,
      c.dx, c.dy + r,
    );
    return path;
  }

  double _getIllumination(double p) {
    // illum = 0.5*(1 - cos(2π*p))
    return (1.0 - cos(2 * pi * p)) / 2.0;
  }

  @override
  bool shouldRepaint(covariant MoonPainter old) =>
      old.phase != phase || old.glowIntensity != glowIntensity;
}
