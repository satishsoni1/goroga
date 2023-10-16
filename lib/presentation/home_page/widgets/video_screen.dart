import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  double _sliderValue = 0.0;
  double customAspectRatio = 16 / 9;
  String _videoPosition = '0:00 / 0:00';
  bool _showControls = true;
  bool isConnected = true;
  @override
  void initState() {
    super.initState();
    checkNetworkConnectivity();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.

    _controller = VideoPlayerController.network(
      widget.videoUrl,
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    // Set up listener for video position changes.
    _controller.addListener(() {
      setState(() {
        _sliderValue = _controller.value.position.inSeconds.toDouble();
        _videoPosition =
            '${_formatDuration(_controller.value.position)} / ${_formatDuration(_controller.value.duration)}';
      });
    });
    _controller.addListener(() {
      setState(() {
        _sliderValue = _controller.value.position.inSeconds.toDouble();
      });
    });
    _controller.play().then((_) {
      // Calculate the custom aspect ratio based on the device's screen dimensions.
      setState(() {
        customAspectRatio = MediaQuery.of(context).size.height/
            MediaQuery.of(context).size.width+0.295;
      });
    });

    // Set the preferred orientation to landscape when the video starts playing.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Start playing the video when the page is loaded.
    _controller.play();
  }

  void checkNetworkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isConnected = false; // No network connection
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    // Reset the preferred orientation to portrait when the page is disposed.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isConnected) {
       return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
    } else {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTap: () {
              setState(() {
                _showControls = !_showControls;
              });
            },
            child: OrientationBuilder(
              builder: (context, orientation) {
                return Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: customAspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    Visibility(
                      visible: _showControls,
                      child: Positioned(
                        top: 20, // Adjust the top position as needed
                        left: 20, // Adjust the left position as needed
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white, // Customize the arrow color
                            size: 32, // Customize the arrow size
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _showControls,
                      child: Positioned(
                        bottom: 20.0, // Adjust the position as needed
                        left: 0.0,
                        right: 0.0,
                        child: Slider(
                          activeColor: Colors.white,
                          value: _sliderValue,
                          min: 0,
                          max: _controller.value.duration.inSeconds.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              _sliderValue = value;
                            });
                            final Duration position =
                                Duration(seconds: value.toInt());
                            _controller.seekTo(position);
                          },
                        ),
                      ),
                    ),
      
                    Visibility(
                      visible: _showControls,
                      child: Positioned(
                        bottom: 20.0, // Adjust the position as needed
                        left: 25.0,
                        right: 0.0,
                        child: Container(
                          child: Text(
                            _videoPosition,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    // floatingActionButton: FloatingActionButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       if (_controller.value.isPlaying) {
                    //         _controller.pause();
                    //       } else {
                    //         _controller.play();
                    //       }
                    //     });
                    //   },
      
                    // ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
