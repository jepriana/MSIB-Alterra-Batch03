abstract class Hewan {
  void reproduksi() {
    print('Tidak diketahui');
  }

  void bernafas() {
    print('Tidak diketahui');
  }
}

class Kambing extends Hewan {
  @override
  void reproduksi() {
    print('Bereproduksi dengan melahirkan');
  }

  @override
  void bernafas() {
    print('Bernafas dengan paru-paru');
  }
}

void main(List<String> args) {
  // var hewan = Hewan();
  var kambing = Kambing();
  kambing.reproduksi();
  kambing.bernafas();
}
