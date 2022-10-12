import 'package:flutter/material.dart';
import 'package:flutter_phonebook/providers/contacts.dart';
import 'package:flutter_phonebook/widgets/phonebook_item.dart';
import 'package:provider/provider.dart';

class PhoneBookList extends StatefulWidget {
  const PhoneBookList({super.key});

  @override
  State<PhoneBookList> createState() => _PhoneBookListState();
}

class _PhoneBookListState extends State<PhoneBookList> {
  @override
  Widget build(BuildContext context) {
    final contacts = Provider.of<Contacts>(context).items;
    return ListView.separated(
      itemBuilder: (context, index) {
        return PhoneBookItem(contact: contacts[index]);
      },
      itemCount: contacts.length,
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
      ),
    );
  }
}
