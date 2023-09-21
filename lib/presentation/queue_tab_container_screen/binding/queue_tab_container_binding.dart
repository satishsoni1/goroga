import '../controller/queue_tab_container_controller.dart';
import 'package:get/get.dart';

class QueueTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QueueTabContainerController());
  }
}
