import 'package:boltstream/screen/addMovie.dart';
import 'package:boltstream/screen/auth.dart';
import 'package:boltstream/screen/home.dart';
import 'package:boltstream/screen/login.dart';
import 'package:boltstream/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(boltStream());
}

class boltStream extends StatefulWidget {
  const boltStream({super.key});

  @override
  State<boltStream> createState() => _boltStreamState();
}

class _boltStreamState extends State<boltStream> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bolt Stream",
      routes: {
        '/': (context) => homeScreen(),
        '/addMovie': (context) => addMovieScreen(),
        '/register': (context) => registerScreen(),
        '/login': (context) => loginScreen(),
        '/auth': (context) => userAuth(),
      },
      initialRoute: '/',
    );
  }
}
