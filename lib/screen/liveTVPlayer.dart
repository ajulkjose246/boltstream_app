import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class LiveTVPlayerScreen extends StatefulWidget {
  const LiveTVPlayerScreen({Key? key}) : super(key: key);

  @override
  _LiveTVPlayerScreenState createState() => _LiveTVPlayerScreenState();
}

final CollectionReference LiveTV =
    FirebaseFirestore.instance.collection("LiveTV");

class _LiveTVPlayerScreenState extends State<LiveTVPlayerScreen> {
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
      future: LiveTV.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData) {
          final TVData = snapshot.data!.data() as Map<String, dynamic>?;

          if (TVData != null) {
            final String CName = TVData['CName'] as String;
            final String CStream = TVData['CStream'] as String;

            if (_controller.dataSource != CStream) {
              _controller = VideoPlayerController.network(CStream);
              _initializeVideoController();
            }
            return Scaffold(
              appBar: AppBar(
                title: Text(CName),
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
                          CName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 8),
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
