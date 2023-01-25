import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerFileCustom extends StatefulWidget {
  VideoPlayerFileCustom({Key? key, this.videoPath}) : super(key: key);
  final String? videoPath;

  @override
  _VideoPlayerFileState createState() => _VideoPlayerFileState();
}

//videoplayerfilestate class
class _VideoPlayerFileState extends State<VideoPlayerFileCustom> {
  VideoPlayerController? _controller;
  Future<void>? _video;

  @override
  void initState() {
    super.initState();
    setState(() {
      _controller = VideoPlayerController.file(File(widget.videoPath!));
      _video = _controller!.initialize();
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.amber,
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 70,
              child: Container(
                width: 40,
                height: 40,
                child: FloatingActionButton(
                  onPressed: () {
                    if (_controller!.value.isPlaying) {
                      setState(() {
                        _controller!.pause();
                      });
                    } else {
                      setState(() {
                        _controller!.play();
                      });
                    }
                  },
                  child: Icon(_controller!.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow),
                ),
              ),
            )
          ],
        ));
  }
}
