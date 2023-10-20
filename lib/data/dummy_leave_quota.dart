import 'package:timesheet/models/leave_quota_model.dart';

final dummyLeaveQuota = [
  LeaveQuota(
    sickDay: 30,
    sickUsed: 1,
    sickRemain: 29,
    annualCarried: 0,
    annualDay: 2,
    totalAnnualDays: 2,
    annualUsed: 1.5,
    annualRemain: 0.5,
    personalDay: 6,
    personalUsed: 0,
    personalRemain: 6,
    specialLeaveDays: 0,
    withoutPayDays: 0,
    remark: '',
    periodWorkTimeY: 0,
    periodWorkTimeM: 10,
    periodWork: '',
    additionalLeaveDay: 0,
    renderYear: 2022,
    additionalAnnualLeaves: [
      AdditionalAnnualLeave(
        details: 'Pass Probation',
        numberOfDays: 2.0,
      )
    ],
  ),
  LeaveQuota(
      sickDay: 30,
      sickUsed: 1,
      sickRemain: 29,
      annualCarried: 0,
      annualDay: 6,
      totalAnnualDays: 6,
      annualUsed: 1.5,
      annualRemain: 4.5,
      personalDay: 6,
      personalUsed: 0,
      personalRemain: 6,
      specialLeaveDays: 0,
      withoutPayDays: 0,
      remark: '',
      periodWorkTimeY: 1,
      periodWorkTimeM: 10,
      periodWork: '',
      additionalLeaveDay: 0,
      renderYear: 2023),
  LeaveQuota(
    sickDay: 30,
    sickUsed: 1,
    sickRemain: 29,
    annualCarried: 0,
    annualDay: 5,
    totalAnnualDays: 5,
    annualUsed: 1.5,
    annualRemain: 5.5,
    personalDay: 6,
    personalUsed: 0,
    personalRemain: 6,
    specialLeaveDays: 0,
    withoutPayDays: 0,
    remark: '',
    periodWorkTimeY: 2,
    periodWorkTimeM: 10,
    periodWork: '',
    additionalLeaveDay: 0,
    renderYear: 2024,
    additionalAnnualLeaves: [
      AdditionalAnnualLeave(
        details: 'Pass Probation',
        numberOfDays: 2.0,
      ),
      AdditionalAnnualLeave(
        details: 'Half Year',
        numberOfDays: 0.5,
      ),
    ],
  )
];
