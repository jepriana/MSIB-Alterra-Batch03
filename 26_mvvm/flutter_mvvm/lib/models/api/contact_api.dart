import 'package:dio/dio.dart';
import 'package:flutter_mvvm/models/contact.dart';

class ContactAPI {
  static Future<List<Contact>> getContacts() async {
    final respone = await Dio().get(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
    );

    List<Contact> contacts = (respone.data as List)
        .map(
          (contact) => Contact(
            id: contact['id'],
            name: contact['name'],
            phone: contact['phone'],
          ),
        )
        .toList();

    return contacts;
  }
}
