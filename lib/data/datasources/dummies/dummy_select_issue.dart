import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';
import 'package:timesheet/domain/leave/employee_entity.dart';
import 'package:uuid/uuid.dart';

List<SelectIssueEntity> dummySelectIssue = [
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN9',
    projectCode: 'PRESALES',
    issueNo: 'IS-130308-0003',
    title: '[AAS] Broker Insurance',
    status: 'Open',
    priority: IssuePriority.critital,
    responsedPersonList: [
      EmployeeEntity(
        firstName: 'Tavee',
        lastName: 'Manavathongchai',
        nickname: 'Vee',
        employeeCode: 'Emp023',
        username: 'veekobe',
        employeeStartDate: DateTime(2023, 1, 16),
        position: 'Front End Developer',
        imageUrl: 'assets/icons/icon-account-active.png'
      ),
      EmployeeEntity(
        firstName: 'Tavee2',
        lastName: 'Manavathongchai',
        nickname: 'Vee2',
        employeeCode: 'Emp024',
        username: 'veekobe2',
        employeeStartDate: DateTime(2023, 1, 17),
        position: 'Back End Developer',
        imageUrl: 'assets/icons/icon-date-active.png'
      ),
      EmployeeEntity(
        firstName: 'Tavee3',
        lastName: 'Manavathongchai',
        nickname: 'Vee3',
        employeeCode: 'Emp029',
        username: 'veekobe3',
        employeeStartDate: DateTime(2023, 1, 16),
        position: 'Front 3 End Developer',
        imageUrl: 'assets/icons/icon-doc-active.png'
      ),
    ],
  ),
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN2',
    projectCode: 'AIS',
    issueNo: 'IS-230308-0003',
    title: 'Available',
    status: 'Open',
    priority: IssuePriority.high,
    responsedPersonList: const [],
  ),
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN3',
    projectCode: 'PRESALES',
    issueNo: 'IS-330308-0003',
    title: 'Basketball',
    status: 'Open',
    priority: IssuePriority.low,
    responsedPersonList: [
      EmployeeEntity(
        firstName: 'Tavee',
        lastName: 'Manavathongchai',
        nickname: 'Vee',
        employeeCode: 'Emp023',
        username: 'veekobe',
        employeeStartDate: DateTime(2023, 1, 16),
        position: 'Front End Developer',
        imageUrl: 'assets/icons/icon-home-active.png'
      ),
      EmployeeEntity(
        firstName: 'Tavee2',
        lastName: 'Manavathongchai',
        nickname: 'Vee2',
        employeeCode: 'Emp024',
        username: 'veekobe2',
        employeeStartDate: DateTime(2023, 1, 17),
        position: 'Back End Developer',
        imageUrl: 'assets/icons/icon-sheet-active.png'
      ),
      EmployeeEntity(
        firstName: 'Tavee3',
        lastName: 'Manavathongchai',
        nickname: 'Vee3',
        employeeCode: 'Emp029',
        username: 'veekobe3',
        employeeStartDate: DateTime(2023, 1, 16),
        position: 'Front 3 End Developer',
        imageUrl: 'assets/icons/icon-sort.png'
      ),
    ],
  ),
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN4',
    projectCode: 'True',
    issueNo: 'IS-430308-0003',
    title: 'Drawing',
    status: 'Open',
    priority: IssuePriority.medium,
    responsedPersonList: const [],
  ),
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN5',
    projectCode: '3BB',
    issueNo: 'IS-530308-0003',
    title: 'Gaming',
    status: 'Open',
    priority: IssuePriority.critital,
    responsedPersonList: const [],
  ),
  SelectIssueEntity(
    id: const Uuid().v4(),
    clientCode: 'TBN6',
    projectCode: 'ABC',
    issueNo: 'IS-630308-0003',
    title: '[AAS] Swiming',
    status: 'Open',
    priority: IssuePriority.high,
    responsedPersonList: const [],
  ),
];
