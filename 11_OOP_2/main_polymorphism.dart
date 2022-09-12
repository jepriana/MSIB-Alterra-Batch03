class Manusia {
  void makan() {
    print('Manusia makan');
  }

  void berlari() {
    print('Manusia berlari');
  }
}

class Mahasiswa extends Manusia {
  @override
  void makan() {
    print('Mahasiswa makan');
  }

  @override
  void berlari() {
    print('Mahasiswa berlari');
  }
}

class Dosen extends Manusia {
  @override
  void makan() {
    print('Dosen makan');
  }

  @override
  void berlari() {
    print('Dosen berlari');
  }
}

class Programmer extends Manusia {
  @override
  void makan() {
    print('Programmer makan');
  }

  @override
  void berlari() {
    print('Programmer berlari');
  }
}

class Harimau {
  void mengejar(Manusia obj) {
    obj.berlari();
  }
}

void main(List<String> args) {
  List<Manusia> data = [];
  data.add(Mahasiswa());
  data.add(Dosen());

  var harimau = Harimau();
  print('Bila harimau mengejar, maka:');
  for (var obj in data) {
    obj.makan();
    obj.berlari();
  }
}
