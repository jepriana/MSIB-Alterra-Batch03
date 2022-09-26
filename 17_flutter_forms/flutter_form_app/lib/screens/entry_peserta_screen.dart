import 'package:flutter/material.dart';
import 'package:flutter_form_app/models/peserta.dart';

class EntryPesertaScreen extends StatefulWidget {
  static const routeName = '/peserta/new';
  const EntryPesertaScreen({super.key});

  @override
  State<EntryPesertaScreen> createState() => _EntryPesertaScreenState();
}

class _EntryPesertaScreenState extends State<EntryPesertaScreen> {
  final formKey = GlobalKey<FormState>();
  var dataPeserta = {'nama': '', 'phone': '', 'email': '', 'jk': 'Laki-laki'};
  String? jenisKelamin;

  late Function(Peserta) tambahPeserta;

  void _onSubmit() {
    formKey.currentState!.save();
    print(dataPeserta);
    final pesertaBaru = Peserta(
      nama: dataPeserta['nama']!,
      email: dataPeserta['email']!,
      phone: dataPeserta['phone']!,
      jenisKelamin: dataPeserta['jk']!,
    );
    tambahPeserta(pesertaBaru);
  }

  @override
  Widget build(BuildContext context) {
    tambahPeserta =
        ModalRoute.of(context)!.settings.arguments as Function(Peserta);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Peserta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  label: Text('Nama Peserta'),
                  hintText: 'Wayan Jepriana',
                ),
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'Silakan input nama yang valid';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) dataPeserta['nama'] = newValue;
                },
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  label: Text('Phone Number'),
                  hintText: '081234567890',
                ),
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return 'Silakan input nomor telepon yang valid';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) dataPeserta['phone'] = newValue;
                },
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  label: Text('Alamat Email'),
                  hintText: 'jepriana@alterra.id',
                ),
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'Silakan input nama yang valid';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) dataPeserta['email'] = newValue;
                },
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              Row(
                children: [
                  const Text('Jenis Kelamin:'),
                  Radio(
                    value: 'Laki-laki',
                    groupValue: jenisKelamin,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          jenisKelamin = value;
                        });
                      }
                    },
                  ),
                  const Text('Laki-laki'),
                  Radio(
                    value: 'Wanita',
                    groupValue: jenisKelamin,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          jenisKelamin = value;
                        });
                      }
                    },
                  ),
                  const Text('Wanita'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    dataPeserta['jk'] = jenisKelamin!;
                    _onSubmit();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Menyinmpan data peserta...',
                        ),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
