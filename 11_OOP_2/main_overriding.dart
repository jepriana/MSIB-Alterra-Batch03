class Hewan {
  void bergerak() {
    print('Tidak diketahui');
  }
}

class Sapi extends Hewan {
  @override
  void bergerak() {
    print('Sapi bergerak dengan berjalan');
  }
}

class Burung extends Hewan {
  @override
  void bergerak() {
    print('Sapi bergerak dengan berjalan dan terbang');
  }
}
