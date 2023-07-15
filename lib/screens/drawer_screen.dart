import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/blocs/bloc/task_bloc.dart';

import '../blocs/switch/bloc/switch_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 50,
        child: Column(
          children: [
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: state.switchValue == true ? Colors.teal : Colors.blue,
                  child: Text(
                    "Task Drawer",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              },
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
              title: const Text('My Tasks', style: TextStyle(fontSize: 20)),
              leading: const Icon(Icons.folder_special),
              trailing: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  return Text(
                      '${state.pendingTasks.length} | ${state.completedTasks.length}',
                      style: const TextStyle(fontSize: 20));
                },
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'bin',
                    );
                  },
                  title: const Text('My Bin ', style: TextStyle(fontSize: 20)),
                  leading: const Icon(Icons.delete),
                  trailing: Text(state.binTasks.length.toString(),
                      style: const TextStyle(fontSize: 20)),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Light Mode'),
                    Switch(
                      value: state.switchValue,
                      onChanged: (newValue) async {
                        Navigator.pop(context);
                        return context.read<SwitchBloc>().add(SwitchEvent(
                            newValue: newValue,
                            switchValue: state.switchValue));
                      },
                    ),
                    const Text('Dark Mode'),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
