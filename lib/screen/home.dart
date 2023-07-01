import 'package:boltstream/screen/liveTV.dart';
import 'package:boltstream/screen/login.dart';
import 'package:boltstream/screen/movies.dart';
import 'package:boltstream/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

final CollectionReference movies =
    FirebaseFirestore.instance.collection("Movies");

class _homeScreenState extends State<homeScreen> {
  int indexNum = 0;
  bool actionIcon = false;
  List homeScreens = const [
    moviesScreen(),
    livetvScreen(),
    loginScreen(),
    Text("4")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bolt Stream"),
        leading: Icon(Icons.movie),
        actions: actionIcon
            ? []
            : [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/addMovie");
                  },
                  icon: Icon(Icons.add),
                )
              ],
      ),
      body: homeScreens.elementAt(indexNum),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_outlined),
              label: 'Movies',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: 'Live TV',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'Profile',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
              backgroundColor: Colors.blue),
        ],
        currentIndex: indexNum,
        onTap: (val) {
          setState(() {
            if (val == 2) {
              actionIcon = true;
            } else {
              actionIcon = false;
            }
            indexNum = val;
          });
        },
      ),
    );
  }
}
