import 'package:flutter/foundation.dart';
import 'package:flutter_phonebook/models/contact.dart';
import 'package:flutter_phonebook/services/contact_api.dart';

enum ContactViewState {
  none,
  loading,
  error,
}

class Contacts with ChangeNotifier {
  late ContactApi _service;
  ContactViewState _state = ContactViewState.none;
  List<Contact> _items = [];

  Contacts() {
    _service = ContactApi();
    _fetchDataContacts();
  }

  ContactViewState get state => _state;

  changeState(ContactViewState s) {
    _state = s;
    notifyListeners();
  }

  void _fetchDataContacts() async {
    changeState(ContactViewState.loading);
    // Future.delayed(const Duration(seconds: 1));
    try {
      _items = await _service.getAllContacts();
      changeState(ContactViewState.none);
    } catch (error) {
      changeState(ContactViewState.error);
    }
  }

  List<Contact> get items {
    var temp = [..._items];
    temp.sort(
      (a, b) => a.name.compareTo(b.name),
    );
    return temp;
  }

  Future<void> add(Contact contact) async {
    changeState(ContactViewState.loading);
    try {
      final result = await _service.addContact(contact);
      if (result.id != null) {
        _items.add(result);
        notifyListeners();
      }
      changeState(ContactViewState.none);
    } catch (error) {
      changeState(ContactViewState.error);
    }
  }

  void update(Contact contact) async {
    changeState(ContactViewState.loading);
    try {
      final targetIndex = _items.indexWhere((item) => item.id == contact.id);
      if (targetIndex != -1) {
        final isSuccess = await _service.editContact(contact);
        if (isSuccess) {
          _items[targetIndex] = contact;
          notifyListeners();
        }
      }
      changeState(ContactViewState.none);
    } catch (error) {
      changeState(ContactViewState.error);
    }
  }

  void delete(int id) async {
    changeState(ContactViewState.loading);
    try {
      final targetIndex = _items.indexWhere((peserta) => peserta.id == id);
      if (targetIndex != -1) {
        final isSuccess = await _service.deleteContact(id);
        if (isSuccess) {
          _items.removeAt(targetIndex);
          notifyListeners();
        }
      }
      changeState(ContactViewState.none);
    } catch (error) {
      changeState(ContactViewState.error);
    }
  }
}
