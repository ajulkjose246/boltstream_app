import 'package:boltstream/screen/auth.dart';
import 'package:boltstream/screen/liveTV.dart';
import 'package:boltstream/screen/movies.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  String addPage = "/addMovie";
  List homeScreens = const [
    moviesScreen(),
    livetvScreen(),
    Text("Watch Later"),
    userAuth(),
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
                  tooltip: "Add",
                  onPressed: () {
                    Navigator.pushNamed(context, addPage);
                  },
                  icon: Icon(Icons.add),
                )
              ],
      ),
      body: homeScreens.elementAt(indexNum),
      // body: homeScreens.elementAt(indexNum),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              tooltip: "Movies",
              icon: Icon(Icons.movie_outlined),
              label: 'Movies',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              tooltip: "Live TV",
              icon: Icon(Icons.tv),
              label: 'Live TV',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              tooltip: "Watch Later",
              icon: Icon(Icons.watch_later_outlined),
              label: 'Watch Later',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              tooltip: "Profile",
              icon: Icon(Icons.person_outlined),
              label: 'Profile',
              backgroundColor: Colors.blue),
        ],
        currentIndex: indexNum,
        onTap: (val) {
          setState(() {
            if (val == 2) {
              actionIcon = true;
            } else if (val == 3) {
              actionIcon = true;
            } else {
              actionIcon = false;
            }
            if (val == 1) {
              addPage = "/addTV";
            } else {
              addPage = "/addMovie";
            }
            indexNum = val;
          });
        },
      ),
    );
  }
}
