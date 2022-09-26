import 'package:flutter_form_app/models/peserta.dart';
import 'package:flutter/material.dart';

class PesertaItem extends StatelessWidget {
  final Peserta peserta;
  const PesertaItem(this.peserta, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          peserta.jenisKelamin == 'Laki-laki' ? Icons.man : Icons.girl,
        ),
      ),
      title: Text(peserta.nama),
      subtitle: Text(peserta.id),
    );
  }
}
