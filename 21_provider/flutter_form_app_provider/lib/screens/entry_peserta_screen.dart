import 'package:flutter/material.dart';
import 'package:flutter_form_app/models/peserta.dart';
import 'package:flutter_form_app/providers/peserta_provider.dart';
import 'package:provider/provider.dart';

class EntryPesertaScreen extends StatefulWidget {
  static const routeName = '/peserta/new';
  const EntryPesertaScreen({super.key});

  @override
  State<EntryPesertaScreen> createState() => _EntryPesertaScreenState();
}

class _EntryPesertaScreenState extends State<EntryPesertaScreen> {
  final formKey = GlobalKey<FormState>();
  var dataPeserta = {'nama': '', 'phone': '', 'email': '', 'jk': 'Laki-laki'};
  final TextEditingController _ctrlNama = TextEditingController();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPhone = TextEditingController();
  String? jenisKelamin;
  Peserta? editPeserta;

  // late Function(Peserta) tambahPeserta;

  void _onSubmit() {
    formKey.currentState!.save();
    final pesertaBaru = Peserta(
      nama: dataPeserta['nama']!,
      email: dataPeserta['email']!,
      phone: dataPeserta['phone']!,
      jenisKelamin: dataPeserta['jk']!,
    );
    // tambahPeserta(pesertaBaru);
    if (editPeserta != null) {
      pesertaBaru.id = editPeserta!.id;
      Provider.of<PesertaProvider>(context, listen: false)
          .editPeserta(pesertaBaru);
    } else {
      Provider.of<PesertaProvider>(context, listen: false)
          .tambahPeserta(pesertaBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    // tambahPeserta =
    //     ModalRoute.of(context)!.settings.arguments as Function(Peserta);
    editPeserta = ModalRoute.of(context)!.settings.arguments as Peserta?;
    if (editPeserta != null) {
      _ctrlNama.text = editPeserta!.nama;
      _ctrlEmail.text = editPeserta!.email;
      _ctrlPhone.text = editPeserta!.phone;
      jenisKelamin = editPeserta!.jenisKelamin;
    }
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
                controller: _ctrlNama,
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
                controller: _ctrlEmail,
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
                controller: _ctrlPhone,
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
                    value: 'Perempuan',
                    groupValue: jenisKelamin,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          jenisKelamin = value;
                        });
                      }
                    },
                  ),
                  const Text('Perempuan'),
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
                          'Menyimpan data peserta...',
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
