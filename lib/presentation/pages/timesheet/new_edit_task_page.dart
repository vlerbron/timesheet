import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/presentation/pages/timesheet/select_issue_page.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_state.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/task_list_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/task_provider.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/utils/date_time_mixin.dart';
import 'package:timesheet/presentation/utils/form_validator.dart';
import 'package:timesheet/presentation/widgets/common/button/save_button.dart';
import 'package:timesheet/presentation/widgets/common/button/short_cancel_button.dart';
import 'package:timesheet/provider_container.dart';

class NewEditTaskPage extends ConsumerStatefulWidget with DateTimeMixin {
  const NewEditTaskPage({super.key});

  @override
  ConsumerState<NewEditTaskPage> createState() => _NewEditTaskState();
}

class _NewEditTaskState extends ConsumerState<NewEditTaskPage>
    with DateTimeMixin {
  final _formKey = GlobalKey<FormState>();

  final _issueController = TextEditingController();
  final _dateController = TextEditingController();
  final _hourController = TextEditingController();
  final _minuteController = TextEditingController();
  final _taskDetailController = TextEditingController();

  TaskEntity? _taskEntity;
  SelectIssueEntity? _issueEntity;
  String _taskDetail = '';
  DateTime? _taskDate;
  String _hour = '';
  String _minute = '';
  late Duration _taskDuration;

  //int _selectHours = 1;

  DateTime? _selectedDate;

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    _taskDate = _selectedDate?.copyWith(
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
        isUtc: true);
    _taskDuration = Duration(
        hours: int.parse(_hour == '' ? '0' : _hour),
        minutes: int.parse(_minute == '' ? '0' : _minute));
    TaskEntity taskEntity = ref.watch(taskProvider).taskEntity!.copyWith();
    taskEntity.setTask(
        dayOfWeek: DateFormat('EEEE').format(_taskDate!),
        issue: _issueEntity!,
        taskDetail: _taskDetail,
        taskDate: _taskDate ??= DateTime.now().toUtc(),
        duration: _taskDuration);
    final TaskListProvider taskListNotifier =
        ref.read(taskListProvider.notifier);
    (ref.watch(taskProvider).taskStatus == TaskStatus.add)
        ? taskListNotifier.addTask(taskEntity)
        : taskListNotifier.editTask(taskEntity);

    final EventEmitter events = ref.watch(timesheetEventProvider);
    events.emit(TimesheetRebuildEvent.kTimesheetRebuild, taskEntity.taskDate);

    Navigator.of(context).pop();
  }

  void _issue() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => SelectIssuePage(
                fnCallBack: setStateCallBack,
              )),
    );
  }

  void _presentDatePicker(
      {required DateTime lastDate, required DateTime selectDate}) async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: lastDate,
    );
    if (pickedDate != null) {
      ref.read(taskProvider.notifier).setTaskDate(pickedDate);
      setStateCallBack();
    }
  }

  void setStateCallBack() {
    setState(() {
      _formKey.currentState!.save();
      final TaskProvider taskNotifier = ref.read(taskProvider.notifier);
      taskNotifier.setTaskDetail(_taskDetail);
      taskNotifier.setTaskDuration(_hour, _minute);

      _formKey.currentState?.reset();
      didChangeDependencies();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _taskEntity = ref.watch(taskProvider).taskEntity!;
    _issueEntity = _taskEntity!.issue;
    _issueController.text = _issueEntity!.projectCode;
    _selectedDate = _taskEntity!.taskDate;
    _dateController.text =
        _selectedDate == null ? '' : formatter.format(_selectedDate!);
    _hour = _taskEntity!.duration.inHours.toString();
    _minute = twoDigits(_taskEntity!.duration.inMinutes.remainder(60));
    if (FormValidator.isTimeEqualZero(hour: _hour, minute: _minute)) {
      _hour = '';
      _minute = '';
    }
    _hourController.text = _hour;
    _minuteController.text = _minute;
    _taskDetailController.text = _taskEntity!.taskDetail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((ref.watch(taskProvider).taskStatus == TaskStatus.add)
            ? 'New task'
            : 'Edit task'),
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
                Row(
                  children: [
                    const Text('Project code'),
                    const Spacer(),
                    Text(_issueEntity!.clientCode),
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
                          Expanded(
                            child: TextFormField(
                              controller: _issueController,
                              validator: (value) =>
                                  FormValidator.validatedEmpty(
                                      value: value,
                                      validatedText:
                                          'Please select project issue.'),
                              readOnly: true,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              textAlign: TextAlign.right,
                            ),
                          ),
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
                    controller: _taskDetailController,
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
                          Expanded(
                            child: TextFormField(
                              controller: _dateController,
                              readOnly: true,
                              validator: (value) =>
                                  FormValidator.validatedEmpty(
                                      value: value,
                                      validatedText: 'Please select date.'),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          IconButton(
                            onPressed: () => _presentDatePicker(
                                lastDate: findLastDateOfTheWeek(DateTime.now()),
                                selectDate: _taskEntity!.taskDate),
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
                            controller: _hourController,
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
                              errorStyle: const TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            onSaved: (value) => _hour = value ??= '00',
                            validator: (value) =>
                                FormValidator.validatedTimeEmpty(
                                    hour: value,
                                    minute: _minuteController.text,
                                    validatedText: 'Empty!'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(':'),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: TextFormField(
                            controller: _minuteController,
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
                              errorStyle: const TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            onSaved: (value) => _minute = value ??= '00',
                            validator: (value) =>
                                FormValidator.validatedTimeEmpty(
                                    hour: _hourController.text,
                                    minute: value,
                                    validatedText: 'Empty!'),
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
