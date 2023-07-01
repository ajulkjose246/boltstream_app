import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  final CollectionReference registerCollection =
      FirebaseFirestore.instance.collection("Register");

  TextEditingController UName = TextEditingController();
  TextEditingController UEmail = TextEditingController();
  TextEditingController UPhone = TextEditingController();
  TextEditingController UPassword = TextEditingController();

  String userId = "";

  void registerUser() {
    final user = {
      'UName': UName.text,
      'UEmail': UEmail.text,
      'UPhone': UPhone.text,
      'UPassword': UPassword.text,
    };

    registerCollection.add(user).then((docRef) {
      setState(() {
        userId = docRef.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: ListView(
        children: [
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/R.5c80dbe394c9e7c9244442e0cd854681?rik=t2ZiCS6uJ%2f4YIA&pid=ImgRaw&r=0'),
                  // child: Icon(Icons.image_outlined)
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: UName,
              decoration: InputDecoration(
                  hintText: "Enter Name", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: UEmail,
              decoration: InputDecoration(
                  hintText: "Enter Email Id", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: UPhone,
              decoration: InputDecoration(
                  hintText: "Enter Phone Number", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: UPassword,
              decoration: InputDecoration(
                  hintText: "Enter Password", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  registerUser();
                  Navigator.of(context).pushNamed('/', arguments: userId);
                  // Navigator.pushNamed(context, "/");
                },
                child: Text("Register Now"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(userId),
          ),
        ],
      ),
    );
  }
}
