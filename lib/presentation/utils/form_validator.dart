class FormValidator {
  static String? validatedEmpty(
      {required String? value, required String validatedText}) {
    if (value == null || value.trim().isEmpty) {
      return validatedText;
    }
    return null;
  }
}
