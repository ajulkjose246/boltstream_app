import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class watchlaterScreen extends StatefulWidget {
  const watchlaterScreen({super.key});

  @override
  State<watchlaterScreen> createState() => _watchlaterScreenState();
}

final CollectionReference watchlater =
    FirebaseFirestore.instance.collection("WatchLater");

final CollectionReference movies =
    FirebaseFirestore.instance.collection("Movies");
final user = FirebaseAuth.instance.currentUser;
void removeWL(id) {
  watchlater.doc(id).delete();
}

class _watchlaterScreenState extends State<watchlaterScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: watchlater.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot watchLaterSnap =
                  snapshot.data!.docs[index];
              if (watchLaterSnap['UID'] == user!.email!) {
                return FutureBuilder(
                  future: movies.doc(watchLaterSnap['MID']).get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final movieDetails = snapshot.data!;
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: ListTile(
                              leading: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      movieDetails['MImage'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(movieDetails['MName']),
                              trailing: IconButton(
                                  onPressed: () {
                                    removeWL(watchLaterSnap.id);
                                  },
                                  icon: Icon(Icons.close_outlined)),
                              subtitle: Text(movieDetails['MLanguage']),
                              onTap: () {
                                // Handle onTap event
                              },
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Container();
                    }
                  },
                );
              }
              return Container();
            },
          );
        }
        return Container();
      },
    );
  }
}
