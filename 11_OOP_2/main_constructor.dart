class Hewan {
  var mata;
  var kaki;
  String? nama;
  double berat = 0;

  Hewan({this.nama, required this.berat}) {
    mata = 0;
    kaki = 0;
  }
}

class Kambing extends Hewan {
  Kambing(double brt) : super(berat: brt) {
    mata = 2;
    kaki = 4;
  }
}

class Burung extends Hewan {
  var sayap;
  Burung(double brt) : super(berat: brt) {
    mata = 2;
    kaki = 2;
    sayap = 2;
  }
}

void main(List<String> args) {
  // var hewan1 = Hewan(berat: 125.6, nama: "Sapi");
  var hewan1 = Hewan(berat: 0);
  var kambing1 = Kambing(125);
  var burung1 = Burung(1);
  // print('Berat ${hewan1.nama} adalah ${hewan1.berat} Kg');
  print('Hewan memiliki ${hewan1.mata} mata dan ${hewan1.kaki} kaki');
  print('Kambing memiliki ${kambing1.mata} mata dan ${kambing1.kaki} kaki');
  print(
      'Burung memiliki ${burung1.mata} mata, ${burung1.kaki} kaki dan ${burung1.sayap} sayap.');
}
