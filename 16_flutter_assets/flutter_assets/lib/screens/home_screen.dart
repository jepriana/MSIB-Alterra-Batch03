import 'package:flutter/material.dart';
import 'package:flutter_assets/data/data_berita.dart';
import 'package:flutter_assets/screens/berita_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Assets'),
      ),
      body: Stack(
        children: [
          Image.network(
            'https://unsplash.com/photos/W3DJSagu-a0/download?ixid=MnwxMjA3fDB8MXxhbGx8NHx8fHx8fDJ8fDE2NjM5MzgwMTA&force=true&w=1920',
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final berita = dataBerita.elementAt(index);
                return InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BeritaScreen(berita),
                  )),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.network(
                          berita.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        berita.judul,
                        style: const TextStyle(
                          fontFamily: 'Rowdies',
                          fontWeight: FontWeight.w300,
                          // fontStyle: FontStyle.italic,
                        ),
                      ),
                      subtitle: Text(
                        berita.tglTerbit.toString(),
                      ),
                    ),
                  ),
                );
              },
              itemCount: dataBerita.length,
            ),
          ),
        ],
      ),
    );
  }
}
