import 'package:flutter/material.dart';
import 'package:flutter_bloc_task_contact/views/screens/entry_contact_screen.dart';
import 'package:flutter_bloc_task_contact/views/widgets/contact_list.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/contacts';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: const ContactList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            EntryContactScreen.routeName,
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
