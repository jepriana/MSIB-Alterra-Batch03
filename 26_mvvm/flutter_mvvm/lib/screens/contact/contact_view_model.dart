import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/models/api/contact_api.dart';
import 'package:flutter_mvvm/models/contact.dart';

class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => [..._contacts];

  getAllContacts() async {
    final c = await ContactAPI.getContacts();
    _contacts = c;
    notifyListeners();
  }
}
