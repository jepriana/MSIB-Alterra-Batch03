import 'package:flutter/material.dart';
import 'package:flutter_phonebook/models/contact.dart';
import 'package:flutter_phonebook/providers/contacts.dart';
import 'package:flutter_phonebook/screens/entry_phoneboook_screen.dart';
import 'package:provider/provider.dart';

class PhoneBookItem extends StatelessWidget {
  final Contact contact;
  const PhoneBookItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(contact.name[0]),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phone),
      onLongPress: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Delete Contact'),
            content:
                Text('Are you sure want to delete contact ${contact.name}?'),
            actions: [
              TextButton(
                onPressed: () {
                  Provider.of<Contacts>(context, listen: false)
                      .delete(contact.id!);
                  Navigator.pop(ctx);
                },
                child: const Text('Sure'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
      onTap: () {
        Navigator.of(context).pushNamed(
          EntryPhoneBookScreen.routeName,
          arguments: contact,
        );
      },
    );
  }
}
