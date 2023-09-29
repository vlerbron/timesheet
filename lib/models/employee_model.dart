class Employee {
  Employee(
      {required this.firstName,
      this.lastName,
      required this.nickname,
      required this.employeeStartDate})
      : actualWorkPeriod = DateTime.now().difference(employeeStartDate);
  String firstName;
  String? lastName;
  String nickname;
  DateTime employeeStartDate;
  Duration actualWorkPeriod;

  String get avatarText {
    String displayText = firstName[0].toUpperCase();
    if (lastName != null) {
      displayText += lastName![0].toUpperCase();
    }
    return displayText;
  }
}
