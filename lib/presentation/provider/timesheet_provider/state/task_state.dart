import 'package:timesheet/domain/entities/timesheet/task_entity.dart';

enum TaskStatus {
  add,
  edit,
}

class TaskState {
  TaskStatus? taskStatus;
  TaskEntity? taskEntity;

  TaskState({
    this.taskStatus,
    this.taskEntity,
  });
}
