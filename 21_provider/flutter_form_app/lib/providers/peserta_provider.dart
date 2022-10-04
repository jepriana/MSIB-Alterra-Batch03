import 'package:flutter/foundation.dart';
import 'package:flutter_form_app/models/peserta.dart';

class PesertaProvider with ChangeNotifier {
  final List<Peserta> _peserta = [
    Peserta(
      nama: 'Jepriana',
      email: 'jepriana@peserta.com',
      phone: '081234567890',
      jenisKelamin: 'Laki-laki',
    ),
    Peserta(
      nama: 'Agustin',
      email: 'agustin@peserta.com',
      phone: '081234567891',
      jenisKelamin: 'Perempuan',
    ),
    Peserta(
      nama: 'Bayu',
      email: 'bayu@peserta.com',
      phone: '081234567891',
      jenisKelamin: 'Laki-laki',
    ),
  ];

  List<Peserta> get peserta => [..._peserta];

  void tambahPeserta(Peserta pesertaBaru) {
    _peserta.add(pesertaBaru);
    notifyListeners();
  }

  void editPeserta(Peserta pembaharuanPeserta) {
    final targetIndex =
        _peserta.indexWhere((peserta) => peserta.id == pembaharuanPeserta.id);
    if (targetIndex != -1) {
      _peserta[targetIndex] = pembaharuanPeserta;
      notifyListeners();
    }
  }

  void hapusPeserta(String id) {
    final targetIndex = _peserta.indexWhere((peserta) => peserta.id == id);
    if (targetIndex != -1) {
      _peserta.removeAt(targetIndex);
      notifyListeners();
    }
  }
}
