import "package:estate_community_app/app/app.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutterfire_ui/auth.dart";
import "package:google_fonts/google_fonts.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);

    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const RootPage(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/zielone_bloki_2.jpg'),
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
              const LoadingIndicator(
                size: 60,
                borderWidth: 3,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
