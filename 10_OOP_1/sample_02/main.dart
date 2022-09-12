import './mobil.dart';

void main(List<String> args) {
  // Membentuk object dari class Mobil
  var mobilku = Mobil();

  // Memberikan nilai terhadap property Mobil
  mobilku.merk = 'Honda';
  mobilku.type = 'HRV';
  mobilku.bahanBakar = 10.5;
  mobilku.jarakTempuh = 5;

  // Tampilkan data jarak tempuh dan bahan bakar awal
  mobilku.infoJarakTempuh();
  mobilku.infoBahanBakar();
  // Melakukan aksi terhadap object class Mobil
  // Menjalankan mobil sejauh 15 Km
  mobilku.berjalan(15);
  mobilku.infoJarakTempuh();
  mobilku.infoBahanBakar();
  // Mengisi bahan bakar sebanyak 10 Litter
  mobilku.isiBahanBakar(10);
  mobilku.infoBahanBakar();
}
