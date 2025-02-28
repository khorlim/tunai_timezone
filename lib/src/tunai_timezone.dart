import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:tunai_timezone/src/time_zone_name.dart';
import 'package:tunai_timezone/tunai_timezone.dart';

class TunaiTimezone {
  static String _timezoneName = TimezoneName.singapore;
  static tz.Location _location = tz.getLocation(_timezoneName);
  static tz.Location get location => _location;
  static void setTimezone(String timezoneName) {
    print('TunaiTimezone set timezone ($timezoneName)');
    try {
      _timezoneName = timezoneName;
      _location = tz.getLocation(timezoneName);
    } catch (e) {
      _timezoneName = TimezoneName.singapore;
      _location = tz.getLocation(_timezoneName);
      print('TunaiTimezone set timezone ($timezoneName) failed. $e');
    }
  }

  static void init() async {
    tz.initializeTimeZones();
  }

  static DateTime now({tz.Location? location}) {
    return DateTime.now().toTz(location: location);
  }
}
