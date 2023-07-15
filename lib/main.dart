import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task/blocs/bloc/task_bloc.dart';
import 'package:task/screens/bin_screen.dart';
import 'package:task/screens/tabs_screen.dart';
import 'blocs/switch/bloc/switch_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => const TabsScreen(),
                'bin': (context) => BlocBuilder<TaskBloc, TaskState>(
                      builder: (context, state) {
                        return BinScreen(binList: state.binTasks);
                      },
                    ),
              },
              title: 'Flutter Tasks App',
              theme: state.switchValue ? ThemeData.dark() : ThemeData.light());
        },
      ),
    );
  }
}
