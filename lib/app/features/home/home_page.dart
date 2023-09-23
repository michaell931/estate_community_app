import 'package:estate_community_app/app/features/about/about_page.dart';
import 'package:estate_community_app/app/features/add/add_page.dart';
import 'package:estate_community_app/app/features/auth/pages/user_profile.dart';
import 'package:estate_community_app/app/features/forum/forum_page.dart';
import 'package:estate_community_app/app/features/news/news_page.dart';
import 'package:estate_community_app/app/features/parking/parkingplan_page.dart';
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
      backgroundColor: Colors.black,
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
            }
            if (currentIndex == 1) {
              return Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Mapa parkingu osiedla',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            }
            if (currentIndex == 3) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Segreguj śmieci!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const AboutPage(),
                  ));
                },
                child: const Icon(
                  Icons.info,
                  color: Colors.blue,
                  size: 35,
                ),
              );
            }
          }),
        ],
        title: const Text(
          'Witaj!',
          style: TextStyle(
              color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const NewsList();
        }
        if (currentIndex == 1) {
          return const ParkingPlan(
            imageUrl: 'http://mieszkaniajaworze.pl/images/2022/05/04/pzt.jpg',
          );
        }
        if (currentIndex == 2) {
          return const ForumPage();
        }
        if (currentIndex == 3) {
          return const WastePage();
        }
        return const UserProfile();
      }),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(bodySmall: const TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
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
                icon: Icon(Icons.person), label: 'Użytkownik'),
          ],
        ),
      ),
    );
  }
}
