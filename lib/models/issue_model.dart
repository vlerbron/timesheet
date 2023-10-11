class IssueModel {
  final String client;
  final String project;
  final String issueNo; //key
  final String title;
  final String status;

  IssueModel(
      {required this.client,
      required this.project,
      required this.issueNo,
      required this.title,
      required this.status});
}
