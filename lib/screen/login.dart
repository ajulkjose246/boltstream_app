import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

TextEditingController UEmail = TextEditingController();
TextEditingController UPassword = TextEditingController();
void loginUser() async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: UEmail.text, password: UPassword.text);
}

// ignore: camel_case_types
class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/R.666922dc6222464f97293cd1465c67e1?rik=wJLQDa63YTJB%2bA&pid=ImgRaw&r=0'),
                  // child: Icon(Icons.image_outlined)
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
                        loginUser();
                      },
                      child: Text("Login"),
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                      onPressed: () {}, child: Text("Forgotten password?"))),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    width: 400,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text("Create New Account"),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
