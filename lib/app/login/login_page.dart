import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            'Logowanie',
            style: GoogleFonts.nunito(
              fontSize: 42,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 200),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Wpisz nazwę użytkownika', fillColor: Colors.white),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Wpisz hasło', fillColor: Colors.white),
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.black,
              minimumSize: const Size(300, 50),
            ),
            child: const Text('Zaloguj się'),
            onPressed: () {},
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white60),
            ),
            onPressed: () {},
            child: const Text('Utwórz konto'),
          ),
        ],
      ),
    );
  }
}
