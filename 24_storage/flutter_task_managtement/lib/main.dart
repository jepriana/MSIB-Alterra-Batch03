import 'package:flutter/material.dart';
import 'package:flutter_task_managtement/providers/db_manager.dart';
import 'package:flutter_task_managtement/providers/task_manager.dart';
import 'package:flutter_task_managtement/screens/login_screen.dart';
import 'package:flutter_task_managtement/screens/profile_screen.dart';
import 'package:flutter_task_managtement/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DbManager(),
        ),
      ],
      child: MaterialApp(
        title: 'Task Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        initialRoute: LoginScreen.routeName,
        routes: {
          TaskScreen.routeName: (context) => const TaskScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
