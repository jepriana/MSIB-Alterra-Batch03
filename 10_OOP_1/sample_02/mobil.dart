class Mobil {
  var merk;
  var type;
  var bahanBakar;
  var jarakTempuh;

  void infoBahanBakar() {
    print('Sisa bahan bakar adalah $bahanBakar litter');
  }

  void infoJarakTempuh() {
    print('Jarak tempuh mobil adalah $jarakTempuh Km');
  }

  void berjalan(var jarak) {
    // Menambah jarak tempuh
    jarakTempuh += jarak;
    // Mengurangi bahan bakar
    bahanBakar -= jarak / 10;

    print('Mobil telah berjalan sejauh $jarak Km');
  }

  void isiBahanBakar(var jumlah) {
    bahanBakar += jumlah;

    print('Mobil telah ditambah bahan bakar sebanyak $jumlah litter.');
  }
}
