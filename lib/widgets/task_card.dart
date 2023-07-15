import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task/blocs/bloc/task_bloc.dart';
import 'package:task/widgets/popup_menu.dart';

import '../model/task.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  if (widget.task.isDeleted == false) {
                    widget.task.isFavourite = !widget.task.isFavourite!;
                    context
                        .read<TaskBloc>()
                        .add(FavouritTask(task: widget.task));
                  }
                },
                icon: widget.task.isFavourite!
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      )
                    : const Icon(
                        Icons.favorite_outline,
                        color: Colors.redAccent,
                      )),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.task.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 17,
                        color: widget.task.isDone!
                            ? Colors.teal
                            : Colors.deepOrangeAccent)),
                Text(DateFormat().add_yMMMMd().format(widget.task.date))
              ],
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: widget.task.isDone,
              onChanged: (newValue) async {
                if (widget.task.isDeleted == false) {
                  widget.task.isDone = newValue;
                  await Future.delayed(const Duration(milliseconds: 300));
                  context.read<TaskBloc>().add(UpdateTask(task: widget.task));
                }
              },
            ),
            PopupMenu(widget: widget)
          ],
        ),
      ],
    );
  }
}


// ListTile(
//         onLongPress: () {
//           context.read<TaskBloc>().add(DeleteTask(task: widget.task));
//         },
//         title: Text(widget.task.title,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//                 fontSize: 17,
//                 color: widget.task.isDone!
//                     ? Colors.teal
//                     : Colors.deepOrangeAccent)),
//         trailing: Checkbox(
//           value: widget.task.isDone,
//           onChanged: (newValue) async {
//             setState(() {
//               widget.task.isDone = newValue;
//             });
//             await Future.delayed(const Duration(milliseconds: 300));

//             context
//                 .read<TaskBloc>()
//                 .add(UpdateTask(task: widget.task, newValue: newValue));
//           },
//         ),
//       ),
// }