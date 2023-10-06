import 'package:flutter/material.dart';
import 'package:hello/pages/util/notify.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
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
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      'images/p2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: const Text('User.name'),
                onTap: () {
                  Navigator.of(context).pushNamed('/home/info');
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('settings'),
              onTap: () {
                showAlert(context: context, content: 'you tap the settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}
