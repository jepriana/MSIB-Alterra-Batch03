import 'package:flutter/material.dart';
import 'package:flutter_form_app/providers/peserta_provider.dart';
import 'package:flutter_form_app/screens/entry_peserta_screen.dart';
import 'package:flutter_form_app/widgets/peserta_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/peserta';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Peserta> dataPeserta = [
  //   Peserta(
  //     nama: 'Jepriana',
  //     email: 'jepriana@peserta.com',
  //     phone: '081234567890',
  //     jenisKelamin: 'Laki-laki',
  //   ),
  //   Peserta(
  //     nama: 'Agustin',
  //     email: 'agustin@peserta.com',
  //     phone: '081234567891',
  //     jenisKelamin: 'Perempuan',
  //   ),
  //   Peserta(
  //     nama: 'Bayu',
  //     email: 'bayu@peserta.com',
  //     phone: '081234567891',
  //     jenisKelamin: 'Laki-laki',
  //   ),
  // ];

  // void tambahPeserta(Peserta peserta) {
  //   setState(() {
  // dataPeserta.add(peserta);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final dataPeserta = Provider.of<PesertaProvider>(context).peserta;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Peserta',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final peserta = dataPeserta.elementAt(index);
            return PesertaItem(peserta);
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: dataPeserta.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            EntryPesertaScreen.routeName,
            // arguments: tambahPeserta,
          );
        },
        child: const Icon(Icons.add),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
