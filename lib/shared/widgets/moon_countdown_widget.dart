import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'glass_container.dart';

class MoonCountdownWidget extends StatelessWidget {
  final String eventName;
  final int days;
  final int hours;
  final int minutes;

  const MoonCountdownWidget({
    Key? key,
    required this.eventName,
    required this.days,
    required this.hours,
    required this.minutes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NEXT $eventName',
                style: AppTypography.bodySmall(color: AppColors.primary),
              ),
              const SizedBox(height: 4),
              Text(
                eventName,
                style: AppTypography.heading2(),
              ),
            ],
          ),
          Row(
            children: [
              _timeBox('$days', 'DAYS'),
              const SizedBox(width: 8),
              _timeBox('$hours', 'HRS'),
              const SizedBox(width: 8),
              _timeBox('$minutes', 'MIN'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timeBox(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          Text(value, style: AppTypography.numbers(fontSize: 16, color: AppColors.textPrimary)),
          Text(label, style: const TextStyle(fontSize: 9, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
