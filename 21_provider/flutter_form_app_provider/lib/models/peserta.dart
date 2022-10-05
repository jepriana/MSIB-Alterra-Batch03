import 'package:nanoid/non_secure.dart';

class Peserta {
  late String id;
  String nama;
  String email;
  String phone;
  String jenisKelamin;

  Peserta({
    required this.nama,
    required this.email,
    required this.phone,
    required this.jenisKelamin,
  }) {
    id = nanoid(15);
  }
}
