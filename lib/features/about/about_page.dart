import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blueGrey,
      body: const Padding(
        padding: EdgeInsets.all(100),
        child: Column(
          children: [
            Center(
              child: Text(
                'O aplikacji',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'Aplikacja powstała z myślą o mieszkańcach nieruchomości, którzy mają dostęp do wszelkich informacji na temat swojego osiedla',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
