import 'package:flutter/material.dart';
import 'package:flutter_phonebook/providers/contacts.dart';
import 'package:flutter_phonebook/screens/entry_phoneboook_screen.dart';
import 'package:flutter_phonebook/screens/phonebook_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Contacts(),
        ),
      ],
      child: MaterialApp(
        title: 'Phonebook',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        routes: {
          PhoneBookScreen.routeName: (context) => const PhoneBookScreen(),
          EntryPhoneBookScreen.routeName: (context) =>
              const EntryPhoneBookScreen(),
        },
        initialRoute: PhoneBookScreen.routeName,
      ),
    );
  }
}
