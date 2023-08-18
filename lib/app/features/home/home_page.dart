import 'package:cloud_firestore/cloud_firestore.dart';
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
        actions: [
          IconButton(
              icon: const Icon(Icons.add, color: Colors.white, size: 34.0),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('forum')
                    .add({'title': 'Post'});
              }),
        ],
        title: const Text('Witaj!'),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const NewsList();
        }
        if (currentIndex == 1) {
          return const ParkingPlan();
        }
        if (currentIndex == 2) {
          return const ForumPage();
        }
        if (currentIndex == 3) {
          return const WastePage();
        }
        return UserPage(email: widget.user.email);
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

class UserPage extends StatelessWidget {
  const UserPage({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Jesteś zalogowany jako $email',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
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
  }
}

class WastePage extends StatelessWidget {
  const WastePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage('images/smieci.jpg'),
      ),
    );
  }
}

class ForumPage extends StatelessWidget {
  const ForumPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('forum').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Wystąpił nieoczekiwany problem');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Proszę czekać, trwa ładowanie');
          }

          final documents = snapshot.data!.docs;
          return ListView(
            children: [
              for (final document in documents) ...[
                Dismissible(
                  key: ValueKey(document.id),
                  onDismissed: (_) {
                    FirebaseFirestore.instance
                        .collection('forum')
                        .doc(document.id)
                        .delete();
                  },
                  child: NewsWidget(
                    document['title'],
                  ),
                ),
              ],
            ],
          );
        });
  }
}

class ParkingPlan extends StatelessWidget {
  const ParkingPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      child: const Center(
        child: Image(image: AssetImage('images/parkingplan.jpg')),
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('news').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Wystąpił nieoczekiwany problem');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Proszę czekać, trwa ładowanie');
          }

          final documents = snapshot.data!.docs;
          return ListView(
            children: [
              for (final document in documents) ...[
                NewsWidget(document['title']),
              ],
            ],
          );
        });
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
      color: const Color.fromARGB(255, 103, 209, 120),
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(20),
      child: Text(title),
    );
  }
}
