import 'package:estate_community_app/app/features/add/add_page.dart';
import 'package:estate_community_app/app/features/forum/forum_page.dart';
import 'package:estate_community_app/app/features/news/news_page.dart';
import 'package:estate_community_app/app/features/parking/parkingplan_page.dart';
import 'package:estate_community_app/app/features/user/user_page.dart';
import 'package:estate_community_app/app/features/waste/waste_page.dart';
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
          Builder(builder: (context) {
            if (currentIndex == 2) {
              return IconButton(
                  icon: const Icon(Icons.add, color: Colors.white, size: 34.0),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const AddPage(),
                    ));
                  });
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Zgłoś',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
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
