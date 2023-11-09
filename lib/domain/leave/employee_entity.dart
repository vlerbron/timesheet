import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class EmployeeEntity extends Equatable {
  EmployeeEntity(
      {required this.firstName,
      this.lastName,
      required this.nickname,
      required this.employeeCode,
      required this.username,
      required this.employeeStartDate,
      required this.position,
      this.leavePreApprovers,
      this.leaveApprovers,
      this.timesheetPreApprovers,
      this.timesheetApprovers,
      this.imageUrl})
      : actualWorkPeriod = DateTime.now().difference(employeeStartDate);

  String firstName;
  String? lastName;
  String nickname;
  String employeeCode;
  String username;
  DateTime employeeStartDate;
  Duration actualWorkPeriod;
  String position;
  List<EmployeeEntity>? leavePreApprovers;
  List<EmployeeEntity>? leaveApprovers;
  List<EmployeeEntity>? timesheetPreApprovers;
  List<EmployeeEntity>? timesheetApprovers;
  String? imageUrl;

  String get avatarText {
    String displayText = firstName[0].toUpperCase();
    if (lastName != null) {
      displayText += lastName![0].toUpperCase();
    }
    return displayText;
  }

  String get actualWorkPeriodString {
    final int years = actualWorkPeriod.inDays ~/ 365;
    final int months = (actualWorkPeriod.inDays - (years * 365)) ~/ 30;
    final int days = (actualWorkPeriod.inDays - (years * 365)) - (months * 30);
    return '${years == 0 ? '' : years == 1 ? '$years year ' : '$years years '}${months == 0 ? '' : months == 1 ? '$months month ' : '$months months '}${days == 0 ? '' : days == 1 ? '$days day' : '$days days'}';
  }

  EmployeeEntity copyWith(
      {String? firstName,
      String? lastName,
      String? nickname,
      String? employeeCode,
      String? username,
      DateTime? employeeStartDate,
      String? position,
      List<EmployeeEntity>? leavePreApprovers,
      List<EmployeeEntity>? leaveApprovers,
      List<EmployeeEntity>? timesheetPreApprovers,
      List<EmployeeEntity>? timesheetApprovers,
      String? imageUrl}) {
    return EmployeeEntity(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nickname: nickname ?? this.nickname,
        employeeCode: employeeCode ?? this.employeeCode,
        username: username ?? this.username,
        employeeStartDate: employeeStartDate ?? this.employeeStartDate,
        position: position ?? this.position,
        leavePreApprovers: leavePreApprovers ?? this.leavePreApprovers,
        leaveApprovers: leaveApprovers ?? this.leaveApprovers,
        timesheetPreApprovers:
            timesheetPreApprovers ?? this.timesheetPreApprovers,
        timesheetApprovers: timesheetApprovers ?? this.timesheetApprovers,
        imageUrl: imageUrl ?? this.imageUrl);
  }

  @override
  List<Object> get props => [firstName, nickname];
}
