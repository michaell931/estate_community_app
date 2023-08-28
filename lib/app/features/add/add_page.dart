import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estate_community_app/app/features/forum/forum_page.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        //przycisk + do ustalenia
        // actions: [
        //   IconButton(
        //       icon: const Icon(Icons.add, color: Colors.white, size: 34.0),
        //       onPressed: () {
        //         FirebaseFirestore.instance.collection('forum').add({
        //           'theme': postTheme,
        //           'content': postContent,
        //         });
        //       }),
        // ],
        title: const Text('Dodaj nowy post'),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
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
                      postTheme = newValue;
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
                  keyboardType: TextInputType.text,
                  minLines: 1,
                  maxLines: 9,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.newspaper),
                    labelText: 'Treść posta',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      postContent = newValue;
                    });
                  },
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: postTheme.isEmpty || postContent.isEmpty
                          ? null
                          : () async {
                              await FirebaseFirestore.instance
                                  .collection('forum')
                                  .add({
                                'theme': postTheme,
                                'content': postContent,
                              });
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop(
                                MaterialPageRoute(
                                  builder: (_) => const ForumPage(),
                                ),
                              );
                            },
                      child: const Text('Dodaj post')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (_) => const ForumPage(),
                          ),
                        );
                      },
                      child: const Text('Powrót bez zapisu')),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
