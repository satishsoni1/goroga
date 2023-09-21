import '../controller/followers_details_tab_container_controller.dart';
import 'package:get/get.dart';

class FollowersDetailsTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FollowersDetailsTabContainerController());
  }
}
