import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

var postTheme = '';
var postContent = '';

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              width: 350,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Temat',
                  prefixIcon: Icon(Icons.subject),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                onChanged: (newValue) {
                  setState(() {
                    newValue = postTheme;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.newspaper),
                  labelText: 'Treść posta',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 300),
                ),
                onChanged: (newValue) {
                  setState(() {
                    newValue = postContent;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Dodaj')),
                ElevatedButton(onPressed: () {}, child: const Text('Powrót')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
