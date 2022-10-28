import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phonebook/bloc/contact_bloc.dart';
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
  void initState() {
    context.read<ContactBloc>().add(GetContacts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final contacts = Provider.of<Contacts>(context).items;
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return PhoneBookItem(contact: state.items[index]);
          },
          itemCount: state.items.length,
          separatorBuilder: (context, index) => const Divider(
            thickness: 1,
          ),
        );
      },
    );
  }
}
