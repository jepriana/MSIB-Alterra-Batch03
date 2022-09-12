import 'dart:io';

void main(List<String> args) {
  var matrix = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 8, 7, 6],
  ];

  // for (var i = 0; i < 3; i++) {
  //   matrix.add([]);
  //   for (var j = 0; j < 4; j++) {
  //     print('Masukan elemen ke indeks [$i, $j]: ');
  //     var input = stdin.readLineSync();
  //     if (input != null) {
  //       matrix[i].add(int.parse(input));
  //     } else {
  //       matrix[i].add(0);
  //     }
  //   }
  // }

  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 4; j++) {
      stdout.write(matrix[i][j]);
    }
    print('');
  }
}
