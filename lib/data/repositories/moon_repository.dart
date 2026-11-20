import '../../core/utils/astronomy_calculator.dart';
import '../models/moon_data_model.dart';
import '../models/lunar_event_model.dart';
import '../models/moon_tradition_model.dart';
import '../models/eclipse_model.dart';

class MoonRepository {
  MoonDataModel getMoonDataForDate(DateTime date, double lat, double lon) {
    final phase = AstronomyCalculator.getMoonPhase(date);
    final illumination = AstronomyCalculator.getIllumination(phase);
    final age = AstronomyCalculator.getMoonAge(phase);
    final phaseName = AstronomyCalculator.getPhaseName(phase);
    final moonrise = AstronomyCalculator.getMoonriseTime(phase);
    final moonset = AstronomyCalculator.getMoonsetTime(phase);
    final pos = AstronomyCalculator.getMoonPosition(date, lat, lon);

    return MoonDataModel(
      date: date,
      phase: phase,
      phaseName: phaseName,
      illumination: illumination,
      age: age,
      moonrise: moonrise,
      moonset: moonset,
      altitude: pos['altitude']!,
      azimuth: pos['azimuth']!,
    );
  }

  List<LunarEventModel> getUpcomingEvents() {
    return [
      LunarEventModel(
        title: 'Super Full Moon',
        description: 'The Moon will be closer to Earth, appearing larger and brighter than usual.',
        date: DateTime.now().add(const Duration(days: 4)),
        category: 'Supermoon',
        daysUntil: 4,
      ),
      LunarEventModel(
        title: 'Total Lunar Eclipse',
        description: 'Earth comes between the Sun and the Moon, casting a spectacular crimson shadow.',
        date: DateTime.now().add(const Duration(days: 12)),
        category: 'Eclipse',
        daysUntil: 12,
      ),
      LunarEventModel(
        title: 'First Quarter Moon',
        description: 'Half of the lunar disc is illuminated, ideal for telescope observation.',
        date: DateTime.now().add(const Duration(days: 7)),
        category: 'Phase',
        daysUntil: 7,
      ),
      LunarEventModel(
        title: 'Geminids Meteor Shower Peak',
        description: 'One of the best meteor showers of the year, coinciding with favorable moonlight.',
        date: DateTime.now().add(const Duration(days: 19)),
        category: 'Meteor Shower',
        daysUntil: 19,
      ),
    ];
  }

  List<EclipseModel> getEclipses() {
    return [
      EclipseModel(
        title: 'Total Lunar Eclipse',
        type: 'Total Lunar',
        date: DateTime.now().add(const Duration(days: 12)),
        visibility: 'North America, Pacific, Asia',
        duration: '1h 25m',
        description: 'A breathtaking Blood Moon eclipse visible across nocturnal skies.',
      ),
      EclipseModel(
        title: 'Partial Solar Eclipse',
        type: 'Partial Solar',
        date: DateTime.now().add(const Duration(days: 45)),
        visibility: 'Europe, Northern Africa, Western Asia',
        duration: '2h 10m',
        description: 'The Moon passes in front of the Sun, creating a partial crescent solar silhouette.',
      ),
    ];
  }

  List<MoonTraditionModel> getTraditions() {
    return [
      MoonTraditionModel(
        name: 'Wolf Moon',
        month: 'January',
        subtitle: 'The Cold Midnight Howl',
        description: 'Named after packs of wolves howling hungrily outside Native American villages amid deep winter snows.',
        history: 'Originating from Algonquian and European folklore, January’s full moon represents resilience and endurance in the freezing dark.',
        culturalMeaning: 'Symbolizes spiritual awakening, inner strength, and clearing pathways for the new year.',
        traditions: 'Lighting hearth fires, setting intentions for the year ahead, and night sky meditation.',
      ),
      MoonTraditionModel(
        name: 'Snow Moon',
        month: 'February',
        subtitle: 'Deep Winter Frost',
        description: 'Marking the heaviest snowfalls of the North American winter.',
        history: 'Tribes tracked deep snow accumulations that made hunting extremely difficult, relying on stored provisions.',
        culturalMeaning: 'Reflection, patience, and purification.',
        traditions: 'Herbal tea rituals and indoor storytelling.',
      ),
      MoonTraditionModel(
        name: 'Pink Moon',
        month: 'April',
        subtitle: 'Spring Wildflowers',
        description: 'Named after wild ground phlox blooming vibrantly across early spring meadows.',
        history: 'Signaled the awakening of nature and the return of gentle warmth after harsh winters.',
        culturalMeaning: 'Renewal, rebirth, and blossoming new beginnings.',
        traditions: 'Planting seeds under moonlight and spring cleaning.',
      ),
      MoonTraditionModel(
        name: 'Harvest Moon',
        month: 'September',
        subtitle: 'The Farmer\'s Extended Glow',
        description: 'The full moon occurring closest to the autumn equinox, providing bright light well into the night.',
        history: 'Allowed farmers to harvest crops late into the evening by the brilliant illumination of the moon.',
        culturalMeaning: 'Gratitude for abundance and gathering with community.',
        traditions: 'Harvest feasts and outdoor night celebrations.',
      ),
    ];
  }
}
