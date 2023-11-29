import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/home_page/controller/userDetailsController.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class PaymentPage extends StatefulWidget {
  final dynamic data;
  PaymentPage({required this.data});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // PaymentController _paymentController = Get.put(PaymentController());
  UserDetailsController _userDetailsController =
      Get.put(UserDetailsController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Razorpay? _razorpay;

  @override
  void initState() {
    super.initState();
    print(widget.data.price.toString());
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    // _razorpay?.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment is Successful");
    // print(razop);

    // Handle payment success
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment failed with error ");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("external wallet called");
    // Handle external wallet
  }

  void _startPayment(String? user_mob_no, String? userEmail, dynamic amount) {
    print(amount);
    double amountInPaisa = double.parse(amount);

    var options = {
      'key': 'rzp_test_R4IYtWXT0TYnrb',
      'amount': amountInPaisa * 100,
      'name': 'goroga',
      'description': 'Payment for services',
      'prefill': {
        'contact': user_mob_no,
        'email': userEmail,
      },
      'external': {
        'wallets': ['paytm'],
      },
    };

    try {
      print('hii');
      print(userEmail);
      print(user_mob_no);
      _razorpay?.open(options);
    } catch (e) {
      print('hello');
      print(e.toString());
    }
  }

  Widget build(BuildContext context) {
    dynamic totalPrice;
    totalPrice = ((widget.data.price) - (widget.data.discountPrice));
    dynamic roundedTotalPrice = totalPrice.toStringAsFixed(2);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          height: getVerticalSize(80),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          leadingWidth: 50,
          title: AppbarTitle(
            text: "Payment Summary".tr,
            margin: getMargin(left: 0),
          ),
        ),
        body: Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Appoinment Charges: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                          widget.data.price.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      // SizedBox(height: 20),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'GST: ',
                      //       style: TextStyle(fontSize: 18),
                      //     ),
                      //     Text(
                      //       '100',
                      //       style: TextStyle(fontSize: 18),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '- ' + (widget.data.discountPrice.toString()),
                            style: TextStyle(
                                fontSize: 18, color: ColorConstant.primary),
                          ),
                        ],
                      ),
                      Divider(height: 50, thickness: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            roundedTotalPrice.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          backgroundColor: ColorConstant.primary),
                      onPressed: () {
                        String? user_mob_no = _userDetailsController
                            .usersData.value.data?.phoneNumber;
                        String? userEmail =
                            _userDetailsController.usersData.value.data?.email;

                        _startPayment(
                            user_mob_no, userEmail, roundedTotalPrice);
                      },
                      child: Text('Proceeed to Payment',
                          style: TextStyle(
                              color: ColorConstant.whiteA700, fontSize: 18)),
                    ),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            side: BorderSide(color: ColorConstant.primary)),
                        // backgroundColor: ColorConstant.primary
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Cancel',
                          style: TextStyle(
                              color: ColorConstant.black900, fontSize: 18)),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
