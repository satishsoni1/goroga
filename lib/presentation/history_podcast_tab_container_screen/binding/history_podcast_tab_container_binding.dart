import '../controller/history_podcast_tab_container_controller.dart';
import 'package:get/get.dart';

class HistoryPodcastTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryPodcastTabContainerController());
  }
}
