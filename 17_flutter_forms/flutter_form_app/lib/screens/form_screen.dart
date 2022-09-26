import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  static const routeName = '/form';
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? radioValue;
  bool membaca = false;
  bool menonton = false;
  bool jalanJalan = false;
  var provinsiTerpilih = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text('Email address'),
                    prefix: Icon(
                      Icons.email,
                    ),
                  ),
                ),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  obscuringCharacter: '*',
                  textInputAction: TextInputAction.done,
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Laki-laki',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          radioValue = value;
                        });
                      },
                    ),
                    const Text('Laki-laki'),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Perempuan',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          radioValue = value;
                        });
                      },
                    ),
                    const Text('Perempuan'),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Hoby'),
                Row(
                  children: [
                    Checkbox(
                      value: membaca,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            membaca = value;
                          });
                        }
                      },
                    ),
                    const Text('Membaca'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: menonton,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            menonton = value;
                          });
                        }
                      },
                    ),
                    const Text('Menonton'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: jalanJalan,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            jalanJalan = value;
                          });
                        }
                      },
                    ),
                    const Text('Jalan-jalan'),
                  ],
                ),
                DropdownButton(
                  value: provinsiTerpilih,
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: Text('Bali'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text('Jawa Barat'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('Jakarta'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      provinsiTerpilih = value ?? 0;
                      print(provinsiTerpilih);
                    });
                  },
                ),
                SizedBox(
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Click Elevated Button'),
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                  label: const Text('Click Elevated Button'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Click Outlined Button'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Click Text Button'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
