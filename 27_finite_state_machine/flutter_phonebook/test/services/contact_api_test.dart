import 'package:flutter_phonebook/models/contact.dart';
import 'package:flutter_phonebook/services/contact_api.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import './contact_api_test.mocks.dart';

@GenerateMocks([ContactApi])
void main() {
  group(
    'Contact API Test',
    () {
      ContactApi contactAPI = MockContactApi();
      test('get all contacts returns data', () async {
        when(contactAPI.getAllContacts()).thenAnswer((_) async => <Contact>[
              Contact(name: 'Jepriana', phone: '081234567890'),
            ]);

        var contacts = await contactAPI.getAllContacts();
        expect(contacts.isNotEmpty, true);
      });
    },
  );
}
