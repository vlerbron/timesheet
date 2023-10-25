import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';
import 'package:uuid/uuid.dart';

List<SelectIssueEntity> dummySelectIssue = [
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN1',
    projectCode: 'PRESALES',
    issueNo: 'IS-130308-0003',
    title: '[AAS] Broker Insurance',
    status: 'Open',
  ),
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN2',
    projectCode: 'AIS',
    issueNo: 'IS-230308-0003',
    title: 'Available',
    status: 'Open',
  ),
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN3',
    projectCode: 'DTAC',
    issueNo: 'IS-330308-0003',
    title: 'Basketball',
    status: 'Open',
  ),
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN4',
    projectCode: 'True',
    issueNo: 'IS-430308-0003',
    title: 'Drawing',
    status: 'Open',
  ),
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN5',
    projectCode: '3BB',
    issueNo: 'IS-530308-0003',
    title: 'Gaming',
    status: 'Open',
  ),
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN6',
    projectCode: 'ABC',
    issueNo: 'IS-630308-0003',
    title: '[AAS] Swiming',
    status: 'Open',
  ),
];
