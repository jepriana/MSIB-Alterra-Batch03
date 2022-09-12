class BangunRuang {
  void keliling() {}

  void luas() {}

  void volume() {}
}

class Balok implements BangunRuang {
  double panjang, lebar, tinggi;

  Balok(this.panjang, this.lebar, this.tinggi);

  @override
  void keliling() {
    var hasil = 4 * (2 * (panjang + lebar)) + 2 * (2 * (lebar + tinggi));
    print('Keliling dari balok adalah ${hasil}');
  }

  @override
  void luas() {
    var hasil = 4 * (panjang * lebar) + 2 * (lebar * tinggi);
    print('Luas dari balok adalah ${hasil}');
  }

  @override
  void volume() {
    var hasil = panjang * lebar * tinggi;
    print('Volume dari balok adalah ${hasil}');
  }

  void cetakSemua() {
    keliling();
    luas();
    volume();
  }
}

void main(List<String> args) {
  var balok = Balok(5, 3, 4);
  balok.cetakSemua();
}
