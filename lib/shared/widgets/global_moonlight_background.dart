import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'star_field_background.dart';

class GlobalMoonlightBackground extends StatelessWidget {
  final Widget child;
  final bool showStars;

  const GlobalMoonlightBackground({
    Key? key,
    required this.child,
    this.showStars = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Deep midnight navy base & cinematic gradients
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF02050C),
                  AppColors.background,
                  AppColors.backgroundSecondary,
                ],
                stops: [0.0, 0.4, 1.0],
              ),
            ),
          ),

          // Subtle large moonlight glow at top right / center
          Positioned(
            top: -100,
            right: -50,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.18),
                    AppColors.primary.withOpacity(0.0),
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),

          // Secondary subtle purple atmosphere glow
          Positioned(
            bottom: -120,
            left: -80,
            child: Container(
              width: 380,
              height: 380,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.purple.withOpacity(0.10),
                    AppColors.purple.withOpacity(0.0),
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),

          // Animated Stars
          if (showStars) const Positioned.fill(child: StarFieldBackground(starCount: 50)),

          // Child content
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
