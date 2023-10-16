import 'package:goroga/presentation/home_page/details.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';

import 'controller/home_controller.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<HomeModel> fetchData() async {
    try {
      var categoriesList = await _homeController.getData();
      return categoriesList;
    } catch (e) {
      print("error:$e");
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(80),
                leadingWidth: 72,
                // leading: CustomImageView(
                //     imagePath: ImageConstant.imgEllipse48x481,
                //     height: getSize(48),
                //     width: getSize(48),
                //     radius: BorderRadius.circular(getHorizontalSize(24)),
                //     margin: getMargin(left: 24, bottom: 1)),
                title: AppbarTitle(
                  text: "lbl_home".tr,
                  margin: getMargin(left: 16),
                ),
                // Padding(
                //     padding: getPadding(left: 16),
                //     child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [

                //           // Align(
                //           //     alignment: Alignment.centerLeft,
                //           //     child: Padding(
                //           //         padding: getPadding(right: 18),
                //           //         child: Text("lbl_home".tr,
                //           //             overflow: TextOverflow.ellipsis,
                //           //             textAlign: TextAlign.left,
                //           //             style: AppStyle
                //           //                 .txtUrbanistRegular16Gray600
                //           //                 .copyWith(
                //           //                     letterSpacing:
                //           //                         getHorizontalSize(0.2))))),
                //           Align(
                //               alignment: Alignment.centerLeft,
                //               child: Padding(
                //                   padding: getPadding(top: 6),
                //                   child: Text("lbl_home".tr,
                //                       overflow: TextOverflow.ellipsis,
                //                       textAlign: TextAlign.left,
                //                       style: AppStyle.txtUrbanistRomanBold20)))
                //         ])),
                // actions: [
                //    IconButton(
                //     icon: Icon(
                //       Icons.favorite_outline_sharp, // Use the favorite icon
                //       color: ColorConstant.primary, // Customize the icon color
                //     ),
                //     onPressed: () { 
                //         Get.to(FavoriteItemsPage());

                //      },
                //   ),
                  // AppbarImage(
                  //   height: getSize(28),
                  //   width: getSize(28),
                  //   svgPath: ImageConstant.imgFavorite,
                  //   margin: getMargin(left: 24, top: 10, right: 11),
                  //   onTap: () {
                  //     print("favourite tapped");
                  //     Get.to(FavoriteItemsPage());
                  //   },
                  // ),

                  // AppbarImage(
                  //     height: getSize(28),
                  //     width: getSize(28),
                  //     svgPath: ImageConstant.imgLightbulb,
                  //     margin: getMargin(left: 20, top: 10, right: 35))
                // ]
                ),
            body: FutureBuilder(
                future: fetchData(),
                builder: (context, AsyncSnapshot<HomeModel> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    List<Categories>? categories = snapshot.data!.categories;

                    return ListView.builder(
                        itemCount: categories?.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          Categories? category = categories?[index];
                          return category != null
                              ? ListTile(
                                  title: Text(
                                    category.title ?? '',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  subtitle: category.data != null
                                      ? SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width +
                                              5, // Set the height as needed
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: category.data!.length,
                                              itemBuilder:
                                                  (context, dataIndex) {
                                                Data data =
                                                    category.data![dataIndex];
                                                return Align(
                                                    alignment: Alignment.center,
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          print("tapped");
                                                          // onTapTypeRoundedC.call();
                                                          Get.to(
                                                            () => DetailPage(
                                                              data: data,
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  CustomImageView(
                                                                    url: data
                                                                        .imageUrl
                                                                        .toString(),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    margin:
                                                                        getMargin(
                                                                      left: 5,
                                                                      right: 5,
                                                                      top: 10,
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 10,
                                                                    left: 10,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          220,
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomLeft,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8),
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Text(
                                                                        data.title
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 10,
                                                                    right: 10,
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .transparent,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5)),
                                                                      child:
                                                                          Text(
                                                                        data.duration
                                                                            .toString(), // Replace with your time data
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              16,
                                                                        ),
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
                                              }))
                                      : SizedBox.shrink(),
                                )
                              : SizedBox.shrink();
                          // return Align(
                          //     alignment: Alignment.center,
                          //     child: GestureDetector(
                          //         onTap: () {
                          //           print("tapped");
                          //           // onTapTypeRoundedC.call();
                          //         },
                          //         child: Container(
                          //             // decoration: AppDecoration.gradientRed700RedA70002.copyWith(
                          //             //   borderRadius: BorderRadiusStyle.roundedBorder20,
                          //             // ),
                          //             child: SingleChildScrollView(
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.start,
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Stack(
                          //                 // padding: getPadding(top: 0),
                          //                 // width: 480,
                          //                 // height: 220,
                          //                 // child: Image(image: AssetImage(items[index].imageUrl.toString()),fit: BoxFit.cover,),
                          //                 children: [
                          //                   // CustomImageView(
                          //                   //   imagePath: categories[index]
                          //                   //       .imageUrl
                          //                   //       .toString(),
                          //                   //   height: MediaQuery.of(context).size.width/2,
                          //                   //   width: MediaQuery.of(context).size.width-10,
                          //                   //   radius: BorderRadius.circular(
                          //                   //     getHorizontalSize(
                          //                   //       5,
                          //                   //     ),
                          //                   //   ),
                          //                   //   // fit: BoxFit.fill,
                          //                   //   margin: getMargin(
                          //                   //     left: 5,
                          //                   //     right: 5,
                          //                   //     top: 29,
                          //                   //   ),
                          //                   // ),
                          //                   Positioned(
                          //                     top: 30,
                          //                     left: 10,
                          //                     child: Container(
                          //                       width: 300,
                          //                       alignment: Alignment.topLeft,
                          //                       padding: EdgeInsets.all(8),
                          //                       color: Colors.transparent,
                          //                       child: Text(
                          //                         categories![index].title.toString(),
                          //                         style: TextStyle(
                          //                             color: Colors.white,
                          //                             fontSize: 16,
                          //                             fontWeight:
                          //                                 FontWeight.bold),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   // Positioned(
                          //                   //   bottom: 5,
                          //                   //   right: 10,
                          //                   //   child: Container(
                          //                   //     padding: EdgeInsets.all(8),
                          //                   //     decoration: BoxDecoration(
                          //                   //         color: Colors.white,
                          //                   //         borderRadius:
                          //                   //             BorderRadius.circular(
                          //                   //                 5)),
                          //                   //     child: Text(
                          //                   //       items[index]
                          //                   //           .duration
                          //                   //           .toString(), // Replace with your time data
                          //                   //       style: TextStyle(
                          //                   //         color: Colors.black87,
                          //                   //         fontSize: 16,
                          //                   //       ),
                          //                   //     ),
                          //                   //   ),
                          //                   // ),
                          //                   Positioned(
                          //                     top: 15,
                          //                     right: 0,
                          //                     child: Container(
                          //                       padding: EdgeInsets.all(8),
                          //                       color: Colors.transparent,
                          //                       child: IconButton(
                          //                         icon:
                          //                             Icon(Icons.arrow_forward),
                          //                         color: Colors.white,
                          //                         onPressed: () {
                          //                           // onTapTypeRoundedC.call();
                          //                           // Add your button's onPressed logic here
                          //                         },
                          //                       ),
                          //                     ),
                          //                   )
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         )))
                          // );
                        }));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
            //  SizedBox(
            //     width: size.width,
            //     child: SingleChildScrollView(
            //         child: Padding(
            //             padding: getPadding(left: 24, top: 29),
            //             child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Padding(
            //                       padding: getPadding(right: 24),
            //                       child: Row(

            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Padding(
            //                                 padding: getPadding(top: 1),
            //                                 child: Text("lbl_trending_now".tr,
            //                                     overflow: TextOverflow.ellipsis,
            //                                     textAlign: TextAlign.left,
            //                                     style: AppStyle
            //                                         .txtUrbanistRomanBold24)),
            //                             GestureDetector(
            //                                 onTap: () {
            //                                   onTapTxtSeeAll();
            //                                 },
            //                                 child: Padding(
            //                                     padding: getPadding(bottom: 10),
            //                                     child: Text("lbl_see_all".tr,
            //                                         overflow:
            //                                             TextOverflow.ellipsis,
            //                                         textAlign: TextAlign.left,
            //                                         style: AppStyle
            //                                             .txtUrbanistRomanBold16RedA70002
            //                                             .copyWith(
            //                                                 letterSpacing:
            //                                                     getHorizontalSize(
            //                                                         0.2)))))
            //                           ])),
            //                   Align(
            //                       alignment: Alignment.centerRight,
            //                       child: Container(
            //                         height: getVerticalSize(229),
            //                         child: ListView(
            //                           padding: getPadding(top: 13),
            //                           scrollDirection: Axis.horizontal,
            //                           children: <Widget>[
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                         // child: Obx(() => ListView.separated(
            //                         //     padding: getPadding(top: 13),
            //                         //     scrollDirection: Axis.horizontal,
            //                         //     separatorBuilder: (context, index) {
            //                         //       return SizedBox(
            //                         //           height: getVerticalSize(12));
            //                         //     },
            //                         //     itemCount: controller
            //                         //         .homeModelObj
            //                         //         .value
            //                         //         .listloremipsumdolorItemList
            //                         //         .value
            //                         //         .length,
            //                         //     itemBuilder: (context, index) {
            //                         //       ListloremipsumdolorItemModel model =
            //                         //           controller
            //                         //               .homeModelObj
            //                         //               .value
            //                         //               .listloremipsumdolorItemList
            //                         //               .value[index];
            //                         //       return ListloremipsumdolorItemWidget(
            //                         //           model, onTapTypeRoundedC: () {
            //                         //         onTapTxtSeeAll();
            //                         //       });
            //                         //     }))
            //                       )),
            //                   Padding(
            //                       padding: getPadding(top: 35, right: 24),
            //                       child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text("lbl_popular_artists".tr,
            //                                 overflow: TextOverflow.ellipsis,
            //                                 textAlign: TextAlign.left,
            //                                 style: AppStyle
            //                                     .txtUrbanistRomanBold24),
            //                             GestureDetector(
            //                                 onTap: () {
            //                                   onTapTxtSeeAllOne();
            //                                 },
            //                                 child: Padding(
            //                                     padding: getPadding(
            //                                         top: 1, bottom: 7),
            //                                     child: Text("lbl_see_all".tr,
            //                                         overflow:
            //                                             TextOverflow.ellipsis,
            //                                         textAlign: TextAlign.left,
            //                                         style: AppStyle
            //                                             .txtUrbanistRomanBold16RedA70002
            //                                             .copyWith(
            //                                                 letterSpacing:
            //                                                     getHorizontalSize(
            //                                                         0.2)))))
            //                           ])),
            //                   Align(
            //                       alignment: Alignment.centerRight,
            //                       child: Container(
            //                         height: getVerticalSize(206),
            //                         child: ListView(
            //                           padding: getPadding(top: 13),
            //                           scrollDirection: Axis.horizontal,
            //                           children: <Widget>[
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/sessions_thumbnails/S012.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),
            //                             ),
            //                             SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),
            //                             ),
            //                             SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),
            //                             ),
            //                             SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),
            //                             ),
            //                             SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                         // child: Obx(() => ListView.separated(
            //                         //     padding: getPadding(top: 13),
            //                         //     scrollDirection: Axis.horizontal,
            //                         //     separatorBuilder: (context, index) {
            //                         //       return SizedBox(
            //                         //           height: getVerticalSize(12));
            //                         //     },
            //                         //     itemCount: controller
            //                         //         .homeModelObj
            //                         //         .value
            //                         //         .listnameItemList
            //                         //         .value
            //                         //         .length,
            //                         //     itemBuilder: (context, index) {
            //                         //       ListnameItemModel model = controller
            //                         //           .homeModelObj
            //                         //           .value
            //                         //           .listnameItemList
            //                         //           .value[index];
            //                         //       return ListnameItemWidget(model);
            //                         //     }))
            //                       )),
            //                   Padding(
            //                       padding: getPadding(top: 35, right: 24),
            //                       child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text("lbl_workplace_wellbeing".tr,
            //                                 overflow: TextOverflow.ellipsis,
            //                                 textAlign: TextAlign.left,
            //                                 style: AppStyle
            //                                     .txtUrbanistRomanBold24),
            //                             GestureDetector(
            //                                 onTap: () {
            //                                   onTapTxtSeeAllOne();
            //                                 },
            //                                 child: Padding(
            //                                     padding: getPadding(
            //                                         top: 1, bottom: 7),
            //                                     child: Text("lbl_see_all".tr,
            //                                         overflow:
            //                                             TextOverflow.ellipsis,
            //                                         textAlign: TextAlign.left,
            //                                         style: AppStyle
            //                                             .txtUrbanistRomanBold16RedA70002
            //                                             .copyWith(
            //                                                 letterSpacing:
            //                                                     getHorizontalSize(
            //                                                         0.2)))))
            //                           ])),
            //                   Align(
            //                       alignment: Alignment.centerRight,
            //                       child: Container(
            //                           height: getVerticalSize(206),
            //                           child: ListView(
            //                               padding: getPadding(top: 13),
            //                               scrollDirection: Axis.horizontal,
            //                               children: <Widget>[
            //                                 Container(
            //                                   height: 480.0,
            //                                   width: 240.0,
            //                                   decoration: BoxDecoration(
            //                                     image: DecorationImage(
            //                                       image: AssetImage(
            //                                           'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                       fit: BoxFit.fill,
            //                                     ),
            //                                     shape: BoxShape.rectangle,
            //                                   ),
            //                                 ),
            //                                  SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                               SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                               SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                               SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                               SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                               SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                               SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                               SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                               SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),

            //                               ]),
            //                               // child: Obx(() => ListView.separated(
            //                               //     padding: getPadding(top: 13),
            //                               //     scrollDirection: Axis.horizontal,
            //                               //     separatorBuilder: (context, index) {
            //                               //       return SizedBox(
            //                               //           height: getVerticalSize(12));
            //                               //     },
            //                               //     itemCount: controller
            //                               //         .homeModelObj
            //                               //         .value
            //                               //         .listnameItemList
            //                               //         .value
            //                               //         .length,
            //                               //     itemBuilder: (context, index) {
            //                               //       ListnameItemModel model = controller
            //                               //           .homeModelObj
            //                               //           .value
            //                               //           .listnameItemList
            //                               //           .value[index];
            //                               //       return ListnameItemWidget(model);
            //                               //     })
            //                               )),
            //                   Padding(
            //                       padding: getPadding(top: 35, right: 24),
            //                       child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text("lbl_guided_meditations".tr,
            //                                 overflow: TextOverflow.ellipsis,
            //                                 textAlign: TextAlign.left,
            //                                 style: AppStyle
            //                                     .txtUrbanistRomanBold24),
            //                             GestureDetector(
            //                                 onTap: () {
            //                                   onTapTxtSeeAllOne();
            //                                 },
            //                                 child: Padding(
            //                                     padding: getPadding(
            //                                         top: 1, bottom: 7),
            //                                     child: Text("lbl_see_all".tr,
            //                                         overflow:
            //                                             TextOverflow.ellipsis,
            //                                         textAlign: TextAlign.left,
            //                                         style: AppStyle
            //                                             .txtUrbanistRomanBold16RedA70002
            //                                             .copyWith(
            //                                                 letterSpacing:
            //                                                     getHorizontalSize(
            //                                                         0.2)))))
            //                           ])),
            //                   Align(
            //                       alignment: Alignment.centerRight,
            //                       child: Container(
            //                           height: getVerticalSize(206),
            //                           child: ListView(
            //                               padding: getPadding(top: 13),
            //                               scrollDirection: Axis.horizontal,
            //                               children: <Widget>[
            //                                 Container(
            //                                   height: 480.0,
            //                                   width: 240.0,
            //                                   decoration: BoxDecoration(
            //                                     image: DecorationImage(
            //                                       image: AssetImage(
            //                                           'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                       fit: BoxFit.fill,
            //                                     ),
            //                                     shape: BoxShape.rectangle,
            //                                   ),
            //                                 ),
            //                                   SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                                 SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                                 SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                                 SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                                 SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                                 SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),])
            //                           // child: Obx(() => ListView.separated(
            //                           //     padding: getPadding(top: 13),
            //                           //     scrollDirection: Axis.horizontal,
            //                           //     separatorBuilder: (context, index) {
            //                           //       return SizedBox(
            //                           //           height: getVerticalSize(12));
            //                           //     },
            //                           //     itemCount: controller
            //                           //         .homeModelObj
            //                           //         .value
            //                           //         .listnameItemList
            //                           //         .value
            //                           //         .length,
            //                           //     itemBuilder: (context, index) {
            //                           //       ListnameItemModel model = controller
            //                           //           .homeModelObj
            //                           //           .value
            //                           //           .listnameItemList
            //                           //           .value[index];
            //                           //       return ListnameItemWidget(model);
            //                           //     }))
            //                           )),
            //                   Padding(
            //                       padding: getPadding(top: 35, right: 24),
            //                       child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text("lbl_timer".tr,
            //                                 overflow: TextOverflow.ellipsis,
            //                                 textAlign: TextAlign.left,
            //                                 style: AppStyle
            //                                     .txtUrbanistRomanBold24),
            //                             GestureDetector(
            //                                 onTap: () {
            //                                   onTapTxtSeeAllOne();
            //                                 },
            //                                 child: Padding(
            //                                     padding: getPadding(
            //                                         top: 1, bottom: 7),
            //                                     child: Text("lbl_see_all".tr,
            //                                         overflow:
            //                                             TextOverflow.ellipsis,
            //                                         textAlign: TextAlign.left,
            //                                         style: AppStyle
            //                                             .txtUrbanistRomanBold16RedA70002
            //                                             .copyWith(
            //                                                 letterSpacing:
            //                                                     getHorizontalSize(
            //                                                         0.2)))))
            //                           ])),
            //                   Align(
            //                       alignment: Alignment.centerRight,
            //                       child: Container(
            //                           height: getVerticalSize(206),
            //                           child: ListView(
            //                               padding: getPadding(top: 13),
            //                               scrollDirection: Axis.horizontal,
            //                               children: <Widget>[
            //                                 Container(
            //                                   height: 480.0,
            //                                   width: 240.0,
            //                                   decoration: BoxDecoration(
            //                                     image: DecorationImage(
            //                                       image: AssetImage(
            //                                           'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                       fit: BoxFit.fill,
            //                                     ),
            //                                     shape: BoxShape.rectangle,
            //                                   ),
            //                                 ),
            //                                   SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                                SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                                SizedBox(
            //                               width: 5,
            //                             ),
            //                             Container(
            //                               height: 480.0,
            //                               width: 240.0,
            //                               decoration: BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: AssetImage(
            //                                       'assets/images/program_thumbnails/1_Welcome_and_Faq.png'),
            //                                   fit: BoxFit.fill,
            //                                 ),
            //                                 shape: BoxShape.rectangle,
            //                               ),),
            //                                 SizedBox(
            //                               width: 5,
            //                             ),]
            //                             )
            //                           // child: Obx(() => ListView.separated(
            //                           //     padding: getPadding(top: 13),
            //                           //     scrollDirection: Axis.horizontal,
            //                           //     separatorBuilder: (context, index) {
            //                           //       return SizedBox(
            //                           //           height: getVerticalSize(12));
            //                           //     },
            //                           //     itemCount: controller
            //                           //         .homeModelObj
            //                           //         .value
            //                           //         .listnameItemList
            //                           //         .value
            //                           //         .length,
            //                           //     itemBuilder: (context, index) {
            //                           //       ListnameItemModel model = controller
            //                           //           .homeModelObj
            //                           //           .value
            //                           //           .listnameItemList
            //                           //           .value[index];
            //                           //       return ListnameItemWidget(model);
            //                           //     }))
            //                           )),
            //                   Padding(
            //                       padding: getPadding(top: 35, right: 24),
            //                       child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text("lbl_understanding_stress".tr,
            //                                 overflow: TextOverflow.ellipsis,
            //                                 textAlign: TextAlign.left,
            //                                 style: AppStyle
            //                                     .txtUrbanistRomanBold24),
            //                             GestureDetector(
            //                                 onTap: () {
            //                                   onTapTxtSeeAllOne();
            //                                 },
            //                                 child: Padding(
            //                                     padding: getPadding(
            //                                         top: 1, bottom: 7),
            //                                     child: Text("lbl_see_all".tr,
            //                                         overflow:
            //                                             TextOverflow.ellipsis,
            //                                         textAlign: TextAlign.left,
            //                                         style: AppStyle
            //                                             .txtUrbanistRomanBold16RedA70002
            //                                             .copyWith(
            //                                                 letterSpacing:
            //                                                     getHorizontalSize(
            //                                                         0.2)))))
            //                           ])),
            //                   Align(
            //                       alignment: Alignment.centerRight,
            //                       child: Container(
            //                           height: getVerticalSize(206),
            //                           child: Obx(() => ListView.separated(
            //                               padding: getPadding(top: 13),
            //                               scrollDirection: Axis.horizontal,
            //                               separatorBuilder: (context, index) {
            //                                 return SizedBox(
            //                                     height: getVerticalSize(12));
            //                               },
            //                               itemCount: controller
            //                                   .homeModelObj
            //                                   .value
            //                                   .listnameItemList
            //                                   .value
            //                                   .length,
            //                               itemBuilder: (context, index) {
            //                                 ListnameItemModel model = controller
            //                                     .homeModelObj
            //                                     .value
            //                                     .listnameItemList
            //                                     .value[index];
            //                                 return ListnameItemWidget(model);
            //                               })))),
            //                   Padding(
            //                       padding: getPadding(top: 35, right: 24),
            //                       child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text("lbl_soundscapes".tr,
            //                                 overflow: TextOverflow.ellipsis,
            //                                 textAlign: TextAlign.left,
            //                                 style: AppStyle
            //                                     .txtUrbanistRomanBold24),
            //                             GestureDetector(
            //                                 onTap: () {
            //                                   onTapTxtSeeAllOne();
            //                                 },
            //                                 child: Padding(
            //                                     padding: getPadding(
            //                                         top: 1, bottom: 7),
            //                                     child: Text("lbl_see_all".tr,
            //                                         overflow:
            //                                             TextOverflow.ellipsis,
            //                                         textAlign: TextAlign.left,
            //                                         style: AppStyle
            //                                             .txtUrbanistRomanBold16RedA70002
            //                                             .copyWith(
            //                                                 letterSpacing:
            //                                                     getHorizontalSize(
            //                                                         0.2)))))
            //                           ])),
            //                   Align(
            //                       alignment: Alignment.centerRight,
            //                       child: Container(
            //                           height: getVerticalSize(206),
            //                           child: Obx(() => ListView.separated(
            //                               padding: getPadding(top: 13),
            //                               scrollDirection: Axis.horizontal,
            //                               separatorBuilder: (context, index) {
            //                                 return SizedBox(
            //                                     height: getVerticalSize(12));
            //                               },
            //                               itemCount: controller
            //                                   .homeModelObj
            //                                   .value
            //                                   .listnameItemList
            //                                   .value
            //                                   .length,
            //                               itemBuilder: (context, index) {
            //                                 ListnameItemModel model = controller
            //                                     .homeModelObj
            //                                     .value
            //                                     .listnameItemList
            //                                     .value[index];
            //                                 return ListnameItemWidget(model);
            //                               })))),
            //                   Padding(
            //                       padding: getPadding(top: 35, right: 24),
            //                       child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text("lbl_feeling_stressed".tr,
            //                                 overflow: TextOverflow.ellipsis,
            //                                 textAlign: TextAlign.left,
            //                                 style: AppStyle
            //                                     .txtUrbanistRomanBold24),
            //                             GestureDetector(
            //                                 onTap: () {
            //                                   onTapTxtSeeAllOne();
            //                                 },
            //                                 child: Padding(
            //                                     padding: getPadding(
            //                                         top: 1, bottom: 7),
            //                                     child: Text("lbl_see_all".tr,
            //                                         overflow:
            //                                             TextOverflow.ellipsis,
            //                                         textAlign: TextAlign.left,
            //                                         style: AppStyle
            //                                             .txtUrbanistRomanBold16RedA70002
            //                                             .copyWith(
            //                                                 letterSpacing:
            //                                                     getHorizontalSize(
            //                                                         0.2)))))
            //                           ])),
            //                   Align(
            //                       alignment: Alignment.centerRight,
            //                       child: Container(
            //                           height: getVerticalSize(206),
            //                           child: Obx(() => ListView.separated(
            //                               padding: getPadding(top: 13),
            //                               scrollDirection: Axis.horizontal,
            //                               separatorBuilder: (context, index) {
            //                                 return SizedBox(
            //                                     height: getVerticalSize(12));
            //                               },
            //                               itemCount: controller
            //                                   .homeModelObj
            //                                   .value
            //                                   .listnameItemList
            //                                   .value
            //                                   .length,
            //                               itemBuilder: (context, index) {
            //                                 ListnameItemModel model = controller
            //                                     .homeModelObj
            //                                     .value
            //                                     .listnameItemList
            //                                     .value[index];
            //                                 return ListnameItemWidget(model);
            //                               })))),

            //                   Padding(
            //                       padding: getPadding(top: 35, right: 24),
            //                       child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text("lbl_short_moments".tr,
            //                                 overflow: TextOverflow.ellipsis,
            //                                 textAlign: TextAlign.left,
            //                                 style: AppStyle
            //                                     .txtUrbanistRomanBold24),
            //                             GestureDetector(
            //                                 onTap: () {
            //                                   onTapTxtSeeAllOne();
            //                                 },
            //                                 child: Padding(
            //                                     padding: getPadding(
            //                                         top: 1, bottom: 7),
            //                                     child: Text("lbl_see_all".tr,
            //                                         overflow:
            //                                             TextOverflow.ellipsis,
            //                                         textAlign: TextAlign.left,
            //                                         style: AppStyle
            //                                             .txtUrbanistRomanBold16RedA70002
            //                                             .copyWith(
            //                                                 letterSpacing:
            //                                                     getHorizontalSize(
            //                                                         0.2)))))
            //                           ])),
            //                   Align(
            //                       alignment: Alignment.centerRight,
            //                       child: Container(
            //                           height: getVerticalSize(206),
            //                           child: Obx(() => ListView.separated(
            //                               padding: getPadding(top: 13),
            //                               scrollDirection: Axis.horizontal,
            //                               separatorBuilder: (context, index) {
            //                                 return SizedBox(
            //                                     height: getVerticalSize(12));
            //                               },
            //                               itemCount: controller
            //                                   .homeModelObj
            //                                   .value
            //                                   .listnameItemList
            //                                   .value
            //                                   .length,
            //                               itemBuilder: (context, index) {
            //                                 ListnameItemModel model = controller
            //                                     .homeModelObj
            //                                     .value
            //                                     .listnameItemList
            //                                     .value[index];
            //                                 return ListnameItemWidget(model);
            //                               })))),
            //                   // Padding(
            //                   //     padding: getPadding(top: 32, right: 24),
            //                   //     child: Row(
            //                   //         mainAxisAlignment:
            //                   //             MainAxisAlignment.spaceBetween,
            //                   //         crossAxisAlignment:
            //                   //             CrossAxisAlignment.start,
            //                   //         children: [
            //                   //           Padding(
            //                   //               padding: getPadding(top: 1),
            //                   //               child: Text("lbl_top_charts".tr,
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
            //                   /*
            //                   SingleChildScrollView(
            //                       scrollDirection: Axis.horizontal,
            //                       padding: getPadding(top: 13),
            //                       child: IntrinsicWidth(
            //                           child: Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.center,
            //                               children: [
            //                             Expanded(
            //                                 child: Row(
            //                                     mainAxisAlignment:
            //                                         MainAxisAlignment.center,
            //                                     crossAxisAlignment:
            //                                         CrossAxisAlignment.start,
            //                                     children: [
            //                                   Padding(
            //                                       padding:
            //                                           getPadding(bottom: 25),
            //                                       child: Column(
            //                                           crossAxisAlignment:
            //                                               CrossAxisAlignment
            //                                                   .start,
            //                                           mainAxisAlignment:
            //                                               MainAxisAlignment
            //                                                   .start,
            //                                           children: [
            //                                             Container(
            //                                                 height:
            //                                                     getSize(160),
            //                                                 width: getSize(160),
            //                                                 child: Stack(
            //                                                     alignment:
            //                                                         Alignment
            //                                                             .center,
            //                                                     children: [
            //                                                       CustomImageView(
            //                                                           imagePath:
            //                                                               ImageConstant
            //                                                                   .imgImage160x1607,
            //                                                           height:
            //                                                               getSize(
            //                                                                   160),
            //                                                           width: getSize(
            //                                                               160),
            //                                                           radius: BorderRadius.circular(
            //                                                               getHorizontalSize(
            //                                                                   24)),
            //                                                           alignment:
            //                                                               Alignment
            //                                                                   .center),
            //                                                       Align(
            //                                                           alignment:
            //                                                               Alignment
            //                                                                   .center,
            //                                                           child: Padding(
            //                                                               padding: getPadding(left: 20, right: 20),
            //                                                               child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
            //                                                                 Text("lbl_top_100".tr,
            //                                                                     overflow: TextOverflow.ellipsis,
            //                                                                     textAlign: TextAlign.left,
            //                                                                     style: AppStyle.txtUrbanistRomanBold24WhiteA700),
            //                                                                 Padding(
            //                                                                     padding: getPadding(top: 15),
            //                                                                     child: SizedBox(width: getHorizontalSize(120), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray100))),
            //                                                                 Padding(
            //                                                                     padding: getPadding(top: 14),
            //                                                                     child: Text("lbl_global".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold12.copyWith(letterSpacing: getHorizontalSize(0.2))))
            //                                                               ])))
            //                                                     ])),
            //                                             Padding(
            //                                                 padding: getPadding(
            //                                                     top: 9),
            //                                                 child: Text(
            //                                                     "msg_top_100_globa"
            //                                                         .tr,
            //                                                     overflow:
            //                                                         TextOverflow
            //                                                             .ellipsis,
            //                                                     textAlign:
            //                                                         TextAlign
            //                                                             .left,
            //                                                     style: AppStyle
            //                                                         .txtUrbanistRomanBold18
            //                                                         .copyWith(
            //                                                             letterSpacing:
            //                                                                 getHorizontalSize(0.2))))
            //                                           ])),
            //                                   Padding(
            //                                       padding: getPadding(left: 12),
            //                                       child: Column(
            //                                           crossAxisAlignment:
            //                                               CrossAxisAlignment
            //                                                   .start,
            //                                           mainAxisAlignment:
            //                                               MainAxisAlignment
            //                                                   .start,
            //                                           children: [
            //                                             Container(
            //                                                 height:
            //                                                     getSize(160),
            //                                                 width: getSize(160),
            //                                                 child: Stack(
            //                                                     alignment:
            //                                                         Alignment
            //                                                             .center,
            //                                                     children: [
            //                                                       CustomImageView(
            //                                                           imagePath:
            //                                                               ImageConstant
            //                                                                   .imgImage160x1608,
            //                                                           height:
            //                                                               getSize(
            //                                                                   160),
            //                                                           width: getSize(
            //                                                               160),
            //                                                           radius: BorderRadius.circular(
            //                                                               getHorizontalSize(
            //                                                                   24)),
            //                                                           alignment:
            //                                                               Alignment
            //                                                                   .center),
            //                                                       Align(
            //                                                           alignment:
            //                                                               Alignment
            //                                                                   .center,
            //                                                           child: Padding(
            //                                                               padding: getPadding(left: 20, right: 20),
            //                                                               child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
            //                                                                 Text("lbl_top_50".tr,
            //                                                                     overflow: TextOverflow.ellipsis,
            //                                                                     textAlign: TextAlign.left,
            //                                                                     style: AppStyle.txtUrbanistRomanBold24WhiteA700),
            //                                                                 Padding(
            //                                                                     padding: getPadding(top: 15),
            //                                                                     child: SizedBox(width: getHorizontalSize(120), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.blueGray100))),
            //                                                                 Padding(
            //                                                                     padding: getPadding(top: 14),
            //                                                                     child: Text("lbl_united_states".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtUrbanistRomanBold12.copyWith(letterSpacing: getHorizontalSize(0.2))))
            //                                                               ])))
            //                                                     ])),
            //                                             Container(
            //                                                 width:
            //                                                     getHorizontalSize(
            //                                                         139),
            //                                                 margin: getMargin(
            //                                                     top: 9),
            //                                                 child: Text(
            //                                                     "msg_top_100_unite"
            //                                                         .tr,
            //                                                     maxLines: null,
            //                                                     textAlign:
            //                                                         TextAlign
            //                                                             .left,
            //                                                     style: AppStyle
            //                                                         .txtUrbanistRomanBold18
            //                                                         .copyWith(
            //                                                             letterSpacing:
            //                                                                 getHorizontalSize(0.2))))
            //                                           ]))
            //                                 ])),
            //                             Padding(
            //                                 padding: getPadding(left: 12),
            //                                 child: Column(
            //                                     mainAxisAlignment:
            //                                         MainAxisAlignment.start,
            //                                     children: [
            //                                       Container(
            //                                           height: getSize(160),
            //                                           width: getSize(160),
            //                                           child: Stack(
            //                                               alignment:
            //                                                   Alignment.center,
            //                                               children: [
            //                                                 CustomImageView(
            //                                                     imagePath:
            //                                                         ImageConstant
            //                                                             .imgImage160x1609,
            //                                                     height: getSize(
            //                                                         160),
            //                                                     width: getSize(
            //                                                         160),
            //                                                     radius: BorderRadius
            //                                                         .circular(
            //                                                             getHorizontalSize(
            //                                                                 24)),
            //                                                     alignment:
            //                                                         Alignment
            //                                                             .center),
            //                                                 Align(
            //                                                     alignment: Alignment
            //                                                         .center,
            //                                                     child: Text(
            //                                                         "lbl_top_hits"
            //                                                             .tr,
            //                                                         overflow:
            //                                                             TextOverflow
            //                                                                 .ellipsis,
            //                                                         textAlign:
            //                                                             TextAlign
            //                                                                 .center,
            //                                                         style: AppStyle
            //                                                             .txtUrbanistRomanBold24WhiteA700))
            //                                               ])),
            //                                       Container(
            //                                           width: getHorizontalSize(
            //                                               160),
            //                                           margin: getMargin(top: 9),
            //                                           child: Text(
            //                                               "msg_top_hits_indo"
            //                                                   .tr,
            //                                               maxLines: null,
            //                                               textAlign:
            //                                                   TextAlign.left,
            //                                               style: AppStyle
            //                                                   .txtUrbanistRomanBold18
            //                                                   .copyWith(
            //                                                       letterSpacing:
            //                                                           getHorizontalSize(
            //                                                               0.2))))
            //                                     ]))
            //                           ])))
            //                           */
            //                 ])))
            // )
            ));
  }

  onTapTxtSeeAll() {
    Get.toNamed(
      AppRoutes.trendingNowScreen,
    );
  }

  onTapTxtSeeAllOne() {
    Get.toNamed(
      AppRoutes.popularArtistsScreen,
    );
  }
}
