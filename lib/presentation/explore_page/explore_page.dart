import 'package:goroga/presentation/explore_page/models/program_model.dart';
import 'package:goroga/presentation/podcasts_screen/podcasts_screen.dart';
import 'controller/explore_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class ExplorePage extends StatefulWidget {
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  ExploreController _exploreController = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
              height: getVerticalSize(80),
              leadingWidth: 72,
              title: AppbarTitle(
                  text: "lbl_explore".tr, margin: getMargin(left: 16)),
            ),
            body: FutureBuilder(
                future: fetchData(),
                builder: (context, AsyncSnapshot<ProgramModel> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    List<Programs>? programs = snapshot.data!.programs;
                    // print(items);
                    return ListView.builder(
                        itemCount: programs?.length,
                        itemBuilder: ((context, index) {
                          Programs? program = programs?[index];

                          return program != null
                              ? Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                      onTap: () {
                                        // print("tapped");
                                        // onTapTypeRoundedC.call();
                                        // Get.to(()=>PodcastsScreen(imagePath: programs![index].imageUrl.toString(), data:programs[index].data));
                                        // Get.to(()=>PodcastsScreen(),arguments: [programs![index]]);
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(
                                        //   builder: (context) {
                                        //     return PodcastsScreen(
                                        //         imagePath: programs![index]
                                        //             .imageUrl
                                        //             .toString(),
                                        //             authorName:programs[index].author.toString(),
                                        //           duration:programs[index].duration.toString(),
                                        //           title:programs[index].title.toString(),
                                        //           description:programs[index].description.toString(),
                                        //         data: programs[index].data);
                                        //   },
                                        // ));
                                        Get.to(() => PodcastsScreen(
                                              programsData: program,
                                            ));
                                      },
                                      child: Container(
                                          // decoration: AppDecoration.gradientRed700RedA70002.copyWith(
                                          //   borderRadius: BorderRadiusStyle.roundedBorder20,
                                          // ),
                                          child: SingleChildScrollView(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              // padding: getPadding(top: 0),
                                              // width: 480,
                                              // height: 220,
                                              // child: Image(image: AssetImage(items[index].imageUrl.toString()),fit: BoxFit.cover,),
                                              children: [
                                                CustomImageView(
                                                  url: programs![index]
                                                      .imageUrl
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      12,
                                                  radius: BorderRadius.circular(
                                                    getHorizontalSize(
                                                      5,
                                                    ),
                                                  ),
                                                  // fit: BoxFit.fill,
                                                  margin: getMargin(
                                                    left: 5,
                                                    right: 5,
                                                    top: 29,
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 30,
                                                  left: 10,
                                                  child: Container(
                                                    width: 300,
                                                    alignment:
                                                        Alignment.topLeft,
                                                    padding: EdgeInsets.all(8),
                                                    color: Colors.transparent,
                                                    child: Text(
                                                      programs[index]
                                                          .title
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 5,
                                                  right: 10,
                                                  child: Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      programs[index]
                                                          .duration
                                                          .toString(), // Replace with your time data

                                                      style: TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 15,
                                                  right: 0,
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    color: Colors.transparent,
                                                    child: IconButton(
                                                      icon: Icon(
                                                          Icons.arrow_forward),
                                                      color: Colors.white,
                                                      onPressed: () {
                                                        //Get.to(PodcastsScreen(imagePath: items[index].imageUrl.toString(),));
                                                        // Add your button's onPressed logic here
                                                      },
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ))))
                              : SizedBox.shrink();
                        }));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
            // SingleChildScrollView(
            //   child: Container(
            //       width: double.maxFinite,
            //       decoration: AppDecoration.fillWhiteA700,
            //       child: Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Container(
            //                       width: double.maxFinite,
            //                       child: Container(
            //                           padding: getPadding(top: 0, bottom: 5,right: 24),
            //                           // decoration: AppDecoration.fillWhiteA700,
            //                           child: Column(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.end,
            //                               children: [
            // CustomAppBar(
            //     height: getVerticalSize(42),
            //     leadingWidth: 56,
            //     // leading: AppbarImage(
            //     //     height: getSize(32),
            //     //     width: getSize(32),
            //     //     svgPath: ImageConstant.imgLogo,
            //     //     margin: getMargin(
            //     //         left: 24, bottom: 1)),
            //     title: AppbarTitle(
            //         text: "lbl_explore".tr,
            //         margin: getMargin(left: 16)),
            // actions: [
            //   AppbarImage(
            //       height: getSize(28),
            //       width: getSize(28),
            //       svgPath: ImageConstant
            //           .imgClock28x28,
            //       margin: getMargin(
            //           left: 24,
            //           top: 2,
            //           right: 24,
            //           bottom: 3))
            // ]
            // ),
            // CustomSearchView(
            //     focusNode: FocusNode(),
            //     controller: controller
            //         .searchBarController,
            //     hintText: "msg_artists_songs".tr,
            //     margin: getMargin(
            //         left: 24, top: 38, right: 24),
            //     fontStyle: SearchViewFontStyle
            //         .UrbanistRegular14Gray400,
            //     prefix: Container(
            //         margin: getMargin(
            //             left: 20,
            //             top: 18,
            //             right: 12,
            //             bottom: 18),
            //         child: CustomImageView(
            //             svgPath: ImageConstant
            //                 .imgSearchGray400)),
            //     prefixConstraints: BoxConstraints(
            //         maxHeight:
            //             getVerticalSize(56)),
            //     suffix: Padding(
            //         padding: EdgeInsets.only(
            //             right: getHorizontalSize(
            //                 15)),
            //         child: IconButton(
            //             onPressed: () {
            //               controller
            //                   .searchBarController
            //                   .clear();
            //             },
            //             icon: Icon(Icons.clear,
            //                 color: Colors
            //                     .grey.shade600))))
            // ]))),
            // Padding(
            //     padding: getPadding(left: 24, top: 17),
            //     child: Text("lbl_browse_all".tr,
            //         overflow: TextOverflow.ellipsis,
            //         textAlign: TextAlign.left,
            //         style: AppStyle.txtUrbanistRomanBold20)),
            // Align(
            //     alignment: Alignment.center,
            //     child: Padding(
            //         padding: getPadding(
            //             left: 24, top: 0, right: 24),
            //         child: Obx(() => ListView.builder(
            //             shrinkWrap: true,
            // gridDelegate:
            //     SliverGridDelegateWithFixedCrossAxisCount(
            //         mainAxisExtent:
            //             getVerticalSize(121),
            //         crossAxisCount: 1,
            //         mainAxisSpacing:
            //             getHorizontalSize(12),
            //         crossAxisSpacing:
            //             getHorizontalSize(12)),
            // physics:
            //     NeverScrollableScrollPhysics(),
            // itemCount: controller
            //     .exploreModelObj
            //     .value
            //     .exploreItemList
            //     .value
            //     .length,
            // itemBuilder: (context, index) {
            //   ExploreItemModel model = controller
            //       .exploreModelObj
            //       .value
            //       .exploreItemList
            //       .value[index];
            //   return ExploreItemWidget(model,
            //       onTapTypeRoundedC: () {
            //     onTapTypeRoundedC();
            //   });
            // }))))
            // ])
            // ])),
            // )
            ));
  }

  onTapTypeRoundedC() {
    Get.toNamed(
      AppRoutes.podcastsScreen,
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

//  Future<List<HomeModel>> readJsonData() async {
  Future<ProgramModel> fetchData() async {
    try {
      var programList = await _exploreController.getData();
      // print(categoriesList);
      return programList;
      // List<Categories>? categories = categoriesList.categories;
      // if (categories != null) {
      //   for (Categories category in categories) {
      //     print('Category Title: ${category.title}');
      //     List<Data>? data = category.data;
      //     // print(data);
      //     if (data != null) {
      //       for (Data item in data) {
      //         print('Data Title: ${item.title}');
      //       }
      //     }
      //   }
      // }
    } catch (e) {
      print("error:$e");
      throw e;
    }
  }
}
