import 'package:flutter/material.dart';
import 'package:flutter_task_managtement/screens/task_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        TaskScreen.routeName,
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  label: Text('Username'),
                  hintText: 'jepriana',
                ),
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'Silakan input usernama yang valid';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: _nameController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  label: Text('Email'),
                  hintText: 'jepriana@gmail.com',
                ),
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'Silakan input email yang valid';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: _emailController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  label: Text('Password'),
                  hintText: 'Rahasia',
                ),
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'Silakan input password yang valid';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                obscureText: true,
                controller: _passwordController,
              ),
              ElevatedButton(
                onPressed: () {
                  final isValidForm = formKey.currentState!.validate();
                  final username = _nameController.text;

                  loginData.setBool('login', false);
                  loginData.setString('username', username);
                  if (isValidForm) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      TaskScreen.routeName,
                      (route) => false,
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
