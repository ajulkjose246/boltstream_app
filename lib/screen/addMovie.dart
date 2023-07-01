import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class addMovieScreen extends StatefulWidget {
  const addMovieScreen({super.key});

  @override
  State<addMovieScreen> createState() => _addMovieScreenState();
}

final CollectionReference movies =
    FirebaseFirestore.instance.collection("Movies");
TextEditingController MName = TextEditingController();
TextEditingController MLanguage = TextEditingController();
TextEditingController MImage = TextEditingController();
TextEditingController MTrailer = TextEditingController();
TextEditingController MDiscription = TextEditingController();
TextEditingController MImdb = TextEditingController();
void addMovie() {
  final data = {
    'MName': MName.text,
    'MLanguage': MLanguage.text,
    'MImage': MImage.text,
    'MTrailer': MTrailer.text,
    'MDiscription': MImage.text,
    'MImdb': MTrailer.text
  };
  movies.add(data);
}

class _addMovieScreenState extends State<addMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Movie"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: MName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Movie Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: MLanguage,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Movie Language"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: MImage,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Movie Image"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: MTrailer,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Movie Trailer"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: MDiscription,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Movie Discription"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: MImdb,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Movie IMDB"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    addMovie();
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text("Add Movie")),
            )
          ],
        ));
  }
}
