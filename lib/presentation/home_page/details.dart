import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/home_page/widgets/video_screen.dart';

class DetailPage extends StatefulWidget {
  final dynamic data;

  DetailPage({
    required this.data,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  int _isFvoritedCount = 0;
  List<dynamic> favoriteDataList = [];



  void _toggleFavorite() {
    setState(() {
      if (isFavorite) {
        _isFvoritedCount -= 1;
        isFavorite = false;
        favoriteDataList.remove(favoriteDataList);
      } else {
        _isFvoritedCount += 1;
        isFavorite = true;
        favoriteDataList.add(widget.data);
        print("favoriteDataList : ${favoriteDataList}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: CustomAppBar(
      //   height: getVerticalSize(51),
      //   leadingWidth: 52,
      //   leading: AppbarImage(
      //     height: getSize(28),
      //     width: getSize(28),
      //     svgPath: ImageConstant.imgArrowleft,
      //     margin: getMargin(left: 24, top: 10, bottom: 13),
      //     onTap: () {
      //       Get.back();
      //     },
      //   ),
      // ),
      body: Column(children: [
        Stack(
          children: [
            Image.asset(
              widget.data.imageUrl
                  .toString(), // Display the image using the received image path
              height: MediaQuery.of(context).size.height / 2 -
                  20, // Adjust the height as needed
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              // Adjust the width as needed
            ),
            Positioned(
              top: 20, // Adjust the top position as needed
              left: 20, // Adjust the left position as needed
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white, // Customize the arrow color
                  size: 32, // Customize the arrow size
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 50,
              left: 50,
              bottom: 50,
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    VideoPlayerScreen(
                        videoUrl: widget.data.videoUrl.toString()),
                  );
                  // Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.play_circle_fill_sharp,
                  color: Colors.white, // Customize the arrow color
                  size: 60, // Customize the arrow size
                ),
              ),
            ),

            // Add other widgets to display details here.
          ],
        ),
        SizedBox(
          width: 200,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Text(
                widget.data.title.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.data.author.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              // IconButton(
              //   icon: Icon(
              //     isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
              //     color: Color.fromARGB(
              //         240, 11, 139, 130), // Customize the favorite icon color
              //   ),
              //   onPressed: _toggleFavorite,
              // ),
            ]),
          ),
        ),
        widget.data.description != ""
            ? Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About This Session',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.data.description.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )
            : Container(),
      ]),
    ));
  }
}
