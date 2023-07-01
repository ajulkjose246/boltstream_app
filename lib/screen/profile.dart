import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

final user = FirebaseAuth.instance.currentUser!;
void logout() {
  FirebaseAuth.instance.signOut();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/R.666922dc6222464f97293cd1465c67e1?rik=wJLQDa63YTJB%2bA&pid=ImgRaw&r=0'),
              ),
            ),
            Text(
              user.email!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            Container(
              width: 400,
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      onPressed: () {
                        logout();
                      },
                      child: Text("LogOut"))),
            )
          ],
        )
      ],
    );
  }
}
