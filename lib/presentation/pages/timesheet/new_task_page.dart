import 'dart:math';

import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/data/datasources/dummies/dummy_select_issue.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/presentation/pages/timesheet/select_issue_page.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_list_notifier.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/utils/const.dart';
import 'package:timesheet/widgets/common/save_button.dart';
import 'package:timesheet/widgets/common/short_cancel_button.dart';

class NewTaskPage extends ConsumerStatefulWidget {
  const NewTaskPage({super.key, required this.choosedDate});
  final DateTime choosedDate;

  @override
  ConsumerState<NewTaskPage> createState() => _NewTaskState();
}

class _NewTaskState extends ConsumerState<NewTaskPage> {
  final _formKey = GlobalKey<FormState>();

  SelectIssueEntity? _issueEntity;
  String _taskDetail = '';
  DateTime? _taskDate;
  String _hour = '0';
  String _minute = '00';
  late Duration _taskDuration;

  //int _selectHours = 1;

  DateTime? _selectedDate;

  void _save() {
    _formKey.currentState!.save();
    //TODO: Below dummy for test, delete later.
    _issueEntity = dummySelectIssue[Random().nextInt(6)];
    _taskDate = _selectedDate?.copyWith(
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
        isUtc: true);
    _taskDuration =
        Duration(hours: int.parse(_hour), minutes: int.parse(_minute));
    TaskEntity taskEntity = TaskEntity(
        dayOfWeek: DateFormat('EEEE').format(_taskDate!),
        issue: _issueEntity!,
        taskDetail: _taskDetail,
        taskDate: _taskDate ??= DateTime.now(),
        duration: _taskDuration);
    final TaskListNotifier taskListNotifier =
        ref.read(taskListProvider.provider.notifier);
    taskListNotifier.addTask(taskEntity);
    final EventEmitter events = ref.watch(timesheetEventProvider.provider);
    events.emit(kTimesheetRebuild, taskEntity.taskDate);
    Navigator.of(context).pop();
  }

  void _issue() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) =>
              SelectIssuePage(selectIssueModels: dummySelectIssue)),
    );
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    _selectedDate = widget.choosedDate;
    return Scaffold(
      appBar: AppBar(
        title: const Text('New task'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Row(
                  children: [
                    Text('Project code'),
                  ],
                ),
                const SizedBox(height: 15),
                const Divider(),
                Row(
                  children: [
                    const Text('Issue'),
                    const Text(
                      '*',
                      style: kRequiredTextStyle,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: _issue,
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Text(
                      'Task details',
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextFormField(
                    minLines: 3,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onSaved: (value) => _taskDetail = value ??= '',
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text('Date'),
                    const Text(
                      '*',
                      style: kRequiredTextStyle,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _selectedDate == null
                                ? ''
                                : formatter.format(_selectedDate!),
                          ),
                          IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(
                              Icons.calendar_month,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(),
                const SizedBox(height: 20),
                Row(children: [
                  const Text('Usage time'),
                  const Text(
                    '*',
                    style: kRequiredTextStyle,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              hintText: 'HH',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            onSaved: (value) => _hour = value ??= '00',
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(':'),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              hintText: 'MM',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            onSaved: (value) => _minute = value ??= '00',
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 200),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Cancel Button
                    ShortCancelButton(onTap: () => Navigator.pop(context)),
                    const SizedBox(width: 15),
                    // Save Button
                    SaveButton(
                      onTap: _save,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
