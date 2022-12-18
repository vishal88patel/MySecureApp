
import '../ConstantsFiles/string_constants.dart';

class CommonUtils {
  static String FormatCardNumber(number) {
    String test = number;
    String result = test.replaceRange(4, 12, '*' * 12);
    var ss = result.substring(0, 4) +
        " " +
        result.substring(5, 9) +
        " " +
        result.substring(10, 14) +
        " " +
        result.substring(16, result.length);
    return ss;
  }
}
