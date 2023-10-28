import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_state.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:uuid/uuid.dart';

class TaskProvider extends StateNotifier<TaskState> {
  TaskProvider()
      : super(TaskState(
            taskStatus: TaskStatus.add,
            taskEntity: TaskEntity(
                id: '',
                dayOfWeek: kMonday,
                issue: SelectIssueEntity(
                    id: '',
                    clientCode: '',
                    projectCode: '',
                    issueNo: '',
                    title: '',
                    status: ''),
                taskDetail: '',
                taskDate: DateTime.now(),
                duration: const Duration())));

  void setNewTaskState(String dayOfWeek, DateTime taskDate) {
    state.taskStatus = TaskStatus.add;
    state.taskEntity = TaskEntity(
        id: const Uuid().v4(),
        dayOfWeek: dayOfWeek,
        issue: SelectIssueEntity(
            id: const Uuid().v4(),
            clientCode: '',
            projectCode: '',
            issueNo: '',
            title: '',
            status: ''),
        taskDetail: '',
        taskDate: taskDate,
        duration: const Duration());
  }

  void setEditTaskState(TaskEntity taskEntity) {
    state.taskStatus = TaskStatus.edit;
    state.taskEntity = taskEntity;
  }

  void setSelectedIssueEntity(SelectIssueEntity issue) {
    state.taskEntity!.issue = issue;
  }

  void setTaskDate(DateTime dateTime) {
    state.taskEntity!.taskDate = dateTime;
  }

  void setTaskDetail(String taskDetail) {
    state.taskEntity!.taskDetail = taskDetail;
  }

  void setTaskDuration(String hour, String minute) {
    late Duration taskDuration;
    try {
    taskDuration = Duration(
        hours: int.parse(hour == '' ? '0' : hour),
        minutes: int.parse(minute == '' ? '0' : minute));
      
    } catch (e) {
      taskDuration = const Duration();
    }
    state.taskEntity!.duration = taskDuration;
  }
}
