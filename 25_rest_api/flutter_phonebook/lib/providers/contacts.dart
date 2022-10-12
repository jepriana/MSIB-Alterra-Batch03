import 'package:flutter/foundation.dart';
import 'package:flutter_phonebook/models/contact.dart';

class Contacts with ChangeNotifier {
  List<Contact> _items = [
    Contact(name: 'Jepriana', phone: '081234567890'),
    Contact(name: 'Agus', phone: '081234567890'),
  ];

  List<Contact> get items {
    var temp = [..._items];
    temp.sort(
      (a, b) => a.name.compareTo(b.name),
    );
    return temp;
  }

  void add(Contact contact) {
    _items.add(contact);
    notifyListeners();
  }

  void update(Contact contact) {
    final targetIndex = _items.indexWhere((item) => item.id == contact.id);
    if (targetIndex != -1) {
      _items[targetIndex] = contact;
      notifyListeners();
    }
  }

  void delete(int id) {
    final targetIndex = _items.indexWhere((peserta) => peserta.id == id);
    if (targetIndex != -1) {
      _items.removeAt(targetIndex);
      notifyListeners();
    }
  }
}
