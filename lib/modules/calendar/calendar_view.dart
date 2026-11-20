import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/lunar_calendar_widget.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CalendarController());

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 110),
        children: [
          const MoonlightHeader(
            title: 'Lunar Calendar',
            subtitle: 'Monthly Phases & Celestial Indicators',
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() => LunarCalendarWidget(
                  selectedDate: controller.selectedDate.value,
                  onDateSelected: controller.updateDate,
                )),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Selected Date Details', style: AppTypography.heading3()),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() {
              final data = controller.moonData.value;
              if (data == null) return const SizedBox.shrink();

              return GlassContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${data.date.day} / ${data.date.month} / ${data.date.year}',
                          style: AppTypography.heading2(color: AppColors.primary),
                        ),
                        Text(data.phaseName, style: AppTypography.body(color: AppColors.moonlight)),
                      ],
                    ),
                    const Divider(color: AppColors.cardBorder, height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Illumination', style: AppTypography.body(color: AppColors.textSecondary)),
                        Text('${data.illumination.toStringAsFixed(1)}%', style: AppTypography.numbers()),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Moon Age', style: AppTypography.body(color: AppColors.textSecondary)),
                        Text('${data.age.toStringAsFixed(1)} days', style: AppTypography.numbers()),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Moonrise / Moonset', style: AppTypography.body(color: AppColors.textSecondary)),
                        Text('${data.moonrise} - ${data.moonset}', style: AppTypography.numbers()),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
