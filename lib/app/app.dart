import 'package:estate_community_app/app/features/home/home_page.dart';
import 'package:estate_community_app/app/features/login/login_page.dart';
import 'package:estate_community_app/app/features/start/starting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estate Community App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const StartingPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        if (user == null) {
          return LoginPage();
        }
        return HomePage(user: user);
      },
    );
  }
}
