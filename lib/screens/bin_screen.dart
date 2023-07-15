import 'package:flutter/material.dart';
import 'package:task/model/task.dart';
import 'package:task/screens/drawer_screen.dart';
import 'package:task/widgets/task_list.dart';

class BinScreen extends StatelessWidget {
  final List<Task> binList;
  const BinScreen({
    Key? key,
    this.binList = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Recycle Bin")),
        drawer: const MyDrawer(),
        body: Column(
          children: [
            TaskList(tasklist: binList),
          ],
        ));
  }
}
