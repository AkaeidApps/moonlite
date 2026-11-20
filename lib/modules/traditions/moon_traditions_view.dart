import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/global_moonlight_background.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'moon_traditions_controller.dart';
import '../../app/routes/app_routes.dart';

class MoonTraditionsView extends GetView<MoonTraditionsController> {
  const MoonTraditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MoonTraditionsController());

    return GlobalMoonlightBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              MoonlightHeader(
                title: 'Names & Traditions',
                subtitle: 'Ancient Lore & Cultural Significance',
                onBackPressed: () => Get.back(),
              ),
              const SizedBox(height: 24),
              ...controller.traditions.map((tradition) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GlassContainer(
                      onTap: () => Get.toNamed(AppRoutes.moonTraditionDetail, arguments: tradition),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(tradition.name, style: AppTypography.heading2(color: AppColors.gold)),
                              Text(tradition.month, style: AppTypography.bodySmall(color: AppColors.primary)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(tradition.subtitle, style: AppTypography.bodySmall(color: AppColors.textSecondary)),
                          const SizedBox(height: 12),
                          Text(tradition.description, style: AppTypography.body(color: AppColors.textPrimary)),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
