import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/widgets/task_list.dart';

import '../blocs/bloc/task_bloc.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({Key? key}) : super(key: key);

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
                  'Pending Tasks: ${state.pendingTasks.length}',
                ),
              ),
            ),
            TaskList(tasklist: state.pendingTasks)
          ],
        );
      },
    );
  }
}
