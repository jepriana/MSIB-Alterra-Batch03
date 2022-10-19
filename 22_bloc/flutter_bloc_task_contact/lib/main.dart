import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_task_contact/view_models/contact/contact_bloc.dart';
import 'package:flutter_bloc_task_contact/view_models/profile/profile_bloc.dart';
import 'package:flutter_bloc_task_contact/views/screens/contact_screen.dart';
import 'package:flutter_bloc_task_contact/views/screens/entry_contact_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Contacts',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          EntryContactScreen.routeName: (context) => const EntryContactScreen(),
        },
      ),
    );
  }
}
