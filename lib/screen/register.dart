import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  final CollectionReference registerCollection =
      FirebaseFirestore.instance.collection("Register");

  TextEditingController UEmail = TextEditingController();
  TextEditingController UPassword = TextEditingController();
  TextEditingController UCPassword = TextEditingController();

  void registerUser() async {
    if (UPassword.text == UCPassword.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: UEmail.text, password: UPassword.text);
    }
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
                      'https://th.bing.com/th/id/R.666922dc6222464f97293cd1465c67e1?rik=wJLQDa63YTJB%2bA&pid=ImgRaw&r=0'),
                  // child: Icon(Icons.image_outlined)
                ),
              ),
            ],
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
              controller: UPassword,
              decoration: InputDecoration(
                  hintText: "Enter Password", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: UCPassword,
              decoration: InputDecoration(
                  hintText: "Confirm Password", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  registerUser();
                  Navigator.pushNamed(context, "/login");
                },
                child: Text("Register Now"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}
