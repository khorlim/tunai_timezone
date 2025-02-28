import 'package:timezone/timezone.dart' as tz;
import 'package:tunai_timezone/src/tunai_timezone.dart';

extension TunaiTimeZoneDateTimeExtension on DateTime {
  DateTime truncateToDayWithTz() {
    if (this is tz.TZDateTime) {
      return tz.TZDateTime(
        (this as tz.TZDateTime).location,
        year,
        month,
        day,
      );
    }
    return DateTime(year, month, day);
  }

  DateTime copyWithTz({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
    String? timezoneName,
    tz.Location? location,
  }) {
    if (this is tz.TZDateTime && location == null && timezoneName == null) {
      return tz.TZDateTime(
        (this as tz.TZDateTime).location,
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

    return tz.TZDateTime(
      location ?? timezoneName?.toTzLocation() ?? TunaiTimezone.location,
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

  DateTime toTz({tz.Location? location, String? timezoneName}) {
    return tz.TZDateTime.from(
      this,
      location ?? timezoneName?.toTzLocation() ?? TunaiTimezone.location,
    );
  }
}

extension TunaiTimeZoneStringExtension on String {
  tz.Location toTzLocation() {
    return tz.getLocation(this);
  }
}
