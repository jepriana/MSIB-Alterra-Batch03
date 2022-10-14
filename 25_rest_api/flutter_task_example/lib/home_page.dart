import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_example/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _ctrlName = TextEditingController();
  TextEditingController _ctrlJob = TextEditingController();
  String response = '-';
  List<User> _listUsers = [];
  List<Map<String, dynamic>> _listMapUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Name'),
            TextField(
              controller: _ctrlName,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Job'),
            TextField(
              controller: _ctrlJob,
            ),
            ElevatedButton(
              onPressed: () async {
                final dio = Dio();
                final res = await dio.get('https://reqres.in/api/users');
                final firstUser = res.data['data'][0];
                final firstUserObject = User.fromJson(firstUser);
                // final firstUserMap = {
                //   'id': firstUser['id'],
                //   'email': firstUser['email'].toString(),
                //   'firstName': firstUser['firstName'].toString(),
                //   'lastName': firstUser['lastName'].toString(),
                //   'avatar': firstUser['avatar'].toString(),
                // };

                // mengkonversi seluruh data user menjadi list object

                final listMap = List<Map<String, dynamic>>.from(
                  res.data['data'].map(
                    (user) => {
                      'id': user['id'],
                      'email': user['email'].toString(),
                      'firstName': user['first_name'].toString(),
                      'lastName': user['last_name'].toString(),
                      'avatar': user['avatar'].toString(),
                    },
                  ),
                );

                setState(() {
                  response = listMap.runtimeType.toString();
                  _listUsers = List<User>.from(
                    res.data['data']
                        .map((user) => User.fromJson(user))
                        .toList(),
                  );
                  _listMapUsers = listMap;
                });
              },
              child: const Text('GET'),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(response),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final user = _listMapUsers[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.network(user['avatar']),
                    ),
                    title: Text(
                        '${user['firstName'].toString()} ${user['lastName'].toString()}'),
                    subtitle: Text(user['email']),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: _listMapUsers.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
