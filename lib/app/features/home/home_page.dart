import 'package:estate_community_app/app/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Witaj ${widget.user.email}'),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 1) {
          return const Center(
            child: Text('Aktualności'),
          );
        }
        if (currentIndex == 2) {
          return const Center(
            child: Text('Mapa parkingu'),
          );
        }
        if (currentIndex == 3) {
          return const Center(
            child: Text('Forum'),
          );
        }
        if (currentIndex == 4) {
          return const Center(
            child: Text('Odpady'),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Jesteś zalogowany jako ${widget.user.email}'),
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
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Moje konto'),
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper), label: 'Aktualności'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_parking), label: 'Mapa parkingu'),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Forum'),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Odpady'),
        ],
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.blue,
      ),
    );
  }
}
