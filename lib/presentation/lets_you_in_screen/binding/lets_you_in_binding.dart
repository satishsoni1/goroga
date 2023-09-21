import '../controller/lets_you_in_controller.dart';
import 'package:get/get.dart';

class LetsYouInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LetsYouInController());
  }
}
