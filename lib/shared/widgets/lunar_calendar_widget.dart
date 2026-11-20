import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'glass_container.dart';

class LunarCalendarWidget extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const LunarCalendarWidget({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simple 7-day strip or mini calendar grid
    return GlassContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${selectedDate.year} - Month View',
                style: AppTypography.heading3(),
              ),
              const Icon(Icons.calendar_month, color: AppColors.primary),
            ],
          ),
          const SizedBox(height: 16),
          // Days row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['M', 'T', 'W', 'T', 'F', 'S', 'S']
                .map((day) => Text(day, style: AppTypography.bodySmall(color: AppColors.textSecondary)))
                .toList(),
          ),
          const SizedBox(height: 12),
          // Grid of 30 days preview
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 31,
            itemBuilder: (context, index) {
              final day = index + 1;
              final isSelected = selectedDate.day == day;
              return GestureDetector(
                onTap: () {
                  final newDate = DateTime(selectedDate.year, selectedDate.month, day);
                  onDateSelected(newDate);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary.withOpacity(0.3) : AppColors.surfaceLight.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.cardBorder,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$day',
                      style: AppTypography.numbers(
                        color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
