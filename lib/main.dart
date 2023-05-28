import 'package:estate_community_app/app/start/starting_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estate Community App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartingPage(),
    );
  }
}
