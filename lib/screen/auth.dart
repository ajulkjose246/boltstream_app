import 'package:boltstream/screen/login.dart';
import 'package:boltstream/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userAuth extends StatelessWidget {
  const userAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return profileScreen();
          } else {
            return loginScreen();
          }
        },
      ),
    );
  }
}
