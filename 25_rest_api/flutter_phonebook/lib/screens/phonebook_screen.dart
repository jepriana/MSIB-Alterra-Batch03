import 'package:flutter/material.dart';
import 'package:flutter_phonebook/screens/entry_phoneboook_screen.dart';
import 'package:flutter_phonebook/widgets/phonebook_list.dart';

class PhoneBookScreen extends StatelessWidget {
  static const routeName = '/contacts';

  const PhoneBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phonebook'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: PhoneBookList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(EntryPhoneBookScreen.routeName);
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
