import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class EmployeeEntity extends Equatable {
  EmployeeEntity(
      {required this.firstName,
      this.lastName,
      required this.nickname,
      required this.employeeStartDate,
      required this.position})
      : actualWorkPeriod = DateTime.now().difference(employeeStartDate);
  String firstName;
  String? lastName;
  String nickname;
  DateTime employeeStartDate;
  Duration actualWorkPeriod;
  String position;

  String get avatarText {
    String displayText = firstName[0].toUpperCase();
    if (lastName != null) {
      displayText += lastName![0].toUpperCase();
    }
    return displayText;
  }

  @override
  List<Object> get props => [firstName, nickname];
}
