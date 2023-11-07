import 'package:goroga/presentation/explore_page/models/program_model.dart';
import 'package:goroga/presentation/podcasts_screen/podcasts_screen.dart';
import 'controller/explore_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

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
                                        Get.to(() => PodcastsScreen(
                                              programsData: program,
                                            ));
                                      },
                                      child: Container(
                                          child: SingleChildScrollView(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
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
                                                          .toString(),
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
                                                        Get.to(() =>
                                                            PodcastsScreen(
                                                              programsData:
                                                                  program,
                                                            ));
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
                })));
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
      return programList;
    } catch (e) {
      print("error:$e");
      throw e;
    }
  }
}
