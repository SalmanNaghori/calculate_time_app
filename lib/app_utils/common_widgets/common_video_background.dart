import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CommonVideoBG extends StatefulWidget {
  final String videoPath;

  const CommonVideoBG({super.key, required this.videoPath});

  @override
  State<CommonVideoBG> createState() => _CommonVideoBGState();
}

class _CommonVideoBGState extends State<CommonVideoBG> with WidgetsBindingObserver {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = VideoPlayerController.asset(widget.videoPath, videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {}); // Trigger a rebuild once the video is initialized
      });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    log("State: : : $state");
    if (state == AppLifecycleState.paused || state == AppLifecycleState.hidden || state == AppLifecycleState.inactive) {
      _controller.pause();
    } else if (state == AppLifecycleState.resumed) {
      _controller.play();
    } else if (state == AppLifecycleState.detached) {
      _controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
        : Container();
  }
}
