import 'package:flutter/foundation.dart';
import 'package:flutter_phonebook/models/contact.dart';
import 'package:flutter_phonebook/services/contact_api.dart';

class Contacts with ChangeNotifier {
  late ContactApi _service;
  List<Contact> _items = [];

  Contacts() {
    _service = ContactApi();
    _fetchDataContacts();
  }

  void _fetchDataContacts() async {
    _items = await _service.getAllContacts();
  }

  List<Contact> get items {
    var temp = [..._items];
    temp.sort(
      (a, b) => a.name.compareTo(b.name),
    );
    return temp;
  }

  void add(Contact contact) async {
    final result = await _service.addContact(contact);
    if (result.id != null) {
      _items.add(result);
      notifyListeners();
    }
  }

  void update(Contact contact) async {
    final targetIndex = _items.indexWhere((item) => item.id == contact.id);
    if (targetIndex != -1) {
      final isSuccess = await _service.editContact(contact);
      if (isSuccess) {
        _items[targetIndex] = contact;
        notifyListeners();
      }
    }
  }

  void delete(int id) async {
    final targetIndex = _items.indexWhere((peserta) => peserta.id == id);
    if (targetIndex != -1) {
      final isSuccess = await _service.deleteContact(id);
      if (isSuccess) {
        _items.removeAt(targetIndex);
        notifyListeners();
      }
    }
  }
}
