import 'package:goroga/presentation/splash_screen/splash_screen.dart';
import 'package:goroga/presentation/splash_screen/binding/splash_binding.dart';
import 'package:goroga/presentation/walkthrough_screen/walkthrough_screen.dart';
import 'package:goroga/presentation/walkthrough_screen/binding/walkthrough_binding.dart';
import 'package:goroga/presentation/lets_you_in_screen/lets_you_in_screen.dart';
import 'package:goroga/presentation/lets_you_in_screen/binding/lets_you_in_binding.dart';
import 'package:goroga/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:goroga/presentation/sign_in_screen/binding/sign_in_binding.dart';
import 'package:goroga/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:goroga/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:goroga/presentation/profile_screen/profile_screen.dart';
import 'package:goroga/presentation/profile_screen/binding/profile_binding.dart';
import 'package:goroga/presentation/create_new_pin_screen/create_new_pin_screen.dart';
import 'package:goroga/presentation/create_new_pin_screen/binding/create_new_pin_binding.dart';
import 'package:goroga/presentation/set_fingerprint_screen/set_fingerprint_screen.dart';
import 'package:goroga/presentation/set_fingerprint_screen/binding/set_fingerprint_binding.dart';
import 'package:goroga/presentation/follow_artists_screen/follow_artists_screen.dart';
import 'package:goroga/presentation/follow_artists_screen/binding/follow_artists_binding.dart';
import 'package:goroga/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:goroga/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:goroga/presentation/filled_otp_screen/filled_otp_screen.dart';
import 'package:goroga/presentation/filled_otp_screen/binding/filled_otp_binding.dart';
import 'package:goroga/presentation/create_new_password_screen/create_new_password_screen.dart';
import 'package:goroga/presentation/create_new_password_screen/binding/create_new_password_binding.dart';
import 'package:goroga/presentation/home_container_screen/home_container_screen.dart';
import 'package:goroga/presentation/home_container_screen/binding/home_container_binding.dart';
import 'package:goroga/presentation/podcasts_notifications_tab_container_screen/podcasts_notifications_tab_container_screen.dart';
import 'package:goroga/presentation/podcasts_notifications_tab_container_screen/binding/podcasts_notifications_tab_container_binding.dart';
import 'package:goroga/presentation/trending_now_screen/trending_now_screen.dart';
import 'package:goroga/presentation/trending_now_screen/binding/trending_now_binding.dart';
import 'package:goroga/presentation/popular_artists_screen/popular_artists_screen.dart';
import 'package:goroga/presentation/popular_artists_screen/binding/popular_artists_binding.dart';
import 'package:goroga/presentation/charts_screen/charts_screen.dart';
import 'package:goroga/presentation/charts_screen/binding/charts_binding.dart';
import 'package:goroga/presentation/top_albums_global_screen/top_albums_global_screen.dart';
import 'package:goroga/presentation/top_albums_global_screen/binding/top_albums_global_binding.dart';
import 'package:goroga/presentation/new_releases_screen/new_releases_screen.dart';
import 'package:goroga/presentation/new_releases_screen/binding/new_releases_binding.dart';
import 'package:goroga/presentation/search_type_keyword_screen/search_type_keyword_screen.dart';
import 'package:goroga/presentation/search_type_keyword_screen/binding/search_type_keyword_binding.dart';
import 'package:goroga/presentation/song_play_screen/song_play_screen.dart';
import 'package:goroga/presentation/song_play_screen/binding/song_play_binding.dart';
import 'package:goroga/presentation/song_details_screen/song_details_screen.dart';
import 'package:goroga/presentation/song_details_screen/binding/song_details_binding.dart';
import 'package:goroga/presentation/lyrics_screen/lyrics_screen.dart';
import 'package:goroga/presentation/lyrics_screen/binding/lyrics_binding.dart';
import 'package:goroga/presentation/artist_details_screen/artist_details_screen.dart';
import 'package:goroga/presentation/artist_details_screen/binding/artist_details_binding.dart';
import 'package:goroga/presentation/album_details_screen/album_details_screen.dart';
import 'package:goroga/presentation/album_details_screen/binding/album_details_binding.dart';
import 'package:goroga/presentation/podcast_details_screen/podcast_details_screen.dart';
import 'package:goroga/presentation/podcast_details_screen/binding/podcast_details_binding.dart';
import 'package:goroga/presentation/podcast_episode_details_screen/podcast_episode_details_screen.dart';
import 'package:goroga/presentation/podcast_episode_details_screen/binding/podcast_episode_details_binding.dart';
import 'package:goroga/presentation/playlist_details_one_screen/playlist_details_one_screen.dart';
import 'package:goroga/presentation/playlist_details_one_screen/binding/playlist_details_one_binding.dart';
import 'package:goroga/presentation/search_result_profile_tab_container_screen/search_result_profile_tab_container_screen.dart';
import 'package:goroga/presentation/search_result_profile_tab_container_screen/binding/search_result_profile_tab_container_binding.dart';
import 'package:goroga/presentation/profile_details_screen/profile_details_screen.dart';
import 'package:goroga/presentation/profile_details_screen/binding/profile_details_binding.dart';
import 'package:goroga/presentation/followers_details_tab_container_screen/followers_details_tab_container_screen.dart';
import 'package:goroga/presentation/followers_details_tab_container_screen/binding/followers_details_tab_container_binding.dart';
import 'package:goroga/presentation/history_podcast_tab_container_screen/history_podcast_tab_container_screen.dart';
import 'package:goroga/presentation/history_podcast_tab_container_screen/binding/history_podcast_tab_container_binding.dart';
import 'package:goroga/presentation/playlists_screen/playlists_screen.dart';
import 'package:goroga/presentation/playlists_screen/binding/playlists_binding.dart';
import 'package:goroga/presentation/playlist_details_screen/playlist_details_screen.dart';
import 'package:goroga/presentation/playlist_details_screen/binding/playlist_details_binding.dart';
import 'package:goroga/presentation/downloads_screen/downloads_screen.dart';
import 'package:goroga/presentation/downloads_screen/binding/downloads_binding.dart';
import 'package:goroga/presentation/queue_tab_container_screen/queue_tab_container_screen.dart';
import 'package:goroga/presentation/queue_tab_container_screen/binding/queue_tab_container_binding.dart';
import 'package:goroga/presentation/albums_screen/albums_screen.dart';
import 'package:goroga/presentation/albums_screen/binding/albums_binding.dart';
import 'package:goroga/presentation/songs_screen/songs_screen.dart';
import 'package:goroga/presentation/songs_screen/binding/songs_binding.dart';
import 'package:goroga/presentation/artists_tab_container_screen/artists_tab_container_screen.dart';
import 'package:goroga/presentation/artists_tab_container_screen/binding/artists_tab_container_binding.dart';
import 'package:goroga/presentation/subscribe_screen/subscribe_screen.dart';
import 'package:goroga/presentation/subscribe_screen/binding/subscribe_binding.dart';
import 'package:goroga/presentation/payment_method_screen/payment_method_screen.dart';
import 'package:goroga/presentation/payment_method_screen/binding/payment_method_binding.dart';
import 'package:goroga/presentation/add_new_card_screen/add_new_card_screen.dart';
import 'package:goroga/presentation/add_new_card_screen/binding/add_new_card_binding.dart';
import 'package:goroga/presentation/select_payment_method_screen/select_payment_method_screen.dart';
import 'package:goroga/presentation/select_payment_method_screen/binding/select_payment_method_binding.dart';
import 'package:goroga/presentation/payment_summary_screen/payment_summary_screen.dart';
import 'package:goroga/presentation/payment_summary_screen/binding/payment_summary_binding.dart';
import 'package:goroga/presentation/profile_details_one_screen/profile_details_one_screen.dart';
import 'package:goroga/presentation/profile_details_one_screen/binding/profile_details_one_binding.dart';
import 'package:goroga/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:goroga/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:goroga/presentation/notification_settings_screen/notification_settings_screen.dart';
import 'package:goroga/presentation/notification_settings_screen/binding/notification_settings_binding.dart';
import 'package:goroga/presentation/audio_video_screen/audio_video_screen.dart';
import 'package:goroga/presentation/audio_video_screen/binding/audio_video_binding.dart';
import 'package:goroga/presentation/playback_screen/playback_screen.dart';
import 'package:goroga/presentation/playback_screen/binding/playback_binding.dart';
import 'package:goroga/presentation/data_saver_storage_screen/data_saver_storage_screen.dart';
import 'package:goroga/presentation/data_saver_storage_screen/binding/data_saver_storage_binding.dart';
import 'package:goroga/presentation/security_screen/security_screen.dart';
import 'package:goroga/presentation/security_screen/binding/security_binding.dart';
import 'package:goroga/presentation/language_screen/language_screen.dart';
import 'package:goroga/presentation/language_screen/binding/language_binding.dart';
import 'package:goroga/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:goroga/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String walkthroughScreen = '/walkthrough_screen';

  static const String letsYouInScreen = '/lets_you_in_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String profileScreen = '/profile_screen';

  static const String createNewPinScreen = '/create_new_pin_screen';

  static const String setFingerprintScreen = '/set_fingerprint_screen';

  static const String followArtistsScreen = '/follow_artists_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String filledOtpScreen = '/filled_otp_screen';

  static const String createNewPasswordScreen = '/create_new_password_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String songsNotificationsPage = '/songs_notifications_page';

  static const String podcastsNotificationsPage =
      '/podcasts_notifications_page';

  static const String podcastsNotificationsTabContainerScreen =
      '/podcasts_notifications_tab_container_screen';

  static const String trendingNowScreen = '/trending_now_screen';

  static const String popularArtistsScreen = '/popular_artists_screen';

  static const String chartsScreen = '/charts_screen';

  static const String topAlbumsGlobalScreen = '/top_albums_global_screen';

  static const String podcastsScreen = '/podcasts_screen';

  static const String newReleasesScreen = '/new_releases_screen';

  static const String explorePage = '/explore_page';

  static const String searchTypeKeywordScreen = '/search_type_keyword_screen';

  static const String searchResultTopPage = '/search_result_top_page';

  static const String songPlayScreen = '/song_play_screen';

  static const String songPlayOverScreenPage = '/song_play_over_screen_page';

  static const String songDetailsScreen = '/song_details_screen';

  static const String lyricsScreen = '/lyrics_screen';

  static const String artistSearchResultPage = '/artist_search_result_page';

  static const String artistDetailsScreen = '/artist_details_screen';

  static const String searchResultAlbumPage = '/search_result_album_page';

  static const String albumDetailsScreen = '/album_details_screen';

  static const String searchResultPodcastPage = '/search_result_podcast_page';

  static const String podcastDetailsScreen = '/podcast_details_screen';

  static const String podcastEpisodeDetailsScreen =
      '/podcast_episode_details_screen';

  static const String searchResultPlaylistPage = '/search_result_playlist_page';

  static const String playlistDetailsOneScreen = '/playlist_details_one_screen';

  static const String searchResultProfilePage = '/search_result_profile_page';

  static const String searchResultProfileTabContainerScreen =
      '/search_result_profile_tab_container_screen';

  static const String profileDetailsScreen = '/profile_details_screen';

  static const String followersDetailsPage = '/followers_details_page';

  static const String followersDetailsTabContainerScreen =
      '/followers_details_tab_container_screen';

  static const String myLibraryPage = '/my_library_page';

  static const String historyMusicPage = '/history_music_page';

  static const String historyPodcastPage = '/history_podcast_page';

  static const String historyPodcastTabContainerScreen =
      '/history_podcast_tab_container_screen';

  static const String playlistsScreen = '/playlists_screen';

  static const String playlistDetailsScreen = '/playlist_details_screen';

  static const String downloadsScreen = '/downloads_screen';

  static const String yourLikesPage = '/your_likes_page';

  static const String queuePage = '/queue_page';

  static const String queueTabContainerScreen = '/queue_tab_container_screen';

  static const String downloadedPage = '/downloaded_page';

  static const String albumsScreen = '/albums_screen';

  static const String songsScreen = '/songs_screen';

  static const String artistsPage = '/artists_page';

  static const String artistsTabContainerScreen =
      '/artists_tab_container_screen';

  static const String podcastersPage = '/podcasters_page';

  static const String profileSettingsPage = '/profile_settings_page';

  static const String subscribeScreen = '/subscribe_screen';

  static const String paymentMethodScreen = '/payment_method_screen';

  static const String addNewCardScreen = '/add_new_card_screen';

  static const String selectPaymentMethodScreen =
      '/select_payment_method_screen';

  static const String paymentSummaryScreen = '/payment_summary_screen';

  static const String profileDetailsOneScreen = '/profile_details_one_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String notificationSettingsScreen =
      '/notification_settings_screen';

  static const String audioVideoScreen = '/audio_video_screen';

  static const String playbackScreen = '/playback_screen';

  static const String dataSaverStorageScreen = '/data_saver_storage_screen';

  static const String securityScreen = '/security_screen';

  static const String languageScreen = '/language_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String detailsPage='/detail';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: walkthroughScreen,
      page: () => WalkthroughScreen(),
      bindings: [
        WalkthroughBinding(),
      ],
    ),
    GetPage(
      name: letsYouInScreen,
      page: () => LetsYouInScreen(),
      bindings: [
        LetsYouInBinding(),
      ],
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      bindings: [
        SignInBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: createNewPinScreen,
      page: () => CreateNewPinScreen(),
      bindings: [
        CreateNewPinBinding(),
      ],
    ),
    GetPage(
      name: setFingerprintScreen,
      page: () => SetFingerprintScreen(),
      bindings: [
        SetFingerprintBinding(),
      ],
    ),
    GetPage(
      name: followArtistsScreen,
      page: () => FollowArtistsScreen(),
      bindings: [
        FollowArtistsBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: filledOtpScreen,
      page: () => FilledOtpScreen(),
      bindings: [
        FilledOtpBinding(),
      ],
    ),
    GetPage(
      name: createNewPasswordScreen,
      page: () => CreateNewPasswordScreen(),
      bindings: [
        CreateNewPasswordBinding(),
      ],
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => HomeContainerScreen(),
      bindings: [
        HomeContainerBinding(),
      ],
    ),
    GetPage(
      name: podcastsNotificationsTabContainerScreen,
      page: () => PodcastsNotificationsTabContainerScreen(),
      bindings: [
        PodcastsNotificationsTabContainerBinding(),
      ],
    ),
    GetPage(
      name: trendingNowScreen,
      page: () => TrendingNowScreen(),
      bindings: [
        TrendingNowBinding(),
      ],
    ),
    GetPage(
      name: popularArtistsScreen,
      page: () => PopularArtistsScreen(),
      bindings: [
        PopularArtistsBinding(),
      ],
    ),
    GetPage(
      name: chartsScreen,
      page: () => ChartsScreen(),
      bindings: [
        ChartsBinding(),
      ],
    ),
    GetPage(
      name: topAlbumsGlobalScreen,
      page: () => TopAlbumsGlobalScreen(),
      bindings: [
        TopAlbumsGlobalBinding(),
      ],
    ),
    // GetPage(
    //   name: podcastsScreen,
    //   page: () => PodcastsScreen(imagePath:),
    //   bindings: [
    //     PodcastsBinding(),
    //   ],
    // ),
    GetPage(
      name: newReleasesScreen,
      page: () => NewReleasesScreen(),
      bindings: [
        NewReleasesBinding(),
      ],
    ),
    GetPage(
      name: searchTypeKeywordScreen,
      page: () => SearchTypeKeywordScreen(),
      bindings: [
        SearchTypeKeywordBinding(),
      ],
    ),
    GetPage(
      name: songPlayScreen,
      page: () => SongPlayScreen(),
      bindings: [
        SongPlayBinding(),
      ],
    ),
    GetPage(
      name: songDetailsScreen,
      page: () => SongDetailsScreen(),
      bindings: [
        SongDetailsBinding(),
      ],
    ),
    GetPage(
      name: lyricsScreen,
      page: () => LyricsScreen(),
      bindings: [
        LyricsBinding(),
      ],
    ),
    GetPage(
      name: artistDetailsScreen,
      page: () => ArtistDetailsScreen(),
      bindings: [
        ArtistDetailsBinding(),
      ],
    ),
    GetPage(
      name: albumDetailsScreen,
      page: () => AlbumDetailsScreen(),
      bindings: [
        AlbumDetailsBinding(),
      ],
    ),
    GetPage(
      name: podcastDetailsScreen,
      page: () => PodcastDetailsScreen(),
      bindings: [
        PodcastDetailsBinding(),
      ],
    ),
    GetPage(
      name: podcastEpisodeDetailsScreen,
      page: () => PodcastEpisodeDetailsScreen(),
      bindings: [
        PodcastEpisodeDetailsBinding(),
      ],
    ),
    GetPage(
      name: playlistDetailsOneScreen,
      page: () => PlaylistDetailsOneScreen(),
      bindings: [
        PlaylistDetailsOneBinding(),
      ],
    ),
    GetPage(
      name: searchResultProfileTabContainerScreen,
      page: () => SearchResultProfileTabContainerScreen(),
      bindings: [
        SearchResultProfileTabContainerBinding(),
      ],
    ),
    GetPage(
      name: profileDetailsScreen,
      page: () => ProfileDetailsScreen(),
      bindings: [
        ProfileDetailsBinding(),
      ],
    ),
    GetPage(
      name: followersDetailsTabContainerScreen,
      page: () => FollowersDetailsTabContainerScreen(),
      bindings: [
        FollowersDetailsTabContainerBinding(),
      ],
    ),
    GetPage(
      name: historyPodcastTabContainerScreen,
      page: () => HistoryPodcastTabContainerScreen(),
      bindings: [
        HistoryPodcastTabContainerBinding(),
      ],
    ),
    GetPage(
      name: playlistsScreen,
      page: () => PlaylistsScreen(),
      bindings: [
        PlaylistsBinding(),
      ],
    ),
    GetPage(
      name: playlistDetailsScreen,
      page: () => PlaylistDetailsScreen(),
      bindings: [
        PlaylistDetailsBinding(),
      ],
    ),
    GetPage(
      name: downloadsScreen,
      page: () => DownloadsScreen(),
      bindings: [
        DownloadsBinding(),
      ],
    ),
    GetPage(
      name: queueTabContainerScreen,
      page: () => QueueTabContainerScreen(),
      bindings: [
        QueueTabContainerBinding(),
      ],
    ),
    GetPage(
      name: albumsScreen,
      page: () => AlbumsScreen(),
      bindings: [
        AlbumsBinding(),
      ],
    ),
    GetPage(
      name: songsScreen,
      page: () => SongsScreen(),
      bindings: [
        SongsBinding(),
      ],
    ),
    GetPage(
      name: artistsTabContainerScreen,
      page: () => ArtistsTabContainerScreen(),
      bindings: [
        ArtistsTabContainerBinding(),
      ],
    ),
    GetPage(
      name: subscribeScreen,
      page: () => SubscribeScreen(),
      bindings: [
        SubscribeBinding(),
      ],
    ),
    GetPage(
      name: paymentMethodScreen,
      page: () => PaymentMethodScreen(),
      bindings: [
        PaymentMethodBinding(),
      ],
    ),
    GetPage(
      name: addNewCardScreen,
      page: () => AddNewCardScreen(),
      bindings: [
        AddNewCardBinding(),
      ],
    ),
    GetPage(
      name: selectPaymentMethodScreen,
      page: () => SelectPaymentMethodScreen(),
      bindings: [
        SelectPaymentMethodBinding(),
      ],
    ),
    GetPage(
      name: paymentSummaryScreen,
      page: () => PaymentSummaryScreen(),
      bindings: [
        PaymentSummaryBinding(),
      ],
    ),
    GetPage(
      name: profileDetailsOneScreen,
      page: () => ProfileDetailsOneScreen(),
      bindings: [
        ProfileDetailsOneBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: notificationSettingsScreen,
      page: () => NotificationSettingsScreen(),
      bindings: [
        NotificationSettingsBinding(),
      ],
    ),
    GetPage(
      name: audioVideoScreen,
      page: () => AudioVideoScreen(),
      bindings: [
        AudioVideoBinding(),
      ],
    ),
    GetPage(
      name: playbackScreen,
      page: () => PlaybackScreen(),
      bindings: [
        PlaybackBinding(),
      ],
    ),
    GetPage(
      name: dataSaverStorageScreen,
      page: () => DataSaverStorageScreen(),
      bindings: [
        DataSaverStorageBinding(),
      ],
    ),
    GetPage(
      name: securityScreen,
      page: () => SecurityScreen(),
      bindings: [
        SecurityBinding(),
      ],
    ),
    GetPage(
      name: languageScreen,
      page: () => LanguageScreen(),
      bindings: [
        LanguageBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    
   
  ];
}
