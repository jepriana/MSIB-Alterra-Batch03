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
    final isLoading =
        Provider.of<Contacts>(context).state == ContactViewState.loading;
    final isError =
        Provider.of<Contacts>(context).state == ContactViewState.error;
    final contacts = Provider.of<Contacts>(context).items;

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : isError
            ? const Center(
                child: Text('Gagal mengambil data dari server'),
              )
            : ListView.separated(
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
