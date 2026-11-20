import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static TextStyle heading1({Color color = AppColors.textPrimary}) {
    return GoogleFonts.outfit(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: color,
      letterSpacing: 0.5,
    );
  }

  static TextStyle heading2({Color color = AppColors.textPrimary}) {
    return GoogleFonts.outfit(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: color,
      letterSpacing: 0.3,
    );
  }

  static TextStyle heading3({Color color = AppColors.textPrimary}) {
    return GoogleFonts.outfit(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle body({Color color = AppColors.textPrimary}) {
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: color,
      height: 1.4,
    );
  }

  static TextStyle bodySmall({Color color = AppColors.textSecondary}) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: color,
      height: 1.3,
    );
  }

  static TextStyle numbers({Color color = AppColors.moonlight, double fontSize = 16}) {
    return GoogleFonts.outfit(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle astronomical({Color color = AppColors.moonlight, double fontSize = 36}) {
    return GoogleFonts.outfit(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: color,
      letterSpacing: 1.0,
    );
  }

  static TextStyle astronomic({Color color = AppColors.moonlight, double fontSize = 36}) {
    return astronomical(color: color, fontSize: fontSize);
  }
}
