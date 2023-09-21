import 'package:goroga/core/app_export.dart';import 'package:goroga/presentation/payment_summary_screen/models/payment_summary_model.dart';class PaymentSummaryController extends GetxController {Rx<PaymentSummaryModel> paymentSummaryModelObj = PaymentSummaryModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
