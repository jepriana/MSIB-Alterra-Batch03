import 'mentee.dart';

class Kelas {
  String? namaKelas;
  String? namaMentor;
  List<Mentee> mentees = [];

  void tambahMentee(Mentee menteeBaru) {
    mentees.add(menteeBaru);
  }

  void cetakInfo() {
    print('Nama Kelas: $namaKelas');
    print('Nama Mentor: $namaMentor');
    print('Daftar Mentee:');
    for (var i = 0; i < mentees.length; i++) {
      print('[${i + 1}] - ${mentees[i].nama}');
    }
  }
}
