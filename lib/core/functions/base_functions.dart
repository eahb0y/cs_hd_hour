import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';
class Functions{
  static String moneyFormatNoSum(num number) {
    String splitter = " ";
    final isNegative = number.isNegative;
    number = number.abs();
    String result = "0";
    result = intl.NumberFormat("#,##0", "ru_RU")
        .format(number)
        .split(",")
        .join(splitter);
    return isNegative ? "-$result" : result;
  }

  static int hexColor(String color){
    String newColor = '0xFF$color';
    newColor = newColor.replaceAll('#', '');
    int finalColor = int.parse(newColor);
    return finalColor;
  }
}