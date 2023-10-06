import 'package:flutter/material.dart';
import 'package:hello/pages/home/home.dart';
import 'package:hello/pages/home/info.dart';
import 'package:hello/pages/home/meeting/booked.dart';
import 'package:hello/pages/home/meeting/fast.dart';
import 'package:hello/pages/home/meeting/history.dart';
import 'package:hello/pages/home/meeting/join.dart';
import 'package:hello/pages/home/message.dart';
import 'package:hello/pages/login.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meeting Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      routes: {
        '/default': (context) => const Home(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/home/meeting/history': (context) => const History(),
        '/home/meeting/booked': (context) => const Booked(),
        '/home/meeting/join': (context) => const Join(),
        '/home/meeting/fast': (context) => const Fast(),
        '/home/message': (context) => const Message(),
        '/home/info': (context) => const Info(),
      },
      home: const Login(),
    );
  }
}
