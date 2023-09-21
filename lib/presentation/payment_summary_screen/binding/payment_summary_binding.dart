import '../controller/payment_summary_controller.dart';
import 'package:get/get.dart';

class PaymentSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentSummaryController());
  }
}
