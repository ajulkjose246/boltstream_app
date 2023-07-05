import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

final CollectionReference movies =
    FirebaseFirestore.instance.collection("Movies");

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('');
    _initializeVideoController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializeVideoController() async {
    try {
      await _controller.initialize();
      setState(() {
        _isVideoInitialized = true;
      });
    } catch (error) {
      print('Error initializing video player: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String documentId =
        ModalRoute.of(context)!.settings.arguments as String;

    return FutureBuilder<DocumentSnapshot>(
      future: movies.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData) {
          final movieData = snapshot.data!.data() as Map<String, dynamic>?;

          if (movieData != null) {
            final String MUrl = movieData['MTrailer'] as String;
            final String MName = movieData['MName'] as String;
            final String MLanguage = movieData['MLanguage'] as String;
            final String MImdb = movieData['MImdb'] as String;
            final String MDiscription = movieData['MDiscription'] as String;
            if (_controller.dataSource != MUrl) {
              _controller = VideoPlayerController.network(MUrl);
              _initializeVideoController();
            }
            return Scaffold(
              appBar: AppBar(
                title: Text(MName),
              ),
              body: Column(
                children: [
                  _isVideoInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Language : ${MLanguage}",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "IMDB : ${MImdb}",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          MDiscription,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            );
          } else {
            return Text('Movie data is null');
          }
        }
        return Container();
      },
    );
  }
}
