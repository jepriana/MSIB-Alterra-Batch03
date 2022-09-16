import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Edit',
              style: TextStyle(color: Color(0xFF78C5EF)),
            )),
        middle: Text('Contoh Cupertino'),
        trailing: Icon(CupertinoIcons.add),
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
            builder: (context) => Container(),
          );
        },
      ),
    );
  }
}
