import 'package:google_fonts/google_fonts.dart';

import 'controller/search_result_profile_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/artist_search_result_page/artist_search_result_page.dart';
import 'package:goroga/presentation/search_result_album_page/search_result_album_page.dart';
import 'package:goroga/presentation/search_result_playlist_page/search_result_playlist_page.dart';
import 'package:goroga/presentation/search_result_podcast_page/search_result_podcast_page.dart';
import 'package:goroga/presentation/search_result_profile_page/search_result_profile_page.dart';
import 'package:goroga/presentation/song_play_over_screen_page/song_play_over_screen_page.dart';
import 'package:goroga/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class SearchResultProfileTabContainerScreen
    extends GetWidget<SearchResultProfileTabContainerController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomSearchView(
                focusNode: FocusNode(),
                controller: controller.filledSearchController,
                hintText: "lbl_jenny".tr,
                margin: getMargin(
                  left: 24,
                  top: 24,
                  right: 24,
                ),
                padding: SearchViewPadding.PaddingT18,
                prefix: Container(
                  margin: getMargin(
                    left: 20,
                    top: 18,
                    right: 12,
                    bottom: 18,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgSearchGray400,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: getVerticalSize(
                    56,
                  ),
                ),
                suffix: Container(
                  margin: getMargin(
                    left: 30,
                    top: 18,
                    right: 20,
                    bottom: 18,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgClose20x20,
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: getVerticalSize(
                    56,
                  ),
                ),
              ),
              Container(
                height: getVerticalSize(
                  38,
                ),
                width: double.maxFinite,
                margin: getMargin(
                  top: 24,
                ),
                child: TabBar(
                  controller: controller.frame5Controller,
                  labelColor: ColorConstant.whiteA700,
                  labelStyle: TextStyle(
                    fontSize: getFontSize(
                      16,
                    ),
    fontFamily: GoogleFonts.nunito().fontFamily,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelColor: ColorConstant.redA70002,
                  unselectedLabelStyle: TextStyle(
                    fontSize: getFontSize(
                      16,
                    ),
    fontFamily: GoogleFonts.nunito().fontFamily,
                    fontWeight: FontWeight.w600,
                  ),
                  indicator: BoxDecoration(
                    color: ColorConstant.redA70002,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        19,
                      ),
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "lbl_songs".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_artists".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_albums".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_podcasts".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_playlists".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_profiles".tr,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: getVerticalSize(
                  740,
                ),
                child: TabBarView(
                  controller: controller.frame5Controller,
                  children: [
                    SongPlayOverScreenPage(),
                    ArtistSearchResultPage(),
                    SearchResultAlbumPage(),
                    SearchResultPodcastPage(),
                    SearchResultPlaylistPage(),
                    SearchResultProfilePage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
