import 'package:goroga/presentation/explore_page/models/program_model.dart';
import 'package:goroga/presentation/home_page/details.dart';

import 'controller/podcasts_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';

// ignore: must_be_immutable
class PodcastsScreen extends GetWidget<PodcastsController> {
  // late String imagePath;
  // late String duration;
  // late String title;
  // late String description;
  // late String authorName;

  // late List<Data>? data;
  final Programs programsData;

  PodcastsScreen(
      {
      //   required this.imagePath,
      // this.data,
      // required this.duration,
      // required this.title,
      // required this.description,
      // required this.authorName,
      required this.programsData});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text("eded"),
    // );
    return SafeArea(
      child: Scaffold(
          // backgroundColor: ColorConstant.whiteA700,
          // appBar: CustomAppBar(

          //     height: getVerticalSize(60),
          //     leadingWidth: 52,
          //     leading: AppbarImage(
          //         height: getSize(28),
          //         width: getSize(28),
          //         svgPath: ImageConstant.imgArrowleft,
          //         margin: getMargin(left: 24),
          //         onTap: () {
          //           Get.back();
          //         }
          //         ),

          //     title: AppbarTitle(
          //         text: "lbl_podcasts".tr, margin: getMargin(left: 16)
          //         ),

          // actions: [
          //   AppbarImage(
          //       height: getSize(28),
          //       width: getSize(28),
          //       svgPath: ImageConstant.imgSearch,
          //       margin: getMargin(left: 24)),
          //   AppbarImage(
          //       height: getSize(28),
          //       width: getSize(28),
          //       svgPath: ImageConstant.imgSettings,
          //       margin: getMargin(left: 20)),
          //   AppbarImage(
          //       height: getSize(28),
          //       width: getSize(28),
          //       svgPath: ImageConstant.imgClock28x28,
          //       margin: getMargin(left: 20, right: 24))
          // ]
          // ),
          body: Column(children: [
        Stack(
          children: [
            Image.asset(
              programsData.imageUrl
                  .toString(), // Display the image using the received image path
              height: MediaQuery.of(context).size.height /
                  4, // Adjust the height as needed
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
              bottom: 20, // Adjust the top position as needed
              right: 20, // Adjust the left position as needed
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  programsData.duration
                      .toString(), // Replace with your time data
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            // Add other widgets to display details here.
          ],
        ),

        // SizedBox(
        //     // width: size.width,
        //     child: SingleChildScrollView(
        //         child: Padding(
        //             padding: getPadding(left: 24, top: 0, bottom: 5),
        //             child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 children: [
        //                   // Padding(
        //                   //     padding: getPadding(right: 24),
        //                   //     child: Row(
        //                   //         mainAxisAlignment:
        //                   //             MainAxisAlignment.spaceBetween,
        //                   //         crossAxisAlignment:
        //                   //             CrossAxisAlignment.start,
        //                   //         children: [
        //                   //           Padding(
        //                   //               padding: getPadding(top: 1),
        //                   //               child: Text(
        //                   //                   "msg_popular_podcast".tr,
        //                   //                   overflow: TextOverflow.ellipsis,
        //                   //                   textAlign: TextAlign.left,
        //                   //                   style: AppStyle
        //                   //                       .txtUrbanistRomanBold24)),
        //                   //           Padding(
        //                   //               padding: getPadding(bottom: 10),
        //                   //               child: Text("lbl_see_all".tr,
        //                   //                   overflow: TextOverflow.ellipsis,
        //                   //                   textAlign: TextAlign.left,
        //                   //                   style: AppStyle
        //                   //                       .txtUrbanistRomanBold16RedA70002
        //                   //                       .copyWith(
        //                   //                           letterSpacing:
        //                   //                               getHorizontalSize(
        //                   //                                   0.2))))
        //                   //         ])),
        //                   // Align(
        //                   //     alignment: Alignment.centerRight,
        //                   //     child: Container(
        //                   //         height: getVerticalSize(233),
        //                   //         child: Obx(() => ListView.separated(
        //                   //             padding: getPadding(top: 13),
        //                   //             scrollDirection: Axis.horizontal,
        //                   //             separatorBuilder: (context, index) {
        //                   //               return SizedBox(
        //                   //                   height: getVerticalSize(12));
        //                   //             },
        //                   //             itemCount: controller
        //                   //                 .podcastsModelObj
        //                   //                 .value
        //                   //                 .listloremipsumdolor1ItemList
        //                   //                 .value
        //                   //                 .length,
        //                   //             itemBuilder: (context, index) {
        //                   //               Listloremipsumdolor1ItemModel
        //                   //                   model = controller
        //                   //                       .podcastsModelObj
        //                   //                       .value
        //                   //                       .listloremipsumdolor1ItemList
        //                   //                       .value[index];
        //                   //               return Listloremipsumdolor1ItemWidget(
        //                   //                   model);
        //                   //             })))),
        //                   // Padding(
        //                   //     padding: getPadding(top: 30, right: 24),
        //                   //     child: Row(
        //                   //         mainAxisAlignment:
        //                   //             MainAxisAlignment.spaceBetween,
        //                   //         crossAxisAlignment:
        //                   //             CrossAxisAlignment.start,
        //                   //         children: [
        //                   //           Padding(
        //                   //               padding: getPadding(top: 1),
        //                   //               child: Text(
        //                   //                   "lbl_popular_artists".tr,
        //                   //                   overflow: TextOverflow.ellipsis,
        //                   //                   textAlign: TextAlign.left,
        //                   //                   style: AppStyle
        //                   //                       .txtUrbanistRomanBold24)),
        //                   //           Padding(
        //                   //               padding: getPadding(bottom: 10),
        //                   //               child: Text("lbl_see_all".tr,
        //                   //                   overflow: TextOverflow.ellipsis,
        //                   //                   textAlign: TextAlign.left,
        //                   //                   style: AppStyle
        //                   //                       .txtUrbanistRomanBold16RedA70002
        //                   //                       .copyWith(
        //                   //                           letterSpacing:
        //                   //                               getHorizontalSize(
        //                   //                                   0.2))))
        //                   //         ])),
        //                   // Align(
        //                   //     alignment: Alignment.centerRight,
        //                   //     child: Container(
        //                   //         height: getVerticalSize(222),
        //                   //         child: Obx(() => ListView.separated(
        //                   //             padding: getPadding(top: 13),
        //                   //             scrollDirection: Axis.horizontal,
        //                   //             separatorBuilder: (context, index) {
        //                   //               return SizedBox(
        //                   //                   height: getVerticalSize(12));
        //                   //             },
        //                   //             itemCount: controller
        //                   //                 .podcastsModelObj
        //                   //                 .value
        //                   //                 .artistsItemList
        //                   //                 .value
        //                   //                 .length,
        //                   //             itemBuilder: (context, index) {
        //                   //               ArtistsItemModel model = controller
        //                   //                   .podcastsModelObj
        //                   //                   .value
        //                   //                   .artistsItemList
        //                   //                   .value[index];
        //                   //               return ArtistsItemWidget(model);
        //                   //             })))),
        //                   // Padding(
        //                   //     padding: getPadding(top: 30, right: 24),
        //                   //     child: Row(
        //                   //         mainAxisAlignment:
        //                   //             MainAxisAlignment.spaceBetween,
        //                   //         crossAxisAlignment:
        //                   //             CrossAxisAlignment.start,
        //                   //         children: [
        //                   // Padding(
        //                   //     padding: getPadding(top: 1),
        //                   //     child: Text("lbl_categories".tr,
        //                   //         overflow: TextOverflow.ellipsis,
        //                   //         textAlign: TextAlign.left,
        //                   //         style: AppStyle
        //                   //             .txtUrbanistRomanBold24)),
        //                   // Padding(
        //                   //     padding: getPadding(bottom: 10),
        //                   //     child: Text("lbl_see_all".tr,
        //                   //         overflow: TextOverflow.ellipsis,
        //                   //         textAlign: TextAlign.left,
        //                   //         style: AppStyle
        //                   //             .txtUrbanistRomanBold16RedA70002
        //                   //             .copyWith(
        //                   //                 letterSpacing:
        //                   //                     getHorizontalSize(
        //                   //                         0.2))))
        //                   // ])),
        //                   Padding(
        //                       padding: getPadding(top: 0, right: 24),
        //                       child: Obx(() => ListView.builder(
        //                           shrinkWrap: true,
        //                           // gridDelegate:
        //                           //     SliverGridDelegateWithFixedCrossAxisCount(
        //                           //         mainAxisExtent:
        //                           //             getVerticalSize(121),
        //                           //         crossAxisCount: 1,
        //                           //         mainAxisSpacing:
        //                           //             getHorizontalSize(12),
        //                           //         crossAxisSpacing:
        //                           //             getHorizontalSize(12)),
        //                           // physics: NeverScrollableScrollPhysics(),
        //                           itemCount: controller.podcastsModelObj.value
        //                               .podcastsItemList.value.length,
        //                           itemBuilder: (context, index) {
        //                             PodcastsItemModel model = controller
        //                                 .podcastsModelObj
        //                                 .value
        //                                 .podcastsItemList
        //                                 .value[index];
        //                             return PodcastsItemWidget(model);
        //                           })))
        //                 ]))))

        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.vertical,
                itemCount: programsData.data!.length +
                    1, // +1 for the additional content
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // First item is the additional content
                    return Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          programsData.title.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          programsData.author.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 0, top: 10),
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                programsData.description.toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 0, top: 20, bottom: 50),
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Session Format",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Video",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    Data currentData = programsData.data![index - 1];
                    // print(currentData);
                    return Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                            onTap: () {
                              // print("tapped");
                              // onTapTypeRoundedC.call();
                              // Get.to(
                              //   () => DetailPage(),
                              //   arguments: {
                              //     "title": currentData.title.toString(),
                              //     "imagePath": currentData.imageUrl.toString(),
                              //     "videoUrl": currentData.videoUrl.toString(),
                              //     "authorName": currentData.author.toString(),
                              //     "description": currentData.description.toString(),
                              //   },
                              // );
                              // Navigator.push(context, MaterialPageRoute(
                              //   builder: (context) {
                              //     return DetailPage(
                              //        data: currentData,);
                              //   },
                              // ));
                               Get.to(()=>DetailPage(data: currentData));
                            },
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    child: Text(
                                      "Session" +
                                          " " +
                                          currentData.id.toString(),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CustomImageView(
                                              imagePath: currentData.imageUrl
                                                  .toString()
                                                  .toString(),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 +
                                                  10,
                                              // fit: BoxFit.cover,
                                              margin: getMargin(
                                                left: 0,
                                                right: 5,
                                                top: 0,
                                              ),
                                              radius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  5,
                                                ),
                                              )),
                                          // Positioned(
                                          //   bottom: 10,
                                          //   left: 10,
                                          //   child: Container(
                                          //     width: 280,
                                          //     alignment: Alignment.bottomLeft,
                                          //     padding: EdgeInsets.all(8),
                                          //     color: Colors.transparent,
                                          //     child: Text(
                                          //       currentData.title.toString(),
                                          //       style: TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize: 16,
                                          //           fontWeight: FontWeight.bold),
                                          //     ),
                                          //   ),
                                          // ),
                                          Positioned(
                                            bottom: 10,
                                            right: 10,
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                currentData.duration
                                                    .toString(), // Replace with your time data
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
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
                                                // Navigator.push(context,
                                                //     MaterialPageRoute(
                                                //   builder: (context) {
                                                //     return DetailPage(
                                                //         title: currentData.title
                                                //             .toString(),
                                                //         imagePath: currentData
                                                //             .imageUrl
                                                //             .toString(),
                                                //         videoUrl: currentData
                                                //             .videoUrl
                                                //             .toString(),
                                                //         authorName: currentData
                                                //             .author
                                                //             .toString(),
                                                //         description: currentData
                                                //             .description
                                                //             .toString());
                                                //   },
                                                // ));
                                                Get.to(() => DetailPage(
                                                      data: currentData,
                                                    ));
                                              },
                                              child: Icon(
                                                Icons.play_circle_fill_sharp,
                                                color: Colors
                                                    .white, // Customize the arrow color
                                                size:
                                                    40, // Customize the arrow size
                                              ),
                                            ),
                                          ),
                                          // Positioned(
                                          //   top: 15,
                                          //   right: 0,
                                          //   child:
                                          //       Container(
                                          //     padding:
                                          //         EdgeInsets.all(
                                          //             8),
                                          //     color: Colors
                                          //         .transparent,
                                          //     child:
                                          //         IconButton(
                                          //       icon: Icon(
                                          //           Icons.arrow_forward),
                                          //       color: Colors
                                          //           .white,
                                          //       onPressed:
                                          //           () {
                                          //         // onTapTypeRoundedC.call();
                                          //         // Add your button's onPressed logic here
                                          //       },
                                          //     ),
                                          //   ),
                                          // )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            currentData.title.toString(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ), // Add spacing between image and text
                                      // Expanded(
                                      //     // child: Padding(
                                      //     //   padding: getPadding(
                                      //     //     top: 21,
                                      //     //     bottom: 76,
                                      //     //   ),
                                      //     child: Row(
                                      //         // padding: EdgeInsets.only(top: 60,),
                                      //         // alignment: Alignment.center,
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.center,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.center,
                                      //         children: [
                                      //       Center(
                                      //         child: Text(
                                      //           currentData.title.toString(),
                                      //           textAlign: TextAlign.center,
                                      //         ),
                                      //       )
                                      //     ])),
                                    ],
                                  ),
                                ],
                              ),
                            )));
                    // return Card(
                    //     child: Container(
                    //         width:
                    //             150, // Set the width as needed
                    //         // Customize the content for each item in the horizontal ListView
                    //         child: Column(
                    //           mainAxisAlignment:
                    //               MainAxisAlignment
                    //                   .start,
                    //           crossAxisAlignment:
                    //               CrossAxisAlignment
                    //                   .start,
                    //           children: [
                    //             Text(data.title ??
                    //                 ''),
                    //             Text(
                    //                 data.duration ??
                    //                     ''),
                    //             // Add more widgets as needed
                    //           ],
                    //         )));
                  }
                }))
      ])),
    );
  }
}
