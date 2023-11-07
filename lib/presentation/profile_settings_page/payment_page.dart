import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/profile_settings_page/controller/paymentController.dart';

import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class PaymentPage extends StatefulWidget {
  int? id;
  PaymentPage(this.id);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentController _paymentController = Get.put(PaymentController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Fetch payment data for the specific e_provider id
    _paymentController.fetchpaymentData(widget.id);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          height: getVerticalSize(80),
          leading: IconButton(
              onPressed: () {
                // print(widget.id);
                Get.back();
              },
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
                            '100',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'GST: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '100',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '-100',
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
                            '100',
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
                        // Handle the payment processing here
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
                        // Get.back();
                        // Handle the payment processing here
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
