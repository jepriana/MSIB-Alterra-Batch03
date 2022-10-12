import 'package:flutter/material.dart';
import 'package:flutter_phonebook/models/contact.dart';
import 'package:flutter_phonebook/providers/contacts.dart';
import 'package:provider/provider.dart';

class EntryPhoneBookScreen extends StatefulWidget {
  static const routeName = '/contacts/new';
  const EntryPhoneBookScreen({super.key});

  @override
  State<EntryPhoneBookScreen> createState() => _EntryPhoneBookScreenState();
}

class _EntryPhoneBookScreenState extends State<EntryPhoneBookScreen> {
  final formKey = GlobalKey<FormState>();
  var contact = {'name': '', 'phone': ''};
  final TextEditingController _ctrlName = TextEditingController();
  final TextEditingController _ctrlPhone = TextEditingController();
  Contact? updateContact;

  // late Function(Contact) tambahContact;

  void _onSubmit() {
    formKey.currentState!.save();
    final newContact = Contact(
      name: contact['name']!,
      phone: contact['phone']!,
    );
    // tambahContact(newContact);
    if (updateContact != null) {
      newContact.id = updateContact!.id;
      Provider.of<Contacts>(context, listen: false).update(newContact);
    } else {
      Provider.of<Contacts>(context, listen: false).add(newContact);
    }
  }

  @override
  Widget build(BuildContext context) {
    updateContact = ModalRoute.of(context)!.settings.arguments as Contact?;
    if (updateContact != null) {
      _ctrlName.text = updateContact!.name;
      _ctrlPhone.text = updateContact!.phone;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entry Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  label: Text('Contact Name'),
                  hintText: 'Wayan Jepriana',
                ),
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Please input contact name';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) contact['name'] = newValue;
                },
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: _ctrlName,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  label: Text('Phone Number'),
                  hintText: '081234567890',
                ),
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return 'Please input a valid phone number';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) contact['phone'] = newValue;
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                controller: _ctrlPhone,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    _onSubmit();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Saving contact...',
                        ),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
