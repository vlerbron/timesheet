class FormValidator {
  static String? validatedEmpty(
      {required String? value, String validatedText = 'Enter!'}) {
    if (value == null || value.trim().isEmpty) {
      return validatedText;
    }
    return null;
  }

  static String? validatedTimeEmpty({
    required String? hour,
    required String? minute,
    required String validatedText,
    bool isHour = true,
  }) {
    var hourTmp = validatedEmpty(value: hour);
    var minuteTmp = validatedEmpty(value: minute);
    if (hourTmp != null && minuteTmp != null) return validatedText;
    if(isTimeEqualZero(hour: hour!, minute: minute!)) return validatedText;
    return null;
  }

  static bool isTimeEqualZero({required String hour, required String minute}) {
    try {
      String minuteTemp = minute.trim() == '' ? '0' : minute;
      String hourTmp = hour.trim() == '' ? '0' : hour;
      int hourInt = int.parse(hourTmp);
      int minuteInt = int.parse(minuteTemp);
      if (hourInt + minuteInt == 0) return true;
    } catch (error) {
      return false;
    }
    return false;
  }
}
