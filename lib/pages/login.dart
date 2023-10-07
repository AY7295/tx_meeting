import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hello/util/notify.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var username = TextEditingController();
  var password = TextEditingController();

  void login() {
    if (username.text.isEmpty || password.text.isEmpty) {
      showAlert(context: context, content: 'empty username or password');
      return;
    }
    log('account: ${username.text}, password: ${password.text}');
    Navigator.of(context).pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            _Input(
              controller: username,
              icon: Icons.person,
              label: 'Username',
            ),
            _Input(
              controller: password,
              icon: Icons.lock,
              label: 'Password',
              maxLength: 20,
              obscured: true,
            ),
            ElevatedButton(onPressed: login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}

class _Input extends StatelessWidget {
  const _Input({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
    this.hint,
    this.obscured = false,
    this.maxLength = 100,
  });

  final TextEditingController controller;
  final bool obscured;
  final IconData icon;
  final int maxLength;
  final String label;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscured,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint ?? 'Please enter $label',
        prefixIcon: Icon(icon),
        suffixIcon: IconButton(
            onPressed: controller.clear, icon: const Icon(Icons.cancel)),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
