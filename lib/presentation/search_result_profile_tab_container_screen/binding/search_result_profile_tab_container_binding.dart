import '../controller/search_result_profile_tab_container_controller.dart';
import 'package:get/get.dart';

class SearchResultProfileTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchResultProfileTabContainerController());
  }
}
