import 'package:flutter/material.dart';
import 'package:flutter_assets/models/berita.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BeritaScreen extends StatelessWidget {
  final Berita berita;
  const BeritaScreen(this.berita, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Berita'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.share,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              berita.judul,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Rowdies',
                fontWeight: FontWeight.w300,
                // fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(berita.penulis),
            Text(berita.kategori),
            const SizedBox(
              height: 8,
            ),
            Image.network(
              berita.imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              berita.tglTerbit.toString(),
              style: GoogleFonts.lato(fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              berita.konten,
              style: GoogleFonts.quicksand(
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.whatsapp),
                FaIcon(FontAwesomeIcons.facebook),
                FaIcon(FontAwesomeIcons.twitter),
                FaIcon(FontAwesomeIcons.instagram),
              ],
            )
          ],
        ),
      )),
    );
  }
}
