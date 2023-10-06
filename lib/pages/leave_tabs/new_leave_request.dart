import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/models/employee_model.dart';
import 'package:timesheet/models/leave_model.dart';
import 'package:timesheet/pages/leave_tabs/attachment_input.dart';
import 'package:timesheet/pages/leave_tabs/bottomsheet_input.dart';
import 'package:timesheet/pages/leave_tabs/checkbox_input.dart';
import 'package:timesheet/pages/leave_tabs/date_input.dart';
import 'package:timesheet/pages/leave_tabs/detail_input.dart';
import 'package:timesheet/providers/leave_request_provider.dart';
import 'package:timesheet/providers/leaves_provider.dart';
import 'package:timesheet/widgets/common/circle_grey_closepage_button.dart';
import 'package:timesheet/widgets/common/save_button.dart';
import 'package:timesheet/widgets/common/short_cancel_button.dart';

class NewLeaveRequest extends ConsumerStatefulWidget {
  const NewLeaveRequest({super.key});

  @override
  ConsumerState<NewLeaveRequest> createState() => _NewLeaveRequestState();
}

class _NewLeaveRequestState extends ConsumerState<NewLeaveRequest> {
  List<Widget> filePreviews = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController startDateCntroller = TextEditingController();
  final TextEditingController endDateCntroller = TextEditingController();
  final TextEditingController leaveHourController = TextEditingController();
  final TextEditingController leaveTypeController = TextEditingController();
  @override
  void dispose() {
    filePreviews.clear();
    startDateCntroller.dispose();
    endDateCntroller.dispose();
    leaveHourController.dispose();
    leaveTypeController.dispose();
    //clear state
    ref.invalidate(leaveRequestProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final leave = ref.watch(leaveRequestProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New request leave',
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [CircleGreyClosePageButton()],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              DateInput(
                title: 'Start date',
                controller: startDateCntroller,
                initDate: leave.startDate,
                onSelectedDate: (selectedDate) {
                  //if start date is after end date, change end date
                  if (selectedDate.isAfter(leave.endDate)) {
                    endDateCntroller.text =
                        DateFormat('dd/MM/yyyy').format(selectedDate);
                    ref
                        .read(leaveRequestProvider.notifier)
                        .onStartDateEndDateChange(selectedDate, selectedDate);
                  } else {
                    ref
                        .read(leaveRequestProvider.notifier)
                        .onStartDateChange(selectedDate);
                  }
                  //show validate message
                  // _formKey.currentState!.validate();
                },
                validator: _validateStartDate,
              ),
              DateInput(
                title: 'End date',
                controller: endDateCntroller,
                initDate: leave.endDate,
                onSelectedDate: (selectedDate) {
                  ref
                      .read(leaveRequestProvider.notifier)
                      .onEndDateChange(selectedDate);

                  // _formKey.currentState!.validate();
                },
                validator: _validateEndDate,
              ),
              BottomSheetInput(
                title: 'Leave type',
                controller: leaveTypeController,
                items: _getLeaveTypeItems(),
                validator: _validateLeaveType,
              ),
              Visibility(
                visible: leave.leaveType == LeaveTypes.annual,
                child: CheckboxInput(
                  title: 'Urgent',
                  value: leave.isUrgent!,
                  onChanged: ref
                      .read(leaveRequestProvider.notifier)
                      .onUrgentCheckboxChange,
                ),
              ),
              BottomSheetInput(
                title: 'Leave hour',
                controller: leaveHourController,
                items: _getLeaveHourItems(),
                validator: _validateLeaveHour,
              ),
              Visibility(
                visible: leave.leaveType != LeaveTypes.annual &&
                    leave.leaveType != null,
                child: DetailInput(
                  title: 'Task details',
                  onSubmitted: ref
                      .read(leaveRequestProvider.notifier)
                      .onTaskDetailChange,
                  validator: _validateTaskDetail,
                ),
              ),
              AttachmentInput(
                title: 'Attachment',
                filePreviews: filePreviews,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 246, 246, 246),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Text('Total leave days'),
                    const Spacer(),
                    Text(
                      '${leave.totalLeaveDays}',
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Spacer(),
              const Divider(),
              Row(
                children: [
                  const Spacer(),
                  ShortCancelButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  SaveButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        //TO BE REVISED: Stamp current user as employee
                        ref.read(leavesProvider.notifier).leaveAdded(
                              leave.copywith(
                                employee: Employee(
                                  firstName: 'Nuntuch',
                                  nickname: 'Nan',
                                  employeeStartDate: DateTime(2023, 01, 16),
                                ),
                              ),
                            );
                        // dummyLeaves.add(
                        //   leave.copywith(
                        //     employee: Employee(
                        //       firstName: 'Nuntuch',
                        //       nickname: 'Nan',
                        //       employeeStartDate: DateTime(2023, 01, 16),
                        //     ),
                        //   ),
                        // );
                        Navigator.pop(context);
                      }
                    },
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 12,
              )
            ]),
          ),
        ),
      ),
    );
  }

  String? _validateTaskDetail(details) {
    if (details == null || details == "") {
      return "Please fill in.";
    }
    return null;
  }

  String? _validateLeaveType(selectedLeaveType) {
    if (selectedLeaveType == "") {
      return "Please fill in.";
    }
    return null;
  }

  String? _validateLeaveHour(selectedLeaveHour) {
    if (selectedLeaveHour == "") {
      return "Please fill in.";
    } else {
      final leave = ref.read(leaveRequestProvider);
      if ((!leave.startDate.isAtSameMomentAs(leave.endDate) &&
          leave.leaveHour != LeaveHours.allday)) {
        return "Please use All Day.";
      }
    }
    return null;
  }

  String? _validateStartDate(selectedValue) {
    if (selectedValue == null) {
      return 'Please fill in.';
    } else {
      int day = int.parse(selectedValue.substring(0, 2));
      int month = int.parse(selectedValue.substring(3, 5));
      int year = int.parse(selectedValue.substring(6));
      DateTime selectedDate = DateTime(year, month, day);
      if (selectedDate.weekday > 5) {
        return 'Cannot request leave on holiday/weekend.';
      }
    }
    return null;
  }

  String? _validateEndDate(selectedValue) {
    if (selectedValue == null) {
      return 'Please fill in.';
    } else {
      int day = int.parse(selectedValue.substring(0, 2));
      int month = int.parse(selectedValue.substring(3, 5));
      int year = int.parse(selectedValue.substring(6));
      DateTime selectedDate = DateTime(year, month, day);

      day = int.parse(startDateCntroller.text.substring(0, 2));
      month = int.parse(startDateCntroller.text.substring(3, 5));
      year = int.parse(startDateCntroller.text.substring(6));
      DateTime newStartDate = DateTime(year, month, day);
      if (selectedDate.weekday > 5) {
        return 'Cannot request leave on holiday/weekend.';
      } else if (selectedDate.isBefore(newStartDate)) {
        return 'End date must be greater than the start date.';
      }
    }

    return null;
  }

  List<ListTile> _getLeaveTypeItems() {
    final List<ListTile> tileList = [];
    Leave leave = ref.read(leaveRequestProvider);
    if (leave.leaveType == null) {
      leaveTypeController.text = '';
    } else {
      leaveTypeController.text = getLeaveTypeDisplayText(leave.leaveType!);
    }

    for (var leaveType in LeaveTypes.values) {
      tileList.add(
        ListTile(
          title: Text(
            getLeaveTypeDisplayText(leaveType),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onTap: () {
            ref
                .read(leaveRequestProvider.notifier)
                .onLeaveTypeChange(leaveType);
            Navigator.pop(context);
          },
        ),
      );
    }
    return tileList;
  }

  List<ListTile> _getLeaveHourItems() {
    final List<ListTile> tileList = [];
    Leave leave = ref.read(leaveRequestProvider);
    leaveHourController.text =
        getLeaveHourDisplayText(leave.leaveHour ?? LeaveHours.allday);
    for (var leaveHour in LeaveHours.values) {
      tileList.add(
        ListTile(
          title: Text(
            getLeaveHourDisplayText(leaveHour),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onTap: () {
            ref
                .read(leaveRequestProvider.notifier)
                .onLeaveHourChange(leaveHour);
            Navigator.pop(context);
          },
        ),
      );
    }
    return tileList;
  }
}
