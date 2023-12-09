import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _HomeState();
}

class _HomeState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Out'),
        backgroundColor: const Color.fromARGB(255, 0, 255, 145),
      ),
    );
  }
}
