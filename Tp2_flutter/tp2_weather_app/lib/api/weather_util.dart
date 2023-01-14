import 'package:intl/intl.dart';

class Util {
  static String getFormatDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d').format(dateTime);
  }

  static String TrouveIcon(String name, bool type) {
    if (type) {
      switch (name) {
        case "Clouds":
          return "assets/sun_1.png";
        case "Rain":
          return "assets/rain_1.png";
        case "Bruine":
          return "assets/rain_1.png";
        case "Orage":
          return "assets/th_1.png";
        case "Snow":
          return "assets/img_1.png";
        default:
          return "assets/sun_1.png";
      }
    } else {
      switch (name) {
        case "Clouds":
          return "assets/sun_2.png";
        case "Rain":
          return "assets/rain_2.png";
        case "Bruine":
          return "assets/rain_2.png";
        case "Orage":
          return "assets/th_2.png";
        case "Snow":
          return "assets/img_2d.png";
        default:
          return "assets/sun_2.png";
      }
    }
  }
}
