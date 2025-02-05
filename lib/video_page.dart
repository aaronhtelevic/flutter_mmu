import 'package:flutter/material.dart';
import 'package:flutterpi_gstreamer_video_player/flutterpi_gstreamer_video_player.dart';
import 'package:video_player/video_player.dart';
import 'dart:io' as io;

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _pickVideo();
  }

  Future<void> _pickVideo() async {
    // io.File file = io.File('/home/root/video1.mp4');
    _controller = FlutterpiVideoPlayerController.withGstreamerPipeline(
        'filesrc location=/home/root/video1.mp4 ! decodebin ! videoscale ! videoconvert ! video/x-raw,width=1280,height=720 ! appsink name="sink"');

    await _controller!.initialize();
    setState(() {});
    _controller!.play();
  }

  Future<void> _pickTestSource() async {
    _controller = FlutterpiVideoPlayerController.withGstreamerPipeline(
        'videotestsrc ! videoconvert ! videoscale ! appsink name="sink"');

    await _controller!.initialize();
    setState(() {});
    _controller!.play();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Flexible(
            flex: 5,
            child: Center(
              child: _controller != null && _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : CircularProgressIndicator(),
            )),
        Flexible(
          flex: 1,
          child: Row(children: [
            IconButton(
              icon: Icon(Icons.skip_previous),
              onPressed: () {
                _controller!.seekTo(Duration.zero);
              },
            ),
            IconButton(
              icon: Icon(_controller!.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow),
              onPressed: () {
                setState(() {
                  _controller!.value.isPlaying
                      ? _controller!.pause()
                      : _controller!.play();
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.movie),
              onPressed: () {
                setState(() {
                  _controller!.dispose();
                  _pickVideo();
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {
                setState(() {
                  _controller!.dispose();
                  _pickTestSource();
                });
              },
            ),
          ]),
        )
      ]),
    );
  }
}
