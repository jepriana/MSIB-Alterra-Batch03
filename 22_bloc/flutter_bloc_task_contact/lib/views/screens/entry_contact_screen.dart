import 'package:flutter/material.dart';

class EntryContactScreen extends StatefulWidget {
  static const routeName = '/contacts/entry';
  const EntryContactScreen({super.key});

  @override
  State<EntryContactScreen> createState() => _EntryContactScreenState();
}

class _EntryContactScreenState extends State<EntryContactScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Contact Name'),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Phone number'),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.save_rounded),
                    label: const Text('Save Contact'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
