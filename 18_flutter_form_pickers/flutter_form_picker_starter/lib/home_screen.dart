import 'package:flutter/material.dart';
import 'package:flutter_form_picker/color_picker_screen.dart';
import 'package:flutter_form_picker/date_picker_screen.dart';
import 'package:flutter_form_picker/file_picker_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Form Picker'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.calendar_month,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.color_lens,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.file_open,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DatePickerScreen(),
            ColorPickerScreen(),
            FilePickerScreen(),
          ],
        ),
      ),
    );
  }
}
