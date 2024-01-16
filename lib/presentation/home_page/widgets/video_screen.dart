import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/home_page/widgets/afterSession.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideoPlayerScreen extends StatefulWidget {
  final dynamic data;

  VideoPlayerScreen({Key? key, required this.data,}) : super(key: key);

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

    _controller = VideoPlayerController.network(
      widget.data.videoUrl.toString(),
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
      setState(() {
        customAspectRatio = MediaQuery.of(context).size.height /
                MediaQuery.of(context).size.width +
            0.295;
      });
    });

    // Set the preferred orientation to landscape when the video starts playing.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _controller.play();
  }

  void checkNetworkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isConnected = false;
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
                        top: 20,
                        left: 20,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: MediaQuery.sizeOf(context).width / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    widget.data.author.toString(),
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    widget.data.title.toString(),
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    textStyle: TextStyle(color: Colors.white),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Get.back();
                                    Get.offAll(()=>afterSession(data: widget.data));
                                  },
                                  child: Text("End Session")),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _showControls,
                      child: Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _controller.seekTo(Duration(
                                      seconds: _sliderValue.toInt() - 10));
                                },
                                icon: Icon(Icons.fast_rewind,
                                    color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_controller.value.isPlaying) {
                                      _controller.pause();
                                    } else {
                                      _controller.play();
                                    }
                                  });
                                },
                                icon: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _controller.seekTo(Duration(
                                      seconds: _sliderValue.toInt() + 10));
                                },
                                icon: Icon(Icons.fast_forward,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Visibility(
                      visible: _showControls,
                      child: Positioned(
                        bottom: 30.0,
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
                        bottom: 20.0,
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
