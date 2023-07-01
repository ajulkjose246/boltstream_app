import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addTVScreen extends StatefulWidget {
  const addTVScreen({super.key});

  @override
  State<addTVScreen> createState() => _addTVScreenState();
}

final CollectionReference liveTV =
    FirebaseFirestore.instance.collection("LiveTV");
TextEditingController CLogo = TextEditingController();
TextEditingController CName = TextEditingController();
TextEditingController CStream = TextEditingController();
void addLiveTV() {
  final data = {
    'CLogo': CLogo.text,
    'CName': CName.text,
    'CStream': CStream.text,
  };
  liveTV.add(data);
}

class _addTVScreenState extends State<addTVScreen> {
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
                controller: CLogo,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Logo Url"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: CName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Live TV Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: CStream,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Live TV Stream Url"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    addLiveTV();
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text("Add Live TV")),
            )
          ],
        ));
  }
}
