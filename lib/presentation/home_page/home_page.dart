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
              title: AppbarTitle(
                text: "lbl_home".tr,
                margin: getMargin(left: 16),
              ),
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
                                              5, 
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: category.data!.length,
                                              itemBuilder:
                                                  (context, dataIndex) {
                                                Data data =
                                                    category.data![dataIndex];
                                                return data != null
                                                    ? Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              print("tapped");
                                                              Get.to(
                                                                () =>
                                                                    DetailPage(
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
                                                                        height:
                                                                            MediaQuery.of(context).size.width /
                                                                                2,
                                                                        width: MediaQuery.sizeOf(context).width -
                                                                            100,
                                                                        url: data
                                                                            .imageUrl
                                                                            .toString(),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        margin:
                                                                            getMargin(
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              5,
                                                                          top:
                                                                              10,
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                        bottom:
                                                                            10,
                                                                        left:
                                                                            10,
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              220,
                                                                          alignment:
                                                                              Alignment.bottomLeft,
                                                                          padding:
                                                                              EdgeInsets.all(8),
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              Text(
                                                                            data.title.toString(),
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                        bottom:
                                                                            10,
                                                                        right:
                                                                            10,
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              EdgeInsets.all(5),
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.transparent,
                                                                              borderRadius: BorderRadius.circular(5)),
                                                                          child:
                                                                              Text(
                                                                            data.duration.toString(), 
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 16,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            )))
                                                    : SizedBox.shrink();
                                              }))
                                      : SizedBox.shrink(),
                                )
                              : SizedBox.shrink();
                        }));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
