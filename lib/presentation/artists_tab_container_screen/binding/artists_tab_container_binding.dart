import '../controller/artists_tab_container_controller.dart';
import 'package:get/get.dart';

class ArtistsTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtistsTabContainerController());
  }
}
