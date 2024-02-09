import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// class SplashScreen extends GetWidget<SplashController> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             backgroundColor: ColorConstant.whiteA700,
//             body: Container(
//               alignment: Alignment.center,
//               child: CustomImageView(
//                   imagePath: ImageConstant.imgLogo,
//                   margin: getMargin(all: 100)),
//             )));
//   }
// }
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/Go-Roga.mp4')
      ..initialize().then((_) {
        setState(() {
          print('video is stopped');
        });
      });
    _controller.addListener(() async {
      if (_controller.value.isPlaying &&
          _controller.value.position == _controller.value.duration) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        // sharedPreferences.setBool('isLogin', false);
        var isLoggedIn = sharedPreferences.getBool('isLogin') ?? false;

        // print(sharedPreferences.getString("isLogin"));

        Future.delayed(const Duration(milliseconds: 5000), () {
          //Get.toNamed(AppRoutes.homeContainerScreen);
          if (isLoggedIn) {
            Get.offNamed(AppRoutes.homeContainerScreen);
            // AppRoutes.homeContainerScreen;
          } else {
            Get.offNamed(
              AppRoutes.signInScreen,
              // AppRoutes.homeContainerScreen,
            );
          }
        });
      }
    });
    _controller.play();
    print("video");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = screenWidth / screenHeight;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: aspectRatio,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size?.width ?? 0,
                        height: _controller.value.size?.height ?? 0,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : CircularProgressIndicator(),
        )
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
