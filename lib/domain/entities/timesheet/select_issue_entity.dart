import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:timesheet/domain/leave/employee_entity.dart';

// ignore: must_be_immutable
class SelectIssueEntity extends Equatable {
  final String id;
  String clientCode;
  String projectCode;
  String issueNo;
  String title;
  String status;
  IssuePriority priority;
  final List<EmployeeEntity> responsedPersonList;

  SelectIssueEntity({
    required this.id,
    required this.clientCode,
    required this.projectCode,
    required this.issueNo,
    required this.title,
    required this.status,
    required this.responsedPersonList,
    this.priority = IssuePriority.low,
  });
  
  @override
  List<Object?> get props => [id];
}

enum IssuePriority{
  critital(Color(0xFFBD00FF)),
  high(Color(0xFFF54551)),
  medium(Color(0xFFFFB800)),
  low(Color(0xFF1E80B8));

  final Color color;

  const IssuePriority(this.color);
}
