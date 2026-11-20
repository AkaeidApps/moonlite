import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

class MoonlightHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onBackPressed;

  const MoonlightHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (onBackPressed != null) ...[
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.moonlight, size: 20),
                  onPressed: onBackPressed,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 12),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.heading1(color: AppColors.textPrimary),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: AppTypography.bodySmall(color: AppColors.textSecondary),
                    ),
                  ],
                ],
              ),
            ],
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
