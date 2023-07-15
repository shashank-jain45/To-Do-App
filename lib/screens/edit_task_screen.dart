import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/blocs/bloc/task_bloc.dart';
import 'package:task/model/task.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({Key? key, required this.oldTask}) : super(key: key);
  final Task oldTask;
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController discriptionController =
        TextEditingController(text: oldTask.discription);
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Edit Task', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            TextFormField(
                textInputAction: TextInputAction.next,
                enabled: true,
                autofocus: true,
                controller: titleController,
                decoration: const InputDecoration(
                    label: Text('Title'), border: OutlineInputBorder())),
            const Divider(color: Colors.blueAccent, thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: TextFormField(
                  onEditingComplete: () {
                    Task task = Task(
                        title: titleController.text,
                        date: DateTime.now(),
                        discription: discriptionController.text);
                    context.read<TaskBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  minLines: 3,
                  maxLines: 5,
                  enabled: true,
                  autofocus: true,
                  controller: discriptionController,
                  decoration: const InputDecoration(
                      label: Text(
                        'Discription',
                      ),
                      border: OutlineInputBorder())),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    return Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Task newtask = Task(
                        title: titleController.text,
                        date: oldTask.date,
                        isDeleted: oldTask.isDeleted,
                        isDone: oldTask.isDone,
                        isFavourite: oldTask.isFavourite,
                        discription: discriptionController.text);
                    context
                        .read<TaskBloc>()
                        .add(EditTask(newtask: newtask, oldtask: oldTask));
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
