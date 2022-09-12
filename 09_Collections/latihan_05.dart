void main(List<String> args) {
  var data = [
    ['Agus', 'Denpasar'],
    ['Bayu', 'Banyuwangi'],
    ['Ayu', 'Bandung'],
    ['Dita', 'Surabaya'],
  ];

  var dataMap = [];

  // TODO: Ubahlah list data menjadi list map
  /* 
  dataMap = [
    {nama: Agus, asal: Denpasar},
    {nama: Bayu, asal: Banyuwangi},
    {nama: Citra, asal: Bandung},
    {nama: Dita, asal: Surabaya},
  ];
  */
  for (var i = 0; i < data.length; i++) {
    dataMap.add({
      'nama': data[i][0],
      'asal': data[i][1],
    });
  }

  print('+=======================+');
  print('|      DATA PESERTA     |');
  print('+=======================+');
  print('| NAMA  | ASAL          |');
  print('+=======+===============+');
  for (var i = 0; i < dataMap.length; i++) {
    print("| ${dataMap[i]['nama']} \t| ${dataMap[i]['asal']} \t|");
    if (i < dataMap.length - 1) {
      print('+-------+---------------+');
    }
  }
  print('+=======================+');
}
