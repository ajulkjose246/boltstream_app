// Movies Screen
// bottom navbar first page

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class moviesScreen extends StatefulWidget {
  const moviesScreen({super.key});

  @override
  State<moviesScreen> createState() => _moviesScreenState();
}

final CollectionReference movies =
    FirebaseFirestore.instance.collection("Movies");

final CollectionReference watchlaterCollection =
    FirebaseFirestore.instance.collection("WatchLater");

final user = FirebaseAuth.instance.currentUser;

class _moviesScreenState extends State<moviesScreen> {
  @override
  Widget build(BuildContext context) {
    bool wlIcon;
    if (user == null) {
      wlIcon = false;
    } else {
      wlIcon = true;
    }

    void addWatchLater(String mid) async {
      final data = {
        'UID': user!.email!,
        'MID': mid,
      };

      final querySnapshot = await watchlaterCollection
          .where('UID', isEqualTo: user!.email!)
          .where('MID', isEqualTo: mid)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // Data does not exist, add it to the collection
        watchlaterCollection.add(data);
      } else {
        // Data already exists
        print('Data already exists in Watchlater collection');
      }
    }

    return StreamBuilder(
      stream: movies.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot movieSnap = snapshot.data!.docs[index];
              return Container(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile(
                    leading: Container(
                      width: 80, // Set the desired width
                      height: 80, // Set the desired height
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(movieSnap[
                              'MImage']), // Replace with your image asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(movieSnap['MName']),
                    subtitle: Text(movieSnap['MLanguage']),
                    trailing: wlIcon
                        ? IconButton(
                            tooltip: "Add To Watch Later",
                            color: Colors.blue,
                            onPressed: () {
                              addWatchLater(movieSnap.id);
                            },
                            icon: Icon(Icons.watch_later),
                          )
                        : Icon(Icons.home),
                    onTap: () {
                      // Handle onTap event
                    },
                  ),
                ),
              ));
            },
          );
        }
        return Container();
      },
    );
  }
}
