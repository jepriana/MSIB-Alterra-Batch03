import 'dart:io';

import 'package:cupertino_lists/cupertino_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform/models/contact.dart';

class BodyContact extends StatelessWidget {
  final List<Contact> data;
  const BodyContact(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) => Platform.isIOS
          ? CupertinoListTile(
              leading: CircleAvatar(
                child: Text(data[index].nama[0]),
              ),
              title: Text(data[index].nama),
              subtitle: Text(data[index].phoneNumber),
              trailing: const Icon(Icons.favorite),
            )
          : ListTile(
              leading: CircleAvatar(
                child: Text(data[index].nama[0]),
              ),
              title: Text(data[index].nama),
              subtitle: Text(data[index].phoneNumber),
              trailing: const Icon(Icons.favorite),
            )),
      itemCount: data.length,
    );
  }
}
