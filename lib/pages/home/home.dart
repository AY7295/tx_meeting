import 'package:flutter/material.dart';
import 'package:hello/component/booked_meeting.dart';
import 'package:hello/pages/home/drawer.dart';
import 'package:hello/util/notify.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void Function() undo() {
    return () {
      showAlert(context: context, content: 'undo');
    };
  }

  var list = <Widget>[
    const BookedMeeting(title: 'meeting title1'),
    const BookedMeeting(title: 'meeting title2')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TX Meeting'),
      ),
      drawer: const HomeDrawer(),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 3.0),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(icon: Icons.add, title: 'join meeting'),
                Button(icon: Icons.light, title: 'fast meeting'),
                Button(icon: Icons.mail, title: 'book meeting'),
                Button(icon: Icons.fit_screen, title: 'share screen'),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (list.isNotEmpty)
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: list,
                )
              else
                Center(child: Image.asset('images/p1.jpg'))
            ],
          )
        ],
      ),
      floatingActionButton: Tooltip(
        message: 'history meeting',
        child: FloatingActionButton(
          onPressed: () {
            showAlert(context: context, content: 'history meeting is not done');
          },
          child: const Icon(Icons.manage_history),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  final IconData icon;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ??
          () {
            showAlert(context: context, content: 'undo');
          },
      icon: Column(
        children: [
          Icon(icon),
          Text(title),
        ],
      ),
    );
  }
}
