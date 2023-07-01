import 'package:boltstream/screen/login.dart';
import 'package:flutter/material.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.exit_to_app),
        title: Text("Register"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/R.5c80dbe394c9e7c9244442e0cd854681?rik=t2ZiCS6uJ%2f4YIA&pid=ImgRaw&r=0'),
                    child: Icon(Icons.image_outlined)),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter Name", border: OutlineInputBorder()),
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
                  hintText: "Enter Phone Number", border: OutlineInputBorder()),
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
                  child: Text("Register Now"),
                )),
          ),
        ],
      ),
    );
  }
}
