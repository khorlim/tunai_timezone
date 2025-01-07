import 'package:timezone/timezone.dart' as tz;
import 'package:tunai_timezone/src/tunai_timezone.dart';

extension TunaiTimeZoneDateTimeExtension on DateTime {
  DateTime copyWithTz({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return tz.TZDateTime(
      TunaiTimezone.location,
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime toTz() {
    return tz.TZDateTime.from(this, TunaiTimezone.location);
  }
}
