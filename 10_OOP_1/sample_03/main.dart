import 'kelas.dart';
import 'mentee.dart';

void main(List<String> args) {
  var kelasFlutterB = Kelas();
  kelasFlutterB.namaKelas = 'Flutter B';
  kelasFlutterB.namaMentor = 'Jepriana';

  // Deklarasi mentee
  var mentee1 = Mentee();
  var mentee2 = Mentee();
  var mentee3 = Mentee();

  // Inisialisasi property mentee
  mentee1.nama = 'Agus';
  mentee1.email = 'agus@gmail.com';
  mentee1.phone = '000000000000';
  mentee2.nama = 'Budi';
  mentee2.email = 'budi@gmail.com';
  mentee2.phone = '000000000000';
  mentee3.nama = 'Citra';
  mentee3.email = 'citra@gmail.com';
  mentee3.phone = '000000000000';

  // Menambahkan data mentee ke dalam list mentee di kelas
  kelasFlutterB.tambahMentee(mentee1);
  kelasFlutterB.tambahMentee(mentee2);
  kelasFlutterB.tambahMentee(mentee3);

  // Menampilkan info kelas
  kelasFlutterB.cetakInfo();
}
