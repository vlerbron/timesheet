class LeaveQuotaEntity {
  double sickDay;
  double sickUsed = 0;
  double sickRemain = 0;
  double annualCarried = 0;
  double annualDay = 0;
  double totalAnnualDays = 0;
  double annualUsed = 0;
  double annualRemain = 0;
  double personalDay = 0;
  double personalUsed = 0;
  double personalRemain = 0;
  double specialLeaveDays = 0;
  double withoutPayDays = 0;
  String remark = '';
  int periodWorkTimeY = 0;
  int periodWorkTimeM = 0;
  String periodWork = '';
  double additionalLeaveDay = 0;
  bool calculateAnnualTopup = false;
  int renderYear;
  List<AdditionalAnnualLeave>? additionalAnnualLeaves;

  LeaveQuotaEntity({
    this.sickDay = 0,
    this.sickUsed = 0,
    this.sickRemain = 0,
    this.annualCarried = 0,
    this.annualDay = 0,
    this.totalAnnualDays = 0,
    this.annualUsed = 0,
    this.annualRemain = 0,
    this.personalDay = 0,
    this.personalUsed = 0,
    this.personalRemain = 0,
    this.specialLeaveDays = 0,
    this.withoutPayDays = 0,
    this.remark = '',
    this.periodWorkTimeY = 0,
    this.periodWorkTimeM = 0,
    this.periodWork = '',
    this.additionalLeaveDay = 0,
    this.calculateAnnualTopup = false,
    this.renderYear = 0,
    this.additionalAnnualLeaves,
  });
}

class AdditionalAnnualLeave {
  String details;
  double numberOfDays;

  AdditionalAnnualLeave({this.details = '', this.numberOfDays = 0});
}
