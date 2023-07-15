part of 'task_bloc.dart';

class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  const AddTask({required this.task});
}

class UpdateTask extends TaskEvent {
  final Task task;

  const UpdateTask({
    required this.task,
  });
}

class DeleteTask extends TaskEvent {
  final Task task;

  const DeleteTask({required this.task});
}

class DeleteForever extends TaskEvent {
  final Task task;

  const DeleteForever({required this.task});
}

class FavouritTask extends TaskEvent {
  final Task task;

  const FavouritTask({
    required this.task,
  });
}

class EditTask extends TaskEvent {
  final Task oldtask;
  final Task newtask;

  const EditTask({required this.oldtask, required this.newtask});
}
