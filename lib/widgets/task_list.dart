import 'package:flutter/material.dart';
import 'package:task/widgets/task_card.dart';

import '../model/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasklist;
  const TaskList({
    Key? key,
    required this.tasklist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasklist
              .map(
                (task) => ExpansionPanelRadio(
                  value: task.date,
                  headerBuilder: (context, isExpanded) => TaskCard(task: task),
                  body: Align(
                    alignment: Alignment.topLeft,
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Title: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          TextSpan(
                              text: task.title,
                              style: const TextStyle(fontSize: 15)),
                          const TextSpan(
                            text: '\n\nDiscription: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          TextSpan(
                              text: '${task.discription}',
                              style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

    // return Expanded(
    //   child: ListView.builder(
    //     itemCount: tasklist.length,
    //     itemBuilder: (context, index) {
    //       Task task = tasklist[index];
    //       return TaskCard(task: task);
    //     },
    //   ),
    // );