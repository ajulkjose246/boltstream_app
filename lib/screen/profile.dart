import 'package:flutter/material.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/R.5c80dbe394c9e7c9244442e0cd854681?rik=t2ZiCS6uJ%2f4YIA&pid=ImgRaw&r=0'),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(hintText: "s"),
              ),
            )
          ],
        )
      ],
    );
  }
}
