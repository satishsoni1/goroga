import '../controller/podcasts_notifications_tab_container_controller.dart';
import 'package:get/get.dart';

class PodcastsNotificationsTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PodcastsNotificationsTabContainerController());
  }
}
