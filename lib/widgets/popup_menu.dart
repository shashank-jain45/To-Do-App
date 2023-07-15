import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/screens/edit_task_screen.dart';
import 'package:task/widgets/task_card.dart';

import '../blocs/bloc/task_bloc.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final TaskCard widget;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: widget.task.isDeleted == false
          ? (context) => [
                PopupMenuItem(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SingleChildScrollView(
                            child: EditTaskScreen(oldTask: widget.task)));
                  },
                  child: TextButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => SingleChildScrollView(
                              child: EditTaskScreen(oldTask: widget.task)));
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                ),
                PopupMenuItem(
                  onTap: () async {
                    widget.task.isDeleted = !widget.task.isDeleted!;
                    context.read<TaskBloc>().add(DeleteTask(task: widget.task));
                  },
                  child: TextButton.icon(
                    onPressed: () async {
                      widget.task.isDeleted = !widget.task.isDeleted!;
                      context
                          .read<TaskBloc>()
                          .add(DeleteTask(task: widget.task));
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                  ),
                ),
              ]
          : (context) => [
                PopupMenuItem(
                  onTap: () async {
                    widget.task.isDeleted = !widget.task.isDeleted!;
                    context.read<TaskBloc>().add(DeleteTask(task: widget.task));
                  },
                  child: TextButton.icon(
                    onPressed: () async {
                      widget.task.isDeleted = !widget.task.isDeleted!;
                      context
                          .read<TaskBloc>()
                          .add(DeleteTask(task: widget.task));
                    },
                    icon: const Icon(Icons.restore_from_trash),
                    label: const Text('Restore'),
                  ),
                ),
                PopupMenuItem(
                  onTap: () => context
                      .read<TaskBloc>()
                      .add(DeleteForever(task: widget.task)),
                  child: TextButton.icon(
                    onPressed: () {
                      context
                          .read<TaskBloc>()
                          .add(DeleteForever(task: widget.task));
                    },
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete Forever'),
                  ),
                ),
              ],
    );
  }
}
