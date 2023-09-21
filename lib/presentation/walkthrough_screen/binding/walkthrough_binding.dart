import '../controller/walkthrough_controller.dart';
import 'package:get/get.dart';

class WalkthroughBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalkthroughController());
  }
}
