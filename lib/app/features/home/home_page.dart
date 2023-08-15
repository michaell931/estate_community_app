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
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('AKTUALNOŚCI'),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return ListView(
            children: const [
              NewsWidget('News 1'),
              NewsWidget('News 2'),
              NewsWidget('News 3'),
              NewsWidget('News 4'),
            ],
          );
        }
        if (currentIndex == 1) {
          return const Center(
            child: Text('Mapa parkingu'),
          );
        }
        if (currentIndex == 2) {
          return const Center(
            child: Text('Forum'),
          );
        }
        if (currentIndex == 3) {
          return const Center(
            child: Text('Odpady'),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Jesteś zalogowany jako ${widget.user.email}'),
              const SizedBox(
                height: 20,
              ),
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
              icon: Icon(Icons.newspaper), label: 'Aktualności'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_parking), label: 'Mapa parkingu'),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Forum'),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Odpady'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Moje konto'),
        ],
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.blue,
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 217, 159, 145),
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(30),
      child: Text(title),
    );
  }
}
