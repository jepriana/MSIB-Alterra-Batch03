import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform/body_contact.dart';
import 'package:flutter_platform/models/contact.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final appTitle = 'Contacts';
  final dataContact = <Contact>[
    Contact(nama: 'Wayan Jepriana', phoneNumber: '081234567890'),
    Contact(nama: 'Agus Budiman', phoneNumber: '081234567891'),
    Contact(nama: 'Bagus Permana', phoneNumber: '081234567892'),
    Contact(nama: 'Citra Setyawati', phoneNumber: '081234567893'),
    Contact(nama: 'Dewi Putri', phoneNumber: '081234567894'),
  ];

  @override
  Widget build(BuildContext context) {
    final pageContent = [
      BodyContact(dataContact),
      const Center(
        child: Text('Profile page'),
      ),
    ];
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(appTitle),
              trailing: const Icon(CupertinoIcons.add),
            ),
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.person,
                      ),
                      label: 'Profile'),
                ],
              ),
              tabBuilder: (ctx, idx) {
                return CupertinoTabView(
                  builder: (context) => pageContent[idx],
                );
              },
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(appTitle),
            ),
            body: BodyContact(dataContact),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          );
  }
}
