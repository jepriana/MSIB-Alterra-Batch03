import 'package:dio/dio.dart';
import 'package:flutter_phonebook/models/contact.dart';

class ContactApi {
  late Dio _dio;
  static const baseUrl = 'https://api.jepriana.com/contacts';

  ContactApi() {
    _dio = Dio();
  }

  Future<List<Contact>> getAllContacts() async {
    final response = await _dio.get(baseUrl);
    if (response.data['values'] != null) {
      return List<Contact>.from(response.data['values']
          .map((contact) => Contact.fromJson(contact))
          .toList());
    }
    return [];
  }

  Future<Contact> addContact(Contact contact) async {
    final response = await _dio.post(baseUrl, data: contact.toJson());
    if (response.data['values']['affectedRows'] > 0) {
      final contactId = response.data['values']['insertId'];
      contact.id = contactId;
    }
    return contact;
  }

  Future<bool> editContact(Contact contact) async {
    final response = await _dio.put(
      '$baseUrl/${contact.id}',
      data: contact.toJson(),
    );
    if (response.data['values']['affectedRows'] > 0) {
      return true;
    }
    return false;
  }

  Future<bool> deleteContact(int id) async {
    final response = await _dio.delete(
      '$baseUrl/$id',
    );
    if (response.data['values']['affectedRows'] > 0) {
      return true;
    }
    return false;
  }
}
