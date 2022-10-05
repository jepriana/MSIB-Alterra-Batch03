import 'package:flutter_form_app/models/peserta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_app/providers/peserta_provider.dart';
import 'package:flutter_form_app/screens/entry_peserta_screen.dart';
import 'package:provider/provider.dart';

class PesertaItem extends StatelessWidget {
  final Peserta peserta;
  const PesertaItem(this.peserta, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            peserta.jenisKelamin == 'Laki-laki' ? Icons.man : Icons.girl,
          ),
        ),
        title: Text(peserta.nama),
        subtitle: Text(peserta.id),
      ),
      onDoubleTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Edit Data'),
              content: Text(
                  'Apakah anda yakin ingin memperbaharui data peserta dengan nama ${peserta.nama}'),
              actions: [
                TextButton(
                  onPressed: () async {
                    await Navigator.of(context).pushNamed(
                      EntryPesertaScreen.routeName,
                      arguments: peserta,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('Yakin'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Batal'),
                ),
              ],
            );
          },
        );
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text('Hapus Data'),
              content: Text(
                  'Apakah anda yakin ingin menghapus data peserta dengan nama ${peserta.nama}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Provider.of<PesertaProvider>(
                      context,
                      listen: false,
                    ).hapusPeserta(peserta.id);
                    Navigator.pop(context);
                  },
                  child: const Text('Yakin'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Batal'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
