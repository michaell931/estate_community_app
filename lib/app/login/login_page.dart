import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blueGrey, Colors.black],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20),
        child: Text(
          'Logowanie',
          style: GoogleFonts.nunito(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
