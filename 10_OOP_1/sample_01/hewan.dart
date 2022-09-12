// Deklarasi class
class Hewan {
  // Property
  String? nama;
  String? suara;
  var mata = 0;
  var kaki = 0;

  // Method
  void bersuara() {
    if (nama != null && suara != null) {
      print('Suara dari $nama adalah $suara');
    } else {
      print('Tidak diketahui');
    }
  }

  void info() {
    print(
        '$nama adalah hewa berkaki $kaki dan $mata mata. Suara dari $nama adalah $suara');
  }
}

void main() {
  // Pembetukan object dari class
  var h1 = Hewan();

  // Memberikan nilai pada property
  h1.nama = 'Kucing';
  h1.suara = 'Mengeong';
  h1.mata = 2;
  h1.kaki = 4;
  // print(h1.mata);
  // print(h1.kaki);
  h1.info();
  // h1.bersuara();
}
