import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:task/model/task.dart';
import 'package:task/screens/edit_task_screen.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_addTask);
    on<UpdateTask>(_updateTask);
    on<DeleteTask>(_deleteTask);
    on<FavouritTask>(_favouriteTask);
    on<DeleteForever>(_deleteForever);
    on<EditTask>(_editTask);
    // on<IsDone>(_isDoneTask);
  }
  void _addTask(AddTask event, Emitter<TaskState> emit) {
    emit(
      TaskState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        binTasks: List.from(state.binTasks),
        completedTasks: List.from(state.completedTasks),
        favouriteTasks: List.from(state.favouriteTasks),
      ),
    );
  }

  void _updateTask(UpdateTask event, Emitter<TaskState> emit) {
    // int index = state.pendingTasks.indexOf(event.task);

    if (event.task.isDone == true) {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks)..remove(event.task),
          completedTasks: List.from(state.completedTasks)..add(event.task),
          binTasks: List.from(state.binTasks),
          favouriteTasks: List.from(state.favouriteTasks),
        ),
      );
    } else {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks)..add(event.task),
          completedTasks: List.from(state.completedTasks)..remove(event.task),
          binTasks: List.from(state.binTasks),
          favouriteTasks: List.from(state.favouriteTasks),
        ),
      );
    }
  }

  void _deleteTask(DeleteTask event, Emitter<TaskState> emit) {
    if (event.task.isDeleted == false &&
        event.task.isDone == true &&
        event.task.isFavourite == true) {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks),
          completedTasks: List.from(state.completedTasks)..add(event.task),
          favouriteTasks: List.from(state.favouriteTasks)..add(event.task),
          binTasks: List.from(state.binTasks)..remove(event.task),
        ),
      );
    } else if (event.task.isDeleted == false &&
        event.task.isDone == true &&
        event.task.isFavourite == false) {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks),
          completedTasks: List.from(state.completedTasks)..add(event.task),
          favouriteTasks: List.from(state.favouriteTasks),
          binTasks: List.from(state.binTasks)..remove(event.task),
        ),
      );
    } else if (event.task.isDeleted == false &&
        event.task.isDone == false &&
        event.task.isFavourite == true) {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks)..add(event.task),
          completedTasks: List.from(state.completedTasks),
          favouriteTasks: List.from(state.favouriteTasks)..add(event.task),
          binTasks: List.from(state.binTasks)..remove(event.task),
        ),
      );
    } else if (event.task.isDeleted == false &&
        event.task.isDone == false &&
        event.task.isFavourite == false) {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks)..add(event.task),
          completedTasks: List.from(state.completedTasks),
          favouriteTasks: List.from(state.favouriteTasks),
          binTasks: List.from(state.binTasks)..remove(event.task),
        ),
      );
    } else {
      emit(
        TaskState(
            pendingTasks: List.from(state.pendingTasks)..remove(event.task),
            completedTasks: List.from(state.completedTasks)..remove(event.task),
            favouriteTasks: List.from(state.favouriteTasks)..remove(event.task),
            binTasks: List.from(state.binTasks)..add(event.task)),
      );
    }
  }

  void _deleteForever(DeleteForever event, Emitter<TaskState> emit) {
    emit(
      TaskState(
        binTasks: List.from(state.binTasks)..remove(event.task),
        pendingTasks: List.from(state.pendingTasks),
        completedTasks: List.from(state.completedTasks),
        favouriteTasks: List.from(state.favouriteTasks),
      ),
    );
  }

  void _favouriteTask(FavouritTask event, Emitter<TaskState> emit) {
    if (event.task.isFavourite == true) {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks),
          binTasks: List.from(state.binTasks),
          completedTasks: List.from(state.completedTasks),
          favouriteTasks: List.from(state.favouriteTasks)..add(event.task),
        ),
      );
    } else {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks),
          completedTasks: List.from(state.completedTasks),
          favouriteTasks: List.from(state.favouriteTasks)..remove(event.task),
          binTasks: List.from(state.binTasks),
        ),
      );
    }
  }

  void _editTask(EditTask event, Emitter<TaskState> emit) {
    if (event.oldtask.isDone == true && event.oldtask.isFavourite == true) {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks),
          completedTasks: List.from(state.completedTasks)
            ..remove(event.oldtask)
            ..add(event.newtask),
          favouriteTasks: List.from(state.favouriteTasks)
            ..remove(event.oldtask)
            ..add(event.newtask),
          binTasks: List.from(state.binTasks),
        ),
      );
    }
    if (event.oldtask.isDone == false && event.oldtask.isFavourite == false) {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks)
            ..remove(event.oldtask)
            ..add(event.newtask),
          completedTasks: List.from(state.completedTasks),
          favouriteTasks: List.from(state.favouriteTasks),
          binTasks: List.from(state.binTasks),
        ),
      );
    }
    if (event.oldtask.isDone == true && event.oldtask.isFavourite == false) {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks),
          completedTasks: List.from(state.completedTasks)
            ..remove(event.oldtask)
            ..add(event.newtask),
          favouriteTasks: List.from(state.favouriteTasks),
          binTasks: List.from(state.binTasks),
        ),
      );
    }
    if (event.oldtask.isDone == false && event.oldtask.isFavourite == true) {
      emit(
        TaskState(
          pendingTasks: List.from(state.pendingTasks)
            ..remove(event.oldtask)
            ..add(event.newtask),
          completedTasks: List.from(state.completedTasks),
          favouriteTasks: List.from(state.favouriteTasks)
            ..remove(event.oldtask)
            ..add(event.newtask),
          binTasks: List.from(state.binTasks),
        ),
      );
    }
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
