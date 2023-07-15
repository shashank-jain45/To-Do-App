import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/widgets/task_list.dart';

import '../blocs/bloc/task_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

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
                  'Favourite Tasks: ${state.favouriteTasks.length} ',
                ),
              ),
            ),
            TaskList(tasklist: state.favouriteTasks)
          ],
        );
      },
    );
  }
}
