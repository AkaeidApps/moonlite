import 'package:get/get.dart';
import '../../core/utils/astronomy_calculator.dart';
import '../../data/repositories/moon_repository.dart';
import '../../services/location_service.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

class AiAssistantController extends GetxController {
  final messages = <ChatMessage>[].obs;
  final isTyping = false.obs;
  final MoonRepository _moonRepo = MoonRepository();
  final LocationService _locationService = Get.find<LocationService>();

  @override
  void onInit() {
    super.onInit();
    messages.add(
      ChatMessage(
        text: "Greetings, stargazer! I am Luna AI, your personal astronomy and lunar intelligence assistant. How can I assist your observation tonight?",
        isUser: false,
        timestamp: DateTime.now(),
      ),
    );
  }

  void sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final userMsg = text.trim();
    messages.add(ChatMessage(text: userMsg, isUser: true, timestamp: DateTime.now()));
    isTyping.value = true;

    await Future.delayed(const Duration(milliseconds: 1200));

    final aiReply = _generateSmartResponse(userMsg);
    messages.add(ChatMessage(text: aiReply, isUser: false, timestamp: DateTime.now()));
    isTyping.value = false;
  }

  String _generateSmartResponse(String query) {
    final now = DateTime.now();
    final phase = AstronomyCalculator.getMoonPhase(now);
    final phaseName = AstronomyCalculator.getPhaseName(phase);
    final illumination = AstronomyCalculator.getIllumination(phase);
    final age = AstronomyCalculator.getMoonAge(phase);
    final city = _locationService.currentCity.value;

    final q = query.toLowerCase();

    if (q.contains('full moon') || q.contains('next full')) {
      return "The next Full Moon approaches in approximately ${(29.53 - age).toStringAsFixed(1)} days. Currently, the Moon is in its $phaseName phase with ${illumination.toStringAsFixed(1)}% illumination visible from $city.";
    } else if (q.contains('photo') || q.contains('camera') || q.contains('picture') || q.contains('shoot')) {
      return "For astrophotography of the $phaseName: Best results occur during golden hour or twilight when earthshine balances lunar brightness. Use a telephoto lens (200mm+), low ISO (100-400), and bracket your exposures to capture crater details without blowout!";
    } else if (q.contains('phase') || q.contains('today') || q.contains('current')) {
      return "Today in $city, the Moon is currently $phaseName (${illumination.toStringAsFixed(1)}% illuminated, Moon age: ${age.toStringAsFixed(1)} days). Altitude and azimuth shift dynamically based on your GPS coordinates.";
    } else if (q.contains('eclipse') || q.contains('solar') || q.contains('lunar eclipse')) {
      return "Eclipse prediction algorithms indicate upcoming lunar and solar eclipses are tracked in our Eclipse Tracker module. Check the Eclipse Tracker tab for precise global visibility maps and countdown timers!";
    } else if (q.contains('tide') || q.contains('ocean') || q.contains('surf')) {
      return "During ${phaseName}, gravitational forces from the Moon and Sun align (or oppose), creating spring tides with higher highs and lower lows. Perfect time for coastal exploration or surfing!";
    } else {
      return "As your lunar AI companion observing from $city, I calculate that the Moon is at phase $phaseName (${illumination.toStringAsFixed(1)}% illumination). Feel free to ask about astrophotography planning, eclipse schedules, moon positions, or celestial folklore!";
    }
  }
}
