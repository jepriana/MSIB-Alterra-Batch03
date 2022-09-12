class Parent {
  int x = 5;
}

class Child extends Parent {
  int x = 10;

  void cetakNilaiX(int x) {
    print('Nilai variabel x adalah ${x}');
    print('Nilai variabel x pada class Child adalah ${this.x}');
    print('Nilai variabel x dari class Parent adalah ${super.x}');
  }
}

void main(List<String> args) {
  var child = Child();
  child.cetakNilaiX(15);
}
