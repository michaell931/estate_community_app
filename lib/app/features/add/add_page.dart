import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('Dodaj nowy post'),
        ),
        body: const TextField());
  }
}
