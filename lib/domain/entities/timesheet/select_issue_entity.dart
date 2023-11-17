import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SelectIssueEntity extends Equatable {
  final String id;
  String clientCode;
  String projectCode;
  String issueNo;
  String title;
  String status;
  IssuePriority priority;

  SelectIssueEntity({
    required this.id,
    required this.clientCode,
    required this.projectCode,
    required this.issueNo,
    required this.title,
    required this.status,
    this.priority = IssuePriority.low,
  });
  
  @override
  List<Object?> get props => [id];
}

enum IssuePriority{
  critital,
  high,
  medium,
  low
}
