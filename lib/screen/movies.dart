// Movies Screen
// bottom navbar first page

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class moviesScreen extends StatefulWidget {
  const moviesScreen({super.key});

  @override
  State<moviesScreen> createState() => _moviesScreenState();
}

final CollectionReference movies =
    FirebaseFirestore.instance.collection("Movies");

class _moviesScreenState extends State<moviesScreen> {
  @override
  Widget build(BuildContext context) {
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
                    trailing: Icon(Icons.more_vert),
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
