import 'package:intl/intl.dart';

class TimeHelper {
  String get getRequestTime => '${DateFormat('HH:mm').format(DateTime.now())} ${DateTime.now().timeZoneName}.';
  String get getTimeZoneName => DateTime.now().timeZoneName;

  String intToTimeLeft(int value) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();

    String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

    String result = "$minuteLeft : $secondsLeft";

    return result;
  }
}

final timeHelper = TimeHelper();
