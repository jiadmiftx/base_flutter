import 'package:intl/intl.dart';
import 'package:moment_dart/moment_dart.dart';

class DateHelper {
  String formmateSlashString(String value) {
    String result = value;
    try {
      result = value.replaceAll('-', ' / ');
    } catch (e) {
      result = value;
    }

    return result;
  }

  DateTime formmateSlashDate(String value) {
    DateTime result;
    try {
      result = DateTime.parse(value.split('-').reversed.join());
    } catch (e) {
      result = DateTime.now();
    }

    return result;
  }

  static DateTime formattedDateFromServer(String value) {
    DateTime result;
    try {
      final List<String> splitData = value.split('-');
      result = DateTime(int.parse(splitData.first), int.parse(splitData[1]), int.parse(splitData.last));
    } catch (e) {
      result = DateTime.now();
    }

    return result;
  }

  String formattedDateStringSlash(String value) {
    String result = '';
    try {
      DateTime _formmater = DateTime.parse(value.split(' / ').reversed.join());
      result = DateFormat('dd / MM / yyyy').format(_formmater);
    } catch (e) {
      result;
    }

    return result;
  }

  String formmateServerSlashWithSpaceDate(String value) {
    String result = '';
    try {
      DateTime _formmater = DateTime.parse(value.split(' / ').reversed.join());
      result = DateFormat('yyyy-MM-dd').format(_formmater);
    } catch (e) {
      result;
    }

    return result;
  }

  String formatDateddMMMMyyyy(DateTime? value) {
    String result = '';
    try {
      if (value != null) {
        result = DateFormat('dd MMMM yyyy').format(value);
      }
    } catch (e) {
      result;
    }

    return result;
  }

  static String formateDateToString(DateTime value) {
    String result = '';
    try {
      result = DateFormat("yyyy-MM-dd").format(value);
    } catch (e) {
      result;
    }
    return result;
  }

  static String formatDateyyyyyMMMMddGGG(DateTime value) {
    String result = '';
    try {
      result = DateFormat("dd MMM yyyy HH:mm").format(value);
    } catch (e) {
      result;
    }
    return result;
  }

  static int getCountYear(DateTime value) {
    try {
      return (((DateTime.now().difference(value).inDays / 30).floor() / 12).floor());
    } catch (e) {
      return 0;
    }
  }

  static int getCountMonth(DateTime value) {
    try {
      var y1 = (DateTime.now().difference(value).inDays / 30).floor();
      return y1;
    } catch (e) {
      return 0;
    }
  }

  static int getCountDay(DateTime value) {
    try {
      var y1 = (DateTime.now().difference(value).inHours / 24).floor();
      return y1;
    } catch (e) {
      return 0;
    }
  }

  static bool isSunday(DateTime value) {
    try {
      return value.weekday == DateTime.sunday;
    } catch (e) {
      return false;
    }
  }

  static String now() {
    try {
      return DateFormat("yyyyMMdd hh:mm:ss").format(DateTime.now());
    } catch (e) {
      return '';
    }
  }

  static String? parseDate(String date) {
    try {
      final _temp = DateTime.parse(date).toLocal();
      final _date = DateFormat('EEEE, d MMMM yyyy').format(_temp);
      return _date;
    } catch (e) {
      return null;
    }
  }

  static DateTime formatDateTimeUtc(String date) {
    try {
      final result = DateTime.parse(date);
      return result;
    } catch (e) {
      return DateTime.now().toUtc();
    }
  }

  static DateTime formatDateTime(String date) {
    try {
      final result = DateTime.parse(date);
      return result;
    } catch (e) {
      return DateTime.now();
    }
  }

  static String parseToUtcNow() {
    String _value = "";
    try {
      _value = DateTime.now().toUtc().toString().replaceAll(' ', 'T');
    } catch (e) {
      _value = '';
    }
    return _value;
  }

  static String parseToRFC3339(DateTime dateTime) {
    try {
      return dateTime.toMoment().format('YYYY-MM-DDTHH:mm:ssZ');
    } catch (_) {
      return '';
    }
  }

  static String parseToRFCNow() {
    String _value = "";
    try {
      _value = parseToRFC3339(DateTime.now());
    } catch (e) {
      _value = '';
    }
    return _value;
  }

  static List<String> getSixMonthAgoFromNow() {
    List<String> resultList = [];

    try {
      DateTime now = DateTime.now();

      for (int i = 0; i <= 6; i++) {
        DateTime sixMonthsAgo = DateTime(now.year, now.month - i, now.day, now.hour, now.minute, now.second);
        String formattedMonth = DateFormat.MMM().format(sixMonthsAgo);
        resultList.add(formattedMonth);
      }

      return resultList;
    } catch (e) {
      return resultList;
    }
  }

  static String graphStartDateDays() {
    final _value = parseToRFC3339(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0, 0, 0));
    return _value;
  }

  static String graphEndDateDays() {
    final _value = parseToRFC3339(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59, 59, 0, 0));
    return _value;
  }

  static String graphStartDateWeeks() {
    final _now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0, 0, 0);
    final _value = (_now.weekday - 1);
    final _tempRangeThisWeek = parseToRFC3339(_now.subtract(Duration(days: _value)));
    return _tempRangeThisWeek;
  }

  static String graphEndDateWeeks() {
    final _now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59, 59, 59, 0);
    final _value = (_now.weekday - 1);
    final _tempRangeThisWeek = parseToRFC3339(_now.subtract(Duration(days: _value)).add(const Duration(days: 6)));
    return _tempRangeThisWeek;
  }

  static String graphStartMonth() {
    final _value = parseToRFC3339(DateTime(DateTime.now().year, DateTime.now().month, 1, 0, 0, 0, 0, 0));
    return _value;
  }

  static String graphEndMonth() {
    final _value = parseToRFC3339(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().lastDayOfMonth, 0, 0, 0, 0, 0));
    return _value;
  }

  static String graphStartSixMonth() {
    final _value = parseToRFC3339(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0, 0, 0).subtract(const Duration(days: 180)));
    return _value;
  }

  static double graphInHour(String compareDate) {
    double _result = 0.0;
    try {
      _result = formatDateTime(compareDate).toLocal().hour % 24;
      return _result;
    } catch (e) {
      return _result;
    }
  }

  static double graphInDay(String compareDate) {
    double _result = 0.0;
    Iterable<String> _daysOfWeek = [
      'sunday',
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
    ];

    try {
      final _tempResult = formatDateTime(compareDate).toLocal().weekday;
      switch (_daysOfWeek.elementAt(_tempResult == 7 ? 0 : _tempResult)) {
        case 'monday':
          _result = 4;
          break;

        case 'tuesday':
          _result = 8;
          break;

        case 'wednesday':
          _result = 12;
          break;

        case 'thursday':
          _result = 16;
          break;

        case 'friday':
          _result = 20;
          break;

        case 'saturday':
          _result = 24;
          break;

        case 'sunday':
          _result = 28;
          break;

        default:
      }
      return _result;
    } catch (e) {
      return _result;
    }
  }

  static double graphInMonth(String compareDate) {
    double _result = 0.0;
    try {
      _result = double.parse((formatDateTime(compareDate).toLocal().day).toString());
      return _result;
    } catch (e) {
      return _result;
    }
  }

  static double graphInSixMonth(String compareDate, List<String> sixMonth) {
    double _result = 0.0;
    try {
      final _temp = DateFormat.MMM().format(formatDateTime(compareDate));
      final _index = sixMonth.indexOf(_temp);
      switch (_index) {
        case 6:
          _result = 2.0;
          break;

        case 5:
          _result = 6.0;
          break;

        case 4:
          _result = 10.0;
          break;

        case 3:
          _result = 14.0;
          break;

        case 2:
          _result = 18.0;
          break;

        case 1:
          _result = 22.0;
          break;

        case 0:
          _result = 26.0;
          break;

        default:
      }
      return _result;
    } catch (e) {
      return _result;
    }
  }
}

extension DateTimeExtension on DateTime {
  int get lastDayOfMonth => DateTime(year, month + 1, 0).day;

  DateTime get lastDateOfMonth => DateTime(year, month + 1, 0);
}
