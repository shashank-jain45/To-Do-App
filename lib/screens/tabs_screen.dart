import 'package:flutter/material.dart';
import 'package:task/screens/completed_task_screen.dart';
import 'package:task/screens/favourite_screen.dart';
import 'package:task/screens/pending_task_screen.dart';

import 'add_task_screen.dart';
import 'drawer_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;
  List<Map<String, dynamic>> pages = [
    {'pageName': const PendingScreen(), 'title': 'Pending Tasks'},
    {'pageName': const CompletedScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavouriteScreen(), 'title': 'Favourite Tasks'},
  ];

  void _addTask(BuildContext context2) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context2,
      builder: (context1) {
        return const SingleChildScrollView(
            scrollDirection: Axis.vertical, child: AddTaskScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Text(pages[currentIndex]['title']),
        actions: [
          IconButton(
            onPressed: () {
              _addTask(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: pages[currentIndex]['pageName'],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context);
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle), label: 'Pending Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite Tasks'),
        ],
      ),
    );
  }
}
