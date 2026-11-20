import 'package:get/get.dart';
import 'app_routes.dart';
import '../../modules/splash/splash_view.dart';
import '../../modules/splash/splash_controller.dart';
import '../../modules/onboarding/onboarding_view.dart';
import '../../modules/onboarding/onboarding_controller.dart';
import '../../modules/location_setup/location_setup_view.dart';
import '../../modules/location_setup/location_setup_controller.dart';
import '../../modules/main_shell/main_shell_view.dart';
import '../../modules/main_shell/main_shell_controller.dart';
import '../../modules/explorer/moon_explorer_view.dart';
import '../../modules/explorer/moon_explorer_controller.dart';
import '../../modules/compass/moon_compass_view.dart';
import '../../modules/compass/moon_compass_controller.dart';
import '../../modules/finder_ar/moon_finder_ar_view.dart';
import '../../modules/position_map/moon_position_map_view.dart';
import '../../modules/eclipse/eclipse_tracker_view.dart';
import '../../modules/traditions/moon_traditions_view.dart';
import '../../modules/traditions/moon_traditions_controller.dart';
import '../../modules/traditions/moon_tradition_detail_view.dart';
import '../../modules/astronomy_events/astronomy_events_view.dart';
import '../../modules/photography/photography_planner_view.dart';
import '../../modules/weather/weather_visibility_view.dart';
import '../../modules/favorites/favorites_view.dart';
import '../../modules/notifications/notifications_view.dart';
import '../../modules/widgets_screen/widgets_setup_view.dart';
import '../../modules/profile/profile_view.dart';
import '../../modules/profile/profile_controller.dart';
import '../../modules/settings/settings_view.dart';
import '../../modules/pro/moonlite_pro_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: BindingsBuilder(() {
        // Controller is put inside SplashView.build() — no duplicate binding needed
      }),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),
    ),
    GetPage(
      name: AppRoutes.locationSetup,
      page: () => const LocationSetupView(),
      binding: BindingsBuilder(() {
        Get.put(LocationSetupController());
      }),
    ),
    GetPage(
      name: AppRoutes.mainShell,
      page: () => const MainShellView(),
      binding: BindingsBuilder(() {
        Get.put(MainShellController());
      }),
    ),
    GetPage(
      name: AppRoutes.moonExplorer,
      page: () => const MoonExplorerView(),
      binding: BindingsBuilder(() {
        Get.put(MoonExplorerController());
      }),
    ),
    GetPage(
      name: AppRoutes.moonCompass,
      page: () => const MoonCompassView(),
      binding: BindingsBuilder(() {
        Get.put(MoonCompassController());
      }),
    ),
    GetPage(name: AppRoutes.moonFinderAr, page: () => const MoonFinderArView()),
    GetPage(name: AppRoutes.moonPositionMap, page: () => const MoonPositionMapView()),
    GetPage(name: AppRoutes.eclipseTracker, page: () => const EclipseTrackerView()),
    GetPage(
      name: AppRoutes.moonTraditions,
      page: () => const MoonTraditionsView(),
      binding: BindingsBuilder(() {
        Get.put(MoonTraditionsController());
      }),
    ),
    GetPage(name: AppRoutes.moonTraditionDetail, page: () => const MoonTraditionDetailView()),
    GetPage(name: AppRoutes.astronomyEvents, page: () => const AstronomyEventsView()),
    GetPage(name: AppRoutes.photographyPlanner, page: () => const PhotographyPlannerView()),
    GetPage(name: AppRoutes.weatherVisibility, page: () => const WeatherVisibilityView()),
    GetPage(name: AppRoutes.favorites, page: () => const FavoritesView()),
    GetPage(name: AppRoutes.notifications, page: () => const NotificationsView()),
    GetPage(name: AppRoutes.widgetsSetup, page: () => const WidgetsSetupView()),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: BindingsBuilder(() {
        Get.put(ProfileController());
      }),
    ),
    GetPage(name: AppRoutes.settings, page: () => const SettingsView()),
    GetPage(name: AppRoutes.moonlitePro, page: () => const MoonliteProView()),
  ];
}
