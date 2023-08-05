import 'package:estate_community_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/zielone_bloki.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 500,
          height: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DEVELOPER APP',
                style: GoogleFonts.museoModerno(
                  color: Colors.white,
                  fontSize: 45,
                  textStyle: const TextStyle(decoration: TextDecoration.none),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const RootPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                child: const Text('Przejdź do aplikacji'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
