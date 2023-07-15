import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/widgets/task_list.dart';

import '../blocs/bloc/task_bloc.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  'Completed Tasks: ${state.completedTasks.length}',
                ),
              ),
            ),
            TaskList(tasklist: state.completedTasks)
          ],
        );
      },
    );
  }
}
