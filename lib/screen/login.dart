import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/R.5c80dbe394c9e7c9244442e0cd854681?rik=t2ZiCS6uJ%2f4YIA&pid=ImgRaw&r=0'),
                // child: Icon(Icons.image_outlined)
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter Email Id", border: OutlineInputBorder()),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter Password", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {},
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
    );
  }
}
