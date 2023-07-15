
part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favouriteTasks;
  final List<Task> binTasks;
  const TaskState({this.pendingTasks= const [] , this.completedTasks= const [], this.favouriteTasks= const [], this.binTasks = const []});

  @override
  List<Object> get props => [pendingTasks,completedTasks,favouriteTasks,binTasks];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'pendingTasks': pendingTasks.map((x) => x.toMap()).toList()});
    result.addAll({'completedTasks': completedTasks.map((x) => x.toMap()).toList()});
    result.addAll({'favouriteTasks': favouriteTasks.map((x) => x.toMap()).toList()});
    result.addAll({'binTasks': binTasks.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pendingTasks: List<Task>.from(map['pendingTasks']?.map((x) => Task.fromMap(x))),
      completedTasks: List<Task>.from(map['completedTasks']?.map((x) => Task.fromMap(x))),
      favouriteTasks: List<Task>.from(map['favouriteTasks']?.map((x) => Task.fromMap(x))),
      binTasks: List<Task>.from(map['binTasks']?.map((x) => Task.fromMap(x))),
    );
  }


}
