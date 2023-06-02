import 'package:estate_community_app/app/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jesteś zalogowany jako ${user.email}'),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                      builder: (_) => const RootPage(),
                    ),
                  );
                },
                child: const Text('Wyloguj'))
          ],
        ),
      ),
    );
  }
}
