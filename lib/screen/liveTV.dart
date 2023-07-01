// Movies Screen
// bottom navbar first page

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class livetvScreen extends StatefulWidget {
  const livetvScreen({super.key});

  @override
  State<livetvScreen> createState() => _livetvScreenState();
}

final CollectionReference LiveTV =
    FirebaseFirestore.instance.collection("LiveTV");

class _livetvScreenState extends State<livetvScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: LiveTV.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot LiveTVSnap = snapshot.data!.docs[index];
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
                          image: NetworkImage(LiveTVSnap[
                              'CLogo']), // Replace with your image asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(LiveTVSnap['CName']),
                    // subtitle: Text(LiveTVSnap['MLanguage']),
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
