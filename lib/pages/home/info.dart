import 'package:flutter/material.dart';

import '../util/notify.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('user info')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: ListTile(
              leading: ClipOval(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    'images/p2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  'User.name',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/home/info');
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.all(8.0),
            child: const Text(
              'some of user information',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          const Column(
            children: [
              _OptionButton(icon: Icons.person, title: 'account'),
              _OptionButton(icon: Icons.security, title: 'security'),
              _OptionButton(icon: Icons.privacy_tip, title: 'privacy'),
              _OptionButton(icon: Icons.notifications, title: 'notifications'),
              _OptionButton(icon: Icons.settings, title: 'other'),
            ],
          )
        ],
      ),
      floatingActionButton: Tooltip(
        message: 'logout',
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/login');
          },
          child: const Icon(Icons.logout),
        ),
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  const _OptionButton(
      {super.key, required this.icon, this.title = '', this.onPressed});

  final IconData icon;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      child: ElevatedButton(
        onPressed: onPressed ??
            () {
              showAlert(context: context, content: '$title page is not done');
            },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            Text(title),
          ],
        ),
      ),
    );
  }
}
