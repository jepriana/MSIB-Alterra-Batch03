import 'dart:io';

void soal1() {
  print('Soal 1');
}

void soal2() {
  print('Soal 2');
}

void main() {
  var isStop = false;
  while (isStop == false) {
    print('+=======================+');
    print('|      CONTOH MENU      |');
    print('+=======================+');
    print('| 1 | Soal 1            |');
    print('| 2 | Soal 2            |');
    print('| 3 | Keluar            |');
    print('+=======================+');
    stdout.write('Silakan masukan pilihan anda (1/2/3): ');
    var input = stdin.readLineSync()!;
    switch (input) {
      case '1':
        soal1();
        break;
      case '2':
        soal2();
        break;
      case '3':
        isStop = true;
        break;
      default:
        print('Pilihan yang anda masukan salah...');
        break;
    }
  }
}
