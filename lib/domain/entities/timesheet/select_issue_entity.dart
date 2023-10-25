import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SelectIssueEntity extends Equatable {
  final String id;
  String clientCode;
  String projectCode;
  String issueNo;
  String title;
  String status;

  SelectIssueEntity({
    required this.id,
    required this.clientCode,
    required this.projectCode,
    required this.issueNo,
    required this.title,
    required this.status,
  });
  
  @override
  List<Object?> get props => [id];
}
