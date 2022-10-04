import 'package:flutter/material.dart';
import 'package:flutter_form_app/providers/peserta_provider.dart';
import 'package:flutter_form_app/screens/entry_peserta_screen.dart';
import 'package:flutter_form_app/screens/form_screen.dart';
import 'package:flutter_form_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PesertaProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peserta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        FormScreen.routeName: (context) => const FormScreen(),
        EntryPesertaScreen.routeName: (context) => const EntryPesertaScreen(),
      },
    );
  }
}
